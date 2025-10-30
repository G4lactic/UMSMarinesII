//=============================================================================
// UMSDroneCarcass.
//=============================================================================
class UMSDroneCarcass expands HumanCarcass;

#exec TEXTURE IMPORT NAME=JDgib1 FILE=Textures\Skins\slxangib.PCX GROUP=Skins FLAGS=2

#exec MESH IMPORT MESH=DroneHead ANIVFILE=Models\UMSCombatDrone\LiandriBotHead_a.3d DATAFILE=Models\UMSCombatDrone\LiandriBotHead_d.3d X=0 Y=0 Z=0 MLOD=0
#exec MESH ORIGIN MESH=DroneHead X=0 Y=0 Z=0 YAW=0 PITCH=0 ROLL=0

#exec MESHMAP NEW MESHMAP=DroneHead MESH=DroneHead
#exec MESHMAP SCALE MESHMAP=DroneHead X=0.6 Y=0.6 Z=1.2

#exec MESH SEQUENCE MESH=DroneHead SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP SETTEXTURE MESHMAP=DroneHead NUM=0 TEXTURE=JDgib1

#exec MESH IMPORT MESH=DroneTorso ANIVFILE=Models\UMSCombatDrone\LiandriBotTorso_a.3d DATAFILE=Models\UMSCombatDrone\LiandriBotTorso_d.3d X=0 Y=0 Z=0 MLOD=0
#exec MESH ORIGIN MESH=DroneTorso X=0 Y=0 Z=0 YAW=0 PITCH=0 ROLL=0

#exec MESHMAP NEW MESHMAP=DroneTorso MESH=DroneTorso
#exec MESHMAP SCALE MESHMAP=DroneTorso X=0.6 Y=0.6 Z=1.2

#exec MESHMAP SETTEXTURE MESHMAP=DroneTorso NUM=0 TEXTURE=JDgib1

#exec MESH SEQUENCE MESH=DroneTorso SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESH IMPORT MESH=DroneRightArm ANIVFILE=Models\UMSCombatDrone\LiandriBotArm_a.3d DATAFILE=Models\UMSCombatDrone\LiandriBotArm_d.3d X=0 Y=0 Z=0 MLOD=0
#exec MESH ORIGIN MESH=DroneRightArm X=0 Y=0 Z=0 YAW=0 PITCH=0 ROLL=0

#exec MESHMAP NEW MESHMAP=DroneRightArm MESH=DroneRightArm
#exec MESHMAP SCALE MESHMAP=DroneRightArm X=0.6 Y=0.6 Z=1.2

#exec MESH SEQUENCE MESH=DroneRightArm SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP SETTEXTURE MESHMAP=DroneRightArm NUM=0 TEXTURE=JDgib1

#exec MESH IMPORT MESH=DroneLeftArm ANIVFILE=Models\UMSCombatDrone\LiandriBotArm_a.3d DATAFILE=Models\UMSCombatDrone\LiandriBotArm_d.3d X=0 Y=0 Z=0 MLOD=0 UNMIRROR=1
#exec MESH ORIGIN MESH=DroneLeftArm X=0 Y=0 Z=0 YAW=0 PITCH=0 ROLL=0

#exec MESHMAP NEW MESHMAP=DroneLeftArm MESH=DroneLeftArm
#exec MESHMAP SCALE MESHMAP=DroneLeftArm X=0.6 Y=0.6 Z=1.2

#exec MESH SEQUENCE MESH=DroneLeftArm SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP SETTEXTURE MESHMAP=DroneLeftArm NUM=0 TEXTURE=JDgib1

#exec MESH IMPORT MESH=DroneHip ANIVFILE=Models\UMSCombatDrone\LiandriBotHip_a.3d DATAFILE=Models\UMSCombatDrone\LiandriBotHip_d.3d X=0 Y=0 Z=0 MLOD=0
#exec MESH ORIGIN MESH=DroneHip X=0 Y=0 Z=0 YAW=0 PITCH=0 ROLL=0

#exec MESHMAP NEW MESHMAP=DroneHip MESH=DroneHip
#exec MESHMAP SCALE MESHMAP=DroneHip X=0.6 Y=0.6 Z=1.2

#exec MESH SEQUENCE MESH=DroneHip SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP SETTEXTURE MESHMAP=DroneHip NUM=0 TEXTURE=JDgib1

#exec MESH IMPORT MESH=DroneRightLeg ANIVFILE=Models\UMSCombatDrone\LiandriBotLeg_a.3d DATAFILE=Models\UMSCombatDrone\LiandriBotLeg_d.3d X=0 Y=0 Z=0 MLOD=0
#exec MESH ORIGIN MESH=DroneRightLeg X=0 Y=0 Z=0 YAW=0 PITCH=0 ROLL=0

