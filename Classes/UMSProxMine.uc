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
var bool bOnGround;
var vector SurfaceNormal;
var UMSProxMineDetector Detector;
var Actor Trail; 
var class<UMSProxMineDetector> DetectorClass;
var class<Actor> IdleFXClass, GlareIdleFXClass, AlertFXClass, GlareAlertFXClass, TrailFXClass;
var float IdleFXRate, AlertFXRate;
var float IdleCollisionRadius;
var int AlertTicks, MaxAlertTicks, NumTouching;
var int Health;

simulated function HitWall( vector HitNormal, actor Wall )
{
	local Texture T;

	T = GetHitTexture();
	if( T==None || (T.SurfaceType!=EST_Plant && T.SurfaceType!=EST_Flesh && T.SurfaceType!=EST_Carpet && T.SurfaceType!=EST_Snow) ) // Hard material...
	{
		Velocity = MirrorVectorByNormal(Velocity,HitNormal)*0.8f; // Reflect off Wall w/damping
		Speed = VSize(Velocity);
		if ( Level.NetMode != NM_DedicatedServer )
		{
			PlaySound(ImpactSound, SLOT_Misc, FMax(0.5, Speed/800) );
			if( !Level.bDropDetail && T!=None && T.SurfaceType==EST_Metal && Speed>300 ) // Make sparks on metal impact.
				Spawn(Class'SmallSpark',,,Location+HitNormal,rotator(HitNormal)).RemoteRole = ROLE_None;
		}
	}
	else // Soft
	{
		Velocity = MirrorVectorByNormal(Velocity,HitNormal)*0.4f; // Reflect off Wall w/damping
		Speed = VSize(Velocity);
	}
	RandSpin(100000);
	if ( Velocity.Z > 400 )
		Velocity.Z = 0.5 * (400 + Velocity.Z);
	else if ( Speed < 20 )
	{
		bBounce = False;
		SetPhysics(PHYS_None);
	}
}

simulated function PlayClick()
{
	PlaySound(MiscSound, SLOT_Misc);
}

function Explode(vector HitLocation, vector HitNormal)
{
	HurtRadius(Damage, 150, 'Exploded', MomentumTransfer, HitLocation);
	Spawn(class'FlameExplosion',,,Location + vect(0,0,10));
	Destroy();
}

function TakeDamage(int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType)
{
	// TODO: spark effect on non-lethal damage
	Health -= Damage;
	if ( Health <= 0 )
		Explode(Location, vect(0,0,0));
}

simulated function Destroyed()
{
	UMSDemoMarine(Owner).ActiveMines--;
    Detector.Destroy();
}

auto state Flying
{
	simulated function Landed(vector HitNormal)
	{
		local Rotator NewRot;

		SetTimer(0.1, False, 'PlayClick');
		Trail.LifeSpan = 5.0;
		SetPhysics(PHYS_Falling);

		NewRot = Rot(0, 0, 0);
		NewRot.Yaw = Rotation.Yaw;
		SetRotation(NewRot);
	
		bOnGround = True;
		PlaySound(ImpactSound);

		Detector = Spawn(DetectorClass, Owner,, Location);
		Detector.Mine = Self;
		Detector.IdleSound = IdleSound;
		Detector.AlertSound = AlertSound;
		Detector.IdleFXRate = IdleFXRate;
		Detector.AlertFXRate = AlertFXRate;
		Detector.IdleFXClass = IdleFXClass;
		Detector.GlareIdleFXClass = GlareIdleFXClass;
		Detector.AlertFXClass = AlertFXClass;
		Detector.GlareAlertFXClass = GlareAlertFXClass;
		Detector.MaxAlertTicks = MaxAlertTicks;
		Detector.GoToState('Idle');

		GoToState('');
	}

	function BeginState()
	{
		local float MaxZ;

		if ( Role == ROLE_Authority )
		{
			Trail = Spawn(TrailFXClass, Self,, Location);
			Velocity = Vector(Rotation) * Speed;

            if (Pawn(Owner) && !Pawn(Owner).bIsPlayer)
            {
                Velocity = (Pawn(Owner).LastSeenPos - Owner.Location);
                if (Pawn(Owner).LastSeenPos.Z > Owner.Location.Z)
                    MaxZ = 600;
                else
                    MaxZ = 300;
                Velocity.Z += Min(VSize(Pawn(Owner).LastSeenPos - Owner.Location), MaxZ);
            }
			bOnGround = False;
			PlaySound(SpawnSound);
		}
	}
}

defaultproperties
{
	CollisionHeight=3.5
	CollisionRadius=16.0
	IdleCollisionRadius=112.000000
	bProjTarget=True
	DrawType=DT_Mesh
	Mesh=StaticMesh'ProxMineMesh'
	SpawnSound=Sound'MineLaunch'
	ImpactSound=Sound'MineLand'
	MiscSound=Sound'MineSet'
	Speed=1000.000000
	Damage=200.000000
	MomentumTransfer=75000
	Physics=PHYS_Falling
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	bNetInterpolatePos=True
	ScaleGlow=4
	AmbientGlow=12
	DetectorClass=Class'UMSProxMineDetector'
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
