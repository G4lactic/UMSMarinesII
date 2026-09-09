//=============================================================================
// UMSProxMine
//=============================================================================
class UMSProxMine extends Projectile;

#exec OBJ LOAD FILE=NaliFX.utx

#exec MESH MODELIMPORT STATICMESH MODELFILE="Models/Other/ProxMine.obj" NAME=ProxMineMesh
#exec STATICMESH TRANSFORM NAME=ProxMineMesh ORIGIN=(0.0,0.0,0.0) SIZE=(1.05,1.05,1.05) YAW=0 PITCH=0 ROLL=0
#exec MESHMAP SETTEXTURE MESHMAP=ProxMineMesh NUM=0 TEXTURE=JProxSkin
#exec MESHMAP SETTEXTURE MESHMAP=ProxMineMesh NUM=1 TEXTURE=NaliFX.WLava

#exec AUDIO IMPORT FILE="Sounds\SFX\MineAlert.wav" NAME="MineAlert" GROUP="ProxMine"
#exec AUDIO IMPORT FILE="Sounds\SFX\MineIdle.wav" NAME="MineIdle" GROUP="ProxMine"
#exec AUDIO IMPORT FILE="Sounds\SFX\MineSet.wav" NAME="MineSet" GROUP="ProxMine"
#exec AUDIO IMPORT FILE="Sounds\SFX\MineLand.wav" NAME="MineLand" GROUP="ProxMine"
#exec AUDIO IMPORT FILE="Sounds\SFX\MineLaunch.wav" NAME="MineLaunch" GROUP="ProxMine"

var Sound IdleSound, AlertSound;
var bool bOnGround, bJustStateChanged;
var vector SurfaceNormal;
var Actor Trail, AlertFX, AlertGlare, IdleFX, IdleGlare;
var class<Actor> IdleFXClass, GlareIdleFXClass, AlertFXClass, GlareAlertFXClass, TrailFXClass;
var float IdleFXRate, AlertFXRate;
var float IdleCollisionRadius;
var int AlertTicks, MaxAlertTicks, NumTouching;
var int Health;

simulated function Touch(Actor Other)
{
	if (Other.Class == Class)
		return;

	if ( !IsInState('OnSurfaceAlert') )
		GoToState('OnSurfaceAlert');
	NumTouching++;
}

simulated function UnTouch(Actor Other)
{
	NumTouching--;
	if ( NumTouching <= 0 )
		GoToState('OnSurfaceIdle');
}

simulated function SetWall(vector HitNormal, Actor Wall)
{
	SurfaceNormal = HitNormal;
	SetRotation(rotator(HitNormal) + rotang(0,-90,90));
	if ( Mover(Wall) != None )
		SetBase(Wall);
}

simulated function PlayClick()
{
	PlaySound(MiscSound, SLOT_Misc);
}

function Explode(vector HitLocation, vector HitNormal)
{
	HurtRadius(Damage, 150, 'Exploded', MomentumTransfer, HitLocation);
	Spawn(class'FlameExplosion',,,Location + vect(0,0,10));
	IdleFX.Destroy();
	IdleGlare.Destroy();
	AlertFX.Destroy();
	AlertGlare.Destroy();
	Destroy();
}

function TakeDamage(int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType)
{
	Health -= Damage;
	if ( Health < 0 )
		Explode(Location, vect(0,0,0));
}

auto state Flying
{
	simulated function Landed(vector HitNormal)
	{
		local Rotator NewRot;

		SetTimer(0.1, False, 'PlayClick');
		Trail.LifeSpan = 5.0;
		SetPhysics(PHYS_None);

		NewRot = Rot(0, 0, 0);
		NewRot.Yaw = Rotation.Yaw;
		SetRotation(NewRot);
	
		bOnGround = True;
		PlaySound(ImpactSound);
		GoToState('OnSurfaceIdle');
	}

	function BeginState()
	{
		if ( Role == ROLE_Authority )
		{
			Trail = Spawn(TrailFXClass, Self,, Location);
			Velocity = Vector(Rotation) * Speed;

			// TODO: make Z velocity configurable, get throw height from owner?
			Velocity.Z += 80;
			bOnGround = False;
			PlaySound(SpawnSound);
		}
	}
}

state OnSurfaceIdle
{
	function BeginState()
	{
		SetCollisionSize(IdleCollisionRadius, Default.CollisionHeight + 64);
		bJustStateChanged = True;
		SetTimer(0.5, False);
	}

	function Timer()
	{
		// XXX: right slot?
		PlaySound(IdleSound, SLOT_Misc);
		IdleFX=Spawn(IdleFXClass, Self,, Location);
		IdleGlare=Spawn(GlareIdleFXClass, Self,, Location + vect(0,0,6));
		if (bJustStateChanged)
		{
			bJustStateChanged = False;
			SetTimer(IdleFXRate, True);
		}
	}
}

state OnSurfaceAlert
{
	function BeginState()
	{
		//SetCollisionSize(Default.CollisionRadius, Default.CollisionHeight);
		bJustStateChanged = True;
		AlertTicks = 0;
		IdleFX.Destroy();
		IdleGlare.Destroy();
		AlertFX = Spawn(AlertFXClass, Self,, Location);
		AlertGlare = Spawn(GlareAlertFXClass, Self,, Location + vect(0,0,6));
		SetTimer(0.1, False);
	}

	function EndState()
	{
		AlertFX.LifeSpan = 0.3;
		AlertGlare.LifeSpan = 0.3;
	}

	function Timer()
	{
		PlaySound(AlertSound, SLOT_None);
		if (bJustStateChanged)
		{
			bJustStateChanged = False;
			SetTimer(AlertFXRate, True);
		}

		Log(AlertTicks);
		if (NumTouching > 0)
			AlertTicks++;

		if (AlertTicks >= MaxAlertTicks)
			Explode(Location, vect(0,0,0));
	}
}

defaultproperties
{
	CollisionHeight=3.500000
	CollisionRadius=16.000000
	IdleCollisionRadius=112.000000
	DrawType=DT_Mesh
	Mesh=StaticMesh'ProxMineMesh'
	SpawnSound=Sound'MineLaunch'
	ImpactSound=Sound'MineLand'
	MiscSound=Sound'MineSet'
	Speed=800.000000
	Damage=200.000000
	MomentumTransfer=175000
	Physics=PHYS_Falling
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	bNetInterpolatePos=True
	ScaleGlow=4
	AmbientGlow=12
	TrailFXClass=Class'UMSProxyFX_Trail'
	IdleSound=Sound'MineIdle'
	AlertSound=Sound'MineAlert'
	IdleFXClass=Class'UMSProxyFX_RingCalm'
	GlareIdleFXClass=Class'UMSProxyFX_GlareCalm'
	AlertFXClass=Class'UMSProxyFX_RingAlert'
	GlareAlertFXClass=Class'UMSProxyFX_GlareAlert'
	IdleFXRate=2.0
	AlertFXRate=0.2
	MaxAlertTicks=3
	Health=50
}