#exec MESHMAP NEW MESHMAP=DroneRightLeg MESH=DroneRightLeg
#exec MESHMAP SCALE MESHMAP=DroneRightLeg X=0.6 Y=0.6 Z=1.2

#exec MESH SEQUENCE MESH=DroneRightLeg SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP SETTEXTURE MESHMAP=DroneRightLeg NUM=0 TEXTURE=JDgib1

#exec MESH IMPORT MESH=DroneLeftLeg ANIVFILE=Models\UMSCombatDrone\LiandriBotLeg_a.3d DATAFILE=Models\UMSCombatDrone\LiandriBotLeg_d.3d X=0 Y=0 Z=0 MLOD=0 UNMIRROR=1
#exec MESH ORIGIN MESH=DroneLeftLeg X=0 Y=0 Z=0 YAW=0 PITCH=0 ROLL=0

#exec MESHMAP NEW MESHMAP=DroneLeftLeg MESH=DroneLeftLeg
#exec MESHMAP SCALE MESHMAP=DroneLeftLeg X=0.6 Y=0.6 Z=1.2

#exec MESH SEQUENCE MESH=DroneLeftLeg SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP SETTEXTURE MESHMAP=DroneLeftLeg NUM=0 TEXTURE=JDgib1

//#exec AUDIO IMPORT FILE="..\LiandriBot\Sounds\RobotGib1.wav" NAME="LiandriBotGib1"
#exec AUDIO IMPORT FILE="Sounds\SFX\RobotGib2.wav" NAME="DroneGib1" GROUP="SFX"

var float LastHit;
var bool bJerking;
var name Jerks[4];

replication
{
	// Things the server should send to the client.
	unreliable if( Role==ROLE_Authority )
		LastHit, bJerking;
}

function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, 
						Vector Momentum, name DamageType)
{	
	if ( bJerking || (AnimSequence == 'Dead9') )
	{
		bJerking = true;
		if ( Damage < 23 )
			LastHit = Level.TimeSeconds;
		else 
			bJerking = false;
	}
	
	Spawn(class'UMSDroneHitEffect',,,HitLocation, rotator(Momentum));

	if ( !bPermanent )
	{
		if ( (DamageType == 'Corroded') && (Damage >= 100) )
		{
			bCorroding = true;
			GotoState('Corroding');
		}
		else
		{
			if ( !bDecorative )
			{
				bBobbing = false;
				SetPhysics(PHYS_Falling);
			}
			if ( (Physics == PHYS_None) && (Momentum.Z < 0) )
				Momentum.Z *= -1;
			Velocity += 3 * momentum/(Mass + 200);
			if ( DamageType == 'shot' )
				Damage *= 0.4;
			CumulativeDamage += Damage;
			if ( (((Damage > 30) || !IsAnimating()) && (CumulativeDamage > 0.8 * Mass)) || (Damage > 0.4 * Mass) 
				|| ((Velocity.Z > 150) && !IsAnimating()) )
				ChunkUp(Damage);
			if ( bDecorative )
				Velocity = vect(0,0,0);
		}
	}


	if ( bJerking )
	{
		CumulativeDamage = 50;
		Velocity.Z = FMax(Velocity.Z, 40);
		if ( InstigatedBy == None )
		{
			bJerking = false;
			PlayAnim('Dead9B', 1.1, 0.1);
		}
	}
	if ( bJerking && (VSize(InstigatedBy.Location - Location) < 150)
		&& (InstigatedBy.Acceleration != vect(0,0,0))
		&& ((Normal(InstigatedBy.Velocity) Dot Normal(Location - InstigatedBy.Location)) > 0.7) )
	{
		bJerking = false;
		PlayAnim('Dead9B', 1.1, 0.1);
	}
}

function AnimEnd()
{
	local name NewAnim;

	if ( AnimSequence == 'Dead9' )
		bJerking = true;

	if ( !bJerking )
		Super.AnimEnd();
	else if ( (Level.TimeSeconds - LastHit < 0.2) && (FRand() > 0.02) )
	{
		NewAnim = Jerks[Rand(4)];
		if ( NewAnim == AnimSequence )
		{
			if ( NewAnim == Jerks[0] )
				NewAnim = Jerks[1];
			else
				NewAnim = Jerks[0];
		}
		TweenAnim(NewAnim, 0.15);
	}
	else
	{
		bJerking = false;
		PlayAnim('Dead9B', 1.1, 0.1);
	}
}

function CreateReplacement()
{
	local MasterCreatureChunk carc;
	
	if (bHidden)
		return;

	Spawn(class'UMSDroneHitEffect',,,Location, rot(-16384,0,0));
	

	carc = Spawn(Class'UMSDroneMasterChunk',Self,, Location + CollisionHeight * vect(0,0,0.5)); 
	if (carc != None)
	{
		carc.Initfor(self);
		carc.Bugs = Bugs;
		if ( Bugs != None )
			Bugs.SetBase(carc);
		Bugs = None;
	}
	else if ( Bugs != None )
		Bugs.Destroy();
}


simulated function Landed(vector HitNormal)
{
	local rotator finalRot;

	if ( (Velocity.Z < -1000) && !bPermanent )
	{
		ChunkUp(200);
		return;
	}

	finalRot = Rotation;
	finalRot.Roll = 0;
	finalRot.Pitch = 0;
	setRotation(finalRot);
	SetPhysics(PHYS_None);
	SetCollision(bCollideActors, false, false);
	if ( HitNormal.Z < 0.99 )
		ReducedHeightFactor = 0.1;
	if ( HitNormal.Z < 0.93 )
		ReducedHeightFactor = 0.0;
	if ( !IsAnimating() )
		LieStill();

	if ( Level.NetMode == NM_DedicatedServer )
		return;
}


simulated function HitWall(vector HitNormal, actor Wall)
{
	Velocity = 0.7 * (Velocity - 2 * HitNormal * (Velocity Dot HitNormal));
	Velocity.Z *= 0.9;
	if ( Abs(Velocity.Z) < 120 )
	{
		bBounce = false;
		Disable('HitWall');
	}
}


function GibSound()
{
	PlaySound(Sound'UMSMarinesII.DroneGib1', SLOT_Interact, 0.06 * Mass);
}


function Initfor(actor Other)
{
	local int i;

	if ( bDecorative )
	{
		DeathZone = Region.Zone;
		DeathZone.NumCarcasses++;
	}
	bDecorative = false;
	bMeshCurvy = Other.bMeshCurvy;
	bMeshEnviroMap = Other.bMeshEnviroMap;
	Mesh = Other.Mesh;
	Skin = Other.Skin;
	texture = Other.Texture;
	for ( i=0; i<ArrayCount(MultiSkins); i++ )
		MultiSkins[i] = Other.MultiSkins[i];
	Fatness = Other.Fatness;
	DrawScale = Other.DrawScale;
	Style=Other.Style;
	SetCollisionSize(Other.CollisionRadius + 4, Other.CollisionHeight);
	if ( !SetLocation(Location) )
		SetCollisionSize(CollisionRadius - 4, CollisionHeight);

	DesiredRotation = other.Rotation;
	DesiredRotation.Roll = 0;
	DesiredRotation.Pitch = 0;
	AnimSequence = Other.AnimSequence;
	AnimFrame = Other.AnimFrame;
	AnimRate = Other.AnimRate;
	TweenRate = Other.TweenRate;
	AnimMinRate = Other.AnimMinRate;
	AnimLast = Other.AnimLast;
	bAnimLoop = Other.bAnimLoop;
	SimAnim.X = 10000 * AnimFrame;
	SimAnim.Y = 5000 * AnimRate;
	SimAnim.Z = 1000 * TweenRate;
	SimAnim.W = 10000 * AnimLast;
	bAnimFinished = Other.bAnimFinished;
	Velocity = other.Velocity;
	Mass = Other.Mass;
	if ( Buoyancy < 0.8 * Mass )
		Buoyancy = 0.9 * Mass;
	if (Other.isa('ScriptedPawn'))
		bGreenBlood=ScriptedPawn(Other).bGreenBlood;

	PrePivot = vect(0,0,3);
}


function LandThump()
{
	local float impact;

	if ( Physics == PHYS_None)
	{
		bThumped = true;
		if ( Role == ROLE_Authority )
		{
			impact = 0.75 + Velocity.Z * 0.004;
			impact = Mass * impact * impact * 0.015;
			PlaySound(LandedSound,, impact);
			if ( Mass >= 500 )
				ThrowOthers();
		}

	}
}

defaultproperties
{
	Jerks(0)="GutHit"
	Jerks(1)="HeadHit"
	Jerks(2)="LeftHit"
	Jerks(3)="RightHit"
	AnimSequence="Dead1"
	bBlockActors=True
	bBlockPlayers=True
	Mass=100.000000
	MasterReplacement=Class'LiandriBot.UMSDroneMasterChunk'
}