//=============================================================================
//   spb - Asgard
//   Source code rights:
//   Copyright 2005 Asgard. All right reserved.
//   asgard12000@iprimus.com.au
//   http://www.angelfire.com/empire/napali/
//
//	 BeamingIn state resides here. -- GFour
//=============================================================================
class UMSSpaceMarineBase extends UMSSM abstract;

/*
#exec mesh IMPORT MESH=combatsuit ANIVFILE=MODELS\combatsuit_a.3d DATAFILE=MODELS\combatsuit_d.3d X=0 Y=0 Z=0
#exec mesh ORIGIN MESH=combatsuit X=0 Y=0 Z=57

#exec mesh SEQUENCE MESH=combatsuit SEQ=All         STARTFRAME=0 NUMFRAMES=1
#exec mesh SEQUENCE MESH=combatsuit SEQ=COMBATSUITM STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP new   MESHMAP=combatsuit MESH=combatsuit
#exec MESHMAP scale MESHMAP=combatsuit X=0.1 Y=0.1 Z=0.2

#exec texture IMPORT NAME=I_Arcticmarine FILE=MODELS\i_arcticmarine.PCX GROUP="Icons" MIPS=OFF
#exec texture IMPORT NAME=I_Desertmarine FILE=MODELS\i_desertmarine.PCX GROUP="Icons" MIPS=OFF
#exec texture IMPORT NAME=I_Junglemarine FILE=MODELS\i_junglemarine.PCX GROUP="Icons" MIPS=OFF
#exec texture IMPORT NAME=I_MarineSuit   FILE=MODELS\i_MarineSuit.PCX   GROUP="Icons" MIPS=OFF
*/

#exec OBJ LOAD FILE=..\Sounds\Ambmodern.uax
#exec AUDIO IMPORT FILE="Sounds\MAmb.WAV" NAME="MAmb" GROUP="MarineSuit"
#exec AUDIO IMPORT FILE="Sounds\PowerON.WAV" NAME="PowerON" GROUP="Marinsuit"
#exec AUDIO IMPORT FILE="Sounds\PowerOFF.WAV" NAME="PowerOFF" GROUP="Marinsuit"
#exec AUDIO IMPORT FILE="Sounds\sirmale.WAV" NAME="sirmale" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\sirfemale.WAV" NAME="sirfemale" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\clank.WAV" NAME="clank" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\snore.WAV" NAME="snore" GROUP="Marine"

#exec AUDIO IMPORT FILE="Sounds\stepm.WAV" NAME="stepm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\stepf.WAV" NAME="stepf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\gladm.WAV" NAME="gladm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\gladf.WAV" NAME="gladf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\bodiesm.WAV" NAME="bodiesm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\bodiesf.WAV" NAME="bodiesf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\moveonm.WAV" NAME="moveonm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\moveonf.WAV" NAME="moveonf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\howm.WAV" NAME="howm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\howf.WAV" NAME="howf" GROUP="Marine"

#exec AUDIO IMPORT FILE="Sounds\hopelessm.WAV" NAME="hopelessm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\hopelessf.WAV" NAME="hopelessf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\bastm.WAV" NAME="bastm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\bastf.WAV" NAME="bastf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\closem.WAV" NAME="closem" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\closef.WAV" NAME="closef" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\hellm.WAV" NAME="hellm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\hellf.WAV" NAME="hellf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\godm.WAV" NAME="godm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\godf.WAV" NAME="godf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\nightm.WAV" NAME="nightm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\nightf.WAV" NAME="nightf" GROUP="Marine
#exec AUDIO IMPORT FILE="Sounds\startm.WAV" NAME="startm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\startf.WAV" NAME="startf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\atlastm.WAV" NAME="atlastm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\atlastf.WAV" NAME="atlastf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\luckym.WAV" NAME="luckym" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\luckyf.WAV" NAME="luckyf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\sprintm.WAV" NAME="sprintm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\sprintf.WAV" NAME="sprintf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\expectm.WAV" NAME="expectm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\expectf.WAV" NAME="expectf" GROUP="Marine"


#exec AUDIO IMPORT FILE="Sounds\friendlyff.WAV" NAME="friendlyfF" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\friendlyfm.WAV" NAME="friendlyfM" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\coastf.WAV" NAME="coastf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\coastm.WAV" NAME="coastm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\lookoutf.WAV" NAME="lookoutf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\lookoutm.WAV" NAME="lookoutm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\incomingf.WAV" NAME="incomingf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\incomingm.WAV" NAME="incomingm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\onmywayf.WAV" NAME="onmywayf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\onmywaym.WAV" NAME="onmywaym" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\infestf.WAV" NAME="infestf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\infestm.WAV" NAME="infestm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\letsgof.WAV" NAME="letsgof" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\letsgom.WAV" NAME="letsgom" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\saddlef.WAV" NAME="saddlef" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\saddlem.WAV" NAME="saddlem" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\whatthehellf.WAV" NAME="whatthehellf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\whatthehellm.WAV" NAME="whatthehellm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\beforef.WAV" NAME="beforef" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\beforem.WAV" NAME="beforem" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\getf.WAV" NAME="getf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\getm.WAV" NAME="getm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\rogerf.WAV" NAME="rogerf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\rogerm.WAV" NAME="rogerm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\negativef.WAV" NAME="negativef" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\negativem.WAV" NAME="negativem" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\scratchf.WAV" NAME="scratchf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\scratchm.WAV" NAME="scratchm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\wasteammof.WAV" NAME="wasteammof" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\wasteammom.WAV" NAME="wasteammom" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\sorryf.WAV" NAME="sorryf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\sorrym.WAV" NAME="sorrym" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\gotemf.WAV" NAME="gotemf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\gotemm.WAV" NAME="gotemm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\UhOhf.WAV" NAME="UhOhf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\UhOhm.WAV" NAME="UhOhm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\betterf.WAV" NAME="betterf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\dammgoodm.WAV" NAME="dammgoodm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\blowupf.WAV" NAME="blowupf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\livinm.WAV" NAME="livinm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\marksmanf.WAV" NAME="marksmanf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\cockym.WAV" NAME="cockym" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\herof.WAV" NAME="herof" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\doitagainm.WAV" NAME="doitagainm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\welldonef.WAV" NAME="welldonef" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\niceworkm.WAV" NAME="niceworkm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\missionf.WAV" NAME="missionf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\tooeasym.WAV" NAME="tooeasym" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\tooeasym2.WAV" NAME="tooeasym2" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\takethatf.WAV" NAME="takethatf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\ashesm.WAV" NAME="ashesm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\messf.WAV" NAME="messf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\messm.WAV" NAME="messm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\nastyf.WAV" NAME="nastyf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\thathurtm.WAV" NAME="thathurtm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\rockf.WAV" NAME="rockf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\rockm.WAV" NAME="rockm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\covermef.WAV" NAME="covermef" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\covermem.WAV" NAME="covermem" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\bestf.WAV" NAME="bestf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\seethatm.WAV" NAME="seethatm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\woof.WAV" NAME="woof" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\lockm.WAV" NAME="lockm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\wasclosef.WAV" NAME="wasclosef" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\quietm.WAV" NAME="quietm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\hif.WAV" NAME="hif" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\hif2.WAV" NAME="hif2" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\him.WAV" NAME="him" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\him2.WAV" NAME="him2" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\playf.WAV" NAME="playf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\nextonem.WAV" NAME="nextonem" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\prepf.WAV" NAME="prepf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\prepm.WAV" NAME="prepm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\adownf.WAV" name="adownf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\sdownm.WAV" name="sdownm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\takeemf.WAV" name="takeemf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\takeemm.WAV" name="takeemm" GROUP="Marine"

#exec AUDIO IMPORT FILE="Sounds\seeyaf.WAV" NAME="seeyaf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\seeyam.WAV" NAME="seeyam" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\seeyaf2.WAV" NAME="seeyaf2" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\seeyam2.WAV" NAME="seeyam2" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\backupf.WAV" NAME="backupf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\backupm.WAV" NAME="backupm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\hellof.WAV" NAME="hellof" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\hellom.WAV" NAME="hellom" GROUP="Marine"

#exec AUDIO IMPORT FILE="Sounds\brbackf.WAV" NAME="brbackf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\brbackm.WAV" name="brbackm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\breakf.WAV" NAME="breakf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\breakm.WAV" name="breakm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\sloggingf.WAV" NAME="sloggingf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\sloggingm.WAV" name="sloggingm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\heref.WAV" name="heref" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\herem.WAV" name="herem" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\imgoodf.WAV" name="imgoodf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\imgoodm.WAV" name="imgoodm" GROUP="Marine"

#exec AUDIO IMPORT FILE="Sounds\companyf.WAV" name="companyf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\companym.WAV" name="companym" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\gogom.WAV" name="gogom" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\gogof.WAV" name="gogof" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\moveitm.WAV" name="moveitm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\movem.WAV" name="movem" GROUP="Marine"

#exec AUDIO IMPORT FILE="Sounds\imonitf.WAV" name="imonitf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\imonitm.WAV" name="imonitm" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\affirmativef.WAV" name="affirmativef" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\affirmativem.WAV" name="affirmativem" GROUP="Marine"

#exec AUDIO IMPORT FILE="Sounds\willdom.WAV" name="willdom" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\aquiref.WAV" name="aquiref" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\okf.WAV" name="okf" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\yougotitm.WAV" name="yougotitm" GROUP="Marine"

#exec AUDIO IMPORT FILE="Sounds\ten4f.WAV" name="ten4f" GROUP="Marine"
#exec AUDIO IMPORT FILE="Sounds\ten4m.WAV" name="ten4m" GROUP="Marine"

#exec OBJ LOAD FILE=Textures\beam.utx PACKAGE=UMSMarinesII.BeamEffect
#exec AUDIO IMPORT FILE="SOUNDS\CloakOff.WAV" NAME="BeamedIn" GROUP="Beam"

#exec texture IMPORT NAME=MCloak FILE=Models\MCloak.PCX GROUP="Marinsuit"
#exec AUDIO IMPORT FILE="Sounds\MCloakL.WAV" NAME="MCloakL" GROUP="Marinsuit"


var float Accuracy;

var(Sounds) sound drown;
var(Sounds) sound	breathagain;
var(Sounds) sound	Footstep1;
var(Sounds) sound	Footstep2;
var(Sounds) sound	Footstep3;
var(Sounds) sound	HitSound3;
var(Sounds) sound	HitSound4;
var(Sounds) sound	Die2;
var(Sounds) sound	Die3;
var(Sounds) sound	Die4;
var(Sounds) sound	GaspSound;
var(Sounds) sound	UWHit1;
var(Sounds) sound	UWHit2;
var(Sounds) sound LandGrunt;
var(Sounds) sound	JumpSound;

var UMSBeamShieldEffect BeamEffect;
var(SpaceMarine) class<weapon> WeaponType;
var	  Weapon myWeapon;

var(SpaceMarine) string HumanKillMessage;
Var(SpaceMarine) int DispPowerLevel;

var bool strafedodge;
var bool bBeamingIn;
//var UMSMarineWaveTool MarineBeamController;
var Effects Octagon;

Function PostBeginPlay()
{
	if( !Level.Game.bDeathMatch && FRand() < 0.5 )
		SetFemaleGender();
}

function SetFemaleGender()
{
	drown=Sound'UnrealShare.Female.mdrown2fem';
	breathagain=Sound'UnrealShare.Female.hgasp3fem';
	Footstep1=Sound'UnrealShare.Female.stwalk1';
	Footstep2=Sound'UnrealShare.Female.stwalk2';
	Footstep3=Sound'UnrealShare.Female.stwalk3';
	HitSound3=Sound'UnrealShare.Female.linjur3fem';
	HitSound4=Sound'UnrealShare.Female.hinjur4fem';
	Die2=Sound'UnrealShare.Female.death3cfem';
	Die3=Sound'UnrealShare.Female.death2afem';
	Die4=Sound'UnrealShare.Female.death4cfem';
	GaspSound=Sound'UnrealShare.Female.lgasp1fem';
	UWHit1=Sound'UnrealShare.Female.FUWHit1';
	UWHit2=Sound'UnrealShare.Female.FUWHit1';
	LandGrunt=Sound'UnrealShare.Female.lland1fem';
	JumpSound=Sound'UnrealShare.Female.jump1fem';
	HitSound1=Sound'UnrealShare.Female.linjur1fem';
	HitSound2=Sound'UnrealShare.Female.linjur2fem';
	Die=Sound'UnrealShare.Female.death1dfem';
	//bFemale = true;
	bIsFemale = true;
}


function HaltFiring()
{
	bCanFire = false;
	bFire = 0;
	bAltFire = 0;
	SetTimer((0.75 + 0.5 * FRand()) * TimeBetweenAttacks, false);
	if ( Weapon != None )
		Weapon.Tick(0.001);
}

function SpecialFire()
{
	if ( Health <= 0 || bDeleteme)
		return;
	bFiringPaused = true;
	SpecialPause = 0.75 + VSize(Target.Location - Location)/Weapon.AltProjectileSpeed;
	NextState = 'Attacking';
	NextLabel = 'Begin';
	Acceleration = vect(0,0,0);
	GotoState('RangedAttack');
}

function PlayHitAnim(vector HitLocation, float Damage)
{
	NextAnim = '';
	NextState = 'TakeHit';
	PlayTakeHit(0.08, hitLocation, Damage);
}

simulated function PlayFootStep()
{
	local sound step;
	local float decision;

	if ( FootRegion.Zone.bWaterZone )
	{
		PlaySound(sound 'LSplash', SLOT_Interact, 1, false, 1500.0, 1.0);
		return;
	}

	decision = FRand();
	if ( decision < 0.34 )
		step = Footstep1;
	else if (decision < 0.67 )
		step = Footstep2;
	else
		step = Footstep3;

	if ( DesiredSpeed <= 0.5 )
		PlaySound(step, SLOT_Interact, 0.5, false, 400.0, 1.0);
	else
		PlaySound(step, SLOT_Interact, 1, false, 1200.0, 1.0);
}

function PlayDyingSound()
{
	local float rnd;

	if ( HeadRegion.Zone.bWaterZone )
	{
		if ( FRand() < 0.5 )
			PlaySound(UWHit1, SLOT_Pain,2.0,,,Frand()*0.2+0.9);
		else
			PlaySound(UWHit2, SLOT_Pain,2.0,,,Frand()*0.2+0.9);
		return;
	}

	rnd = FRand();
	if (rnd < 0.25)
		PlaySound(Die, SLOT_Talk,2.0);
	else if (rnd < 0.5)
		PlaySound(Die2, SLOT_Talk,2.0);
	else if (rnd < 0.75)
		PlaySound(Die3, SLOT_Talk,2.0);
	else
		PlaySound(Die4, SLOT_Talk,2.0);
}

function Gasp()
{
	if ( PainTime < 2 )
		PlaySound(GaspSound, SLOT_Talk, 2.0);
	else
		PlaySound(BreathAgain, SLOT_Talk, 2.0);
}

function ZoneChange(ZoneInfo newZone)
{
	local vector jumpDir;

	if ( newZone.bWaterZone )
	{
		if (!bCanSwim)
			MoveTimer = -1.0;
		else if (Physics != PHYS_Swimming)
		{
			if (Physics != PHYS_Falling)
				PlayDive();
			setPhysics(PHYS_Swimming);
		}
	}
	else if (Physics == PHYS_Swimming)
	{
		if ( bCanFly )
			 SetPhysics(PHYS_Flying);
		else
		{
			SetPhysics(PHYS_Falling);
			if ( bCanWalk && (Abs(Acceleration.X) + Abs(Acceleration.Y) > 0)
				&& (Destination.Z >= Location.Z)
				&& CheckWaterJump(jumpDir) )
				JumpOutOfWater(jumpDir);
		}
	}
}

function PreSetMovement()
{
	if ( Skill >= 3 )
	{
		PeripheralVision = -0.1;
		RotationRate.Yaw = 100000;
	}
	else
	{
		PeripheralVision = 0.7 - 0.35 * skill;
		RotationRate.Yaw = 30000 + 16000 * skill;
	}
	if (JumpZ > 0)
		bCanJump = true;
	bCanWalk = true;
	bCanSwim = true;
	bCanFly = false;
	MinHitWall = -0.5;
	bCanOpenDoors = true;
	bCanDoSpecial = true;
    MaxDesiredSpeed = 0.8 + 0.1 * skill;
	if ( skill <= 1 )
		bCanDuck = false;
	else
		bCanDuck = true;
}

function PainTimer()
{
	if ( Health <= 0 || bDeleteme)
		return;

	if (FootRegion.Zone.bPainZone)
		Super.PainTimer();
	else if (HeadRegion.Zone.bWaterZone)
	{
		if (bDrowning)
			self.TakeDamage(5, None, Location, vect(0,0,0), 'Drowned');
		else
		{
			bDrowning = true;
			GotoState('FindAir');
		}
		if (Health > 0)
			PainTime = 2.0;
	}
}
function bool Gibbed(name damageType)
{
	if ( (damageType == 'decapitated') || (damageType == 'shot') )
		return false;
	return ( (Health < -80) || ((Health < -40) && (FRand() < 0.65)) );
}

//=============================================================================

function SetMovementPhysics()
{
	if (Physics == PHYS_Falling)
		return;
	if ( Region.Zone.bWaterZone )
		SetPhysics(PHYS_Swimming);
	else
		SetPhysics(PHYS_Walking);
}


/* Adjust hit location - adjusts the hit location in for pawns, and returns
true if it was really a hit, and false if not (for ducking, etc.)
*/
function bool AdjustHitLocation(out vector HitLocation, vector TraceDir)
{
	local float adjZ, maxZ;

	TraceDir = Normal(TraceDir);
	HitLocation = HitLocation + 0.5 * CollisionRadius * TraceDir;
	if ( BaseEyeHeight == Default.BaseEyeHeight )
		return true;

	maxZ = Location.Z + EyeHeight + 0.25 * CollisionHeight;
	if ( HitLocation.Z > maxZ )
	{
		if ( TraceDir.Z >= 0 )
			return false;
		adjZ = (maxZ - HitLocation.Z)/TraceDir.Z;
		HitLocation.Z = maxZ;
		HitLocation.X = HitLocation.X + TraceDir.X * adjZ;
		HitLocation.Y = HitLocation.Y + TraceDir.Y * adjZ;
		if ( VSize(HitLocation - Location) > CollisionRadius )
			return false;
	}
	return true;
}

function FireWeapon()
{
	local int bUseAltMode;

	if (Weapon != None)
	{
		if ( Weapon.AmmoType != None )
			Weapon.AmmoType.AmmoAmount = 9999;
 		Weapon.RateSelf(bUseAltMode);
        if ( !bFiringPaused && (Enemy != None) )
 			Target = Enemy;
		ViewRotation = Rotation;
		if (weapon.IsA('automag'))
		 automag(weapon).clipcount=0;
		if ( bUseAltMode == 0 )
		{
			bFire = 1;
			bAltFire = 0;
			Weapon.Fire(1.0);
		}
		else
		{
			bFire = 0;
			bAltFire = 1;
			Weapon.AltFire(1.0);
		}

		PlayFiring();
	}
	bShootSpecial = false;
}

// check for line of sight to target deltatime from now.
function bool CheckFutureSight(float deltatime)
{
	local vector FutureLoc, HitLocation, HitNormal;
	local actor HitActor;

	if ( Target == None )
		Target = Enemy;
	if ( Target == None )
		return false;

	FutureLoc = Location + Velocity * deltatime;

	//make sure won't run into something
	HitActor = Trace(HitLocation, HitNormal, FutureLoc, Location, false);
	if ( HitActor != None )
		return false;

	//check if can still see target
	HitActor = Trace(HitLocation, HitNormal,
					Target.Location + Target.Velocity * deltatime, FutureLoc, false);

	if ( HitActor == None )
		return true;

	return false;
}

/*
Adjust the aim at target.
	- add aim error
	- adjust up or down if barrier
*/

function rotator AdjustToss(float projSpeed, vector projStart, int aimerror, bool leadTarget, bool warnTarget)
{
	local rotator FireRotation;
	local vector FireSpot;
	local actor HitActor;
	local vector HitLocation, HitNormal;
	local float TargetDist, TossSpeed, TossTime;

	if ( projSpeed == 0 )
		return AdjustAim(projSpeed, projStart, aimerror, leadTarget, warnTarget);
	if ( Target == None )
		Target = Enemy;
	if ( Target == None )
		return Rotation;
	if ( !Target.IsA('Pawn') )
		return rotator(Target.Location - Location);

	FireSpot = Target.Location;
	TargetDist = VSize(Target.Location - ProjStart);
	aimerror = aimerror * (11 - 10 *
		((Target.Location - Location)/TargetDist
			Dot Normal((Target.Location + 0.5 * Target.Velocity) - (ProjStart + 0.5 * Velocity))));

	aimerror = aimerror * (2.4 - 0.5 * (skill + FRand()));
	if ( !leadTarget || (accuracy < 0) )
		aimerror -= aimerror * accuracy;

	if ( leadTarget )
	{
		FireSpot += FMin(1, 0.7 + 0.6 * FRand()) * (Target.Velocity * TargetDist/projSpeed);
		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
		if (HitActor != None)
			FireSpot = 0.5 * (FireSpot + Target.Location);
	}

	//try middle
	FireSpot.Z = Target.Location.Z;
	HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);

	if ( (HitActor != None) && (Target == Enemy) )
	{
		FireSpot = LastSeenPos;
		if ( Location.Z >= LastSeenPos.Z )
			FireSpot.Z -= 0.5 * Enemy.CollisionHeight;
		if ( Weapon != None )
		{
	 		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
			if ( HitActor != None )
			{
				bFire = 0;
				bAltFire = 0;
				SetTimer(TimeBetweenAttacks, false);
			}
		}
	}

	// adjust for toss distance (assume 200 z velocity add & 60 init height)
	if ( FRand() < 0.75 )
	{
		TossSpeed = projSpeed + 0.4 * VSize(Velocity);
		if ( (Region.Zone.ZoneGravity.Z != Region.Zone.Default.ZoneGravity.Z)
			|| (TargetDist > TossSpeed) )
		{
			TossTime = TargetDist/TossSpeed;
			FireSpot.Z -= ((0.25 * Region.Zone.ZoneGravity.Z * TossTime + 200) * TossTime + 60);
		}
	}

	FireRotation = Rotator(FireSpot - ProjStart);

	FireRotation.Yaw = FireRotation.Yaw + 0.5 * (Rand(2 * aimerror) - aimerror);
	if (warnTarget && Pawn(Target) != None)
		Pawn(Target).WarnTarget(self, projSpeed, vector(FireRotation));

	FireRotation.Yaw = FireRotation.Yaw & 65535;
	if ( (Abs(FireRotation.Yaw - (Rotation.Yaw & 65535)) > 8192)
		&& (Abs(FireRotation.Yaw - (Rotation.Yaw & 65535)) < 57343) )
	{
		if ( (FireRotation.Yaw > Rotation.Yaw + 32768) ||
			((FireRotation.Yaw < Rotation.Yaw) && (FireRotation.Yaw > Rotation.Yaw - 32768)) )
			FireRotation.Yaw = Rotation.Yaw - 8192;
		else
			FireRotation.Yaw = Rotation.Yaw + 8192;
	}
	viewRotation = FireRotation;
	return FireRotation;
}

function PlayTakeHitSound(int damage, name damageType, int Mult)
{
	if ( Level.TimeSeconds - LastPainSound < 0.25 )
		return;
	LastPainSound = Level.TimeSeconds;

	if ( HeadRegion.Zone.bWaterZone )
	{
		if ( damageType == 'Drowned' )
			PlaySound(drown, SLOT_Pain, 1.5);
		else if ( FRand() < 0.5 )
			PlaySound(UWHit1, SLOT_Pain,2.0,,,Frand()*0.15+0.9);
		else
			PlaySound(UWHit2, SLOT_Pain,2.0,,,Frand()*0.15+0.9);
		return;
	}
	damage *= FRand();

	if (damage < 8)
		PlaySound(HitSound1, SLOT_Pain,2.0,,,Frand()*0.2+0.9);
	else if (damage < 25)
	{
		if (FRand() < 0.5) PlaySound(HitSound2, SLOT_Pain,2.0,,,Frand()*0.15+0.9);
		else PlaySound(HitSound3, SLOT_Pain,2.0,,,Frand()*0.15+0.9);
	}
	else
		PlaySound(HitSound4, SLOT_Pain,2.0,,,Frand()*0.15+0.9);
}

function TryToDuck(vector duckDir, bool bReversed)
{
	local vector HitLocation, HitNormal, Extent;
	local actor HitActor;
	local bool bSuccess, bDuckLeft;

	if ( Health <=0 || bDeleteme )
		return;
	if ( Region.Zone.bWaterZone || (Region.Zone.ZoneGravity.Z > Region.Zone.Default.ZoneGravity.Z) )
		return;
	duckDir.Z = 0;
	bDuckLeft = !bReversed;
	Extent.X = CollisionRadius;
	Extent.Y = CollisionRadius;
	Extent.Z = CollisionHeight;
	HitActor = Trace(HitLocation, HitNormal, Location + 240 * duckDir, Location, false, Extent);
	bSuccess = ( (HitActor == None) || (VSize(HitLocation - Location) > 150) );
	if ( !bSuccess )
	{
		bDuckLeft = !bDuckLeft;
		duckDir *= -1;
		HitActor = Trace(HitLocation, HitNormal, Location + 240 * duckDir, Location, false, Extent);
		bSuccess = ( (HitActor == None) || (VSize(HitLocation - Location) > 150) );
	}
	if ( !bSuccess )
		return;

	if ( HitActor == None )
		HitLocation = Location + 240 * duckDir;

	HitActor = Trace(HitLocation, HitNormal, HitLocation - MaxStepHeight * vect(0,0,1), HitLocation, false, Extent);
	if (HitActor == None)
		return;

	//log("good duck");

	SetFall();
	Velocity = duckDir * 400;
	Velocity.Z = 160;
	PlayDodge(bDuckLeft);
    PlaySound(JumpSound, SLOT_Talk, 1.0, true, 800, 1.0 );
	SetPhysics(PHYS_Falling);
	if ( (Weapon != None) && Weapon.bSplashDamage
		&& ((bFire != 0) || (bAltFire != 0)) && (Enemy != None) )
	{
		HitActor = Trace(HitLocation, HitNormal, Enemy.Location, HitLocation, false);
		if ( HitActor != None )
		{
			HitActor = Trace(HitLocation, HitNormal, Enemy.Location, Location, false);
			if ( HitActor == None )
			{
				bFire = 0;
				bAltFire = 0;
			}
		}
	}
	GotoState('FallingState','Ducking');
}

function PlayDodge(bool bDuckLeft)
{
	PlayDuck();
}

function eAttitude AttitudeToCreature(Pawn Other)
{
	if ( Other.IsA('UMSSpaceMarineBase') )
	   return ATTITUDE_Friendly;
    else
	   return ATTITUDE_Ignore;
}

function float AssessThreat( Pawn NewThreat )
{
	local float ThreatValue, NewStrength, Dist;

	NewStrength = RelativeStrength(NewThreat);
	if ( !NewThreat.IsA('playerpawn') )
		return NewStrength;

	ThreatValue = FMax(0, NewStrength);
	if ( NewThreat.Health < 20 )
		ThreatValue += 0.3;

	Dist = VSize(NewThreat.Location - Location);
	if ( Dist < 800 )
		ThreatValue += 0.3;
	else if ( Dist > 0.7 * VSize(Enemy.Location - Location) )
		ThreatValue -= 0.25;

	if ( (NewThreat != Enemy) && (Enemy != None) )
	{
		ThreatValue -= 0.2;

		if ( !LineOfSightTo(Enemy) )
		{
			if ( Dist < 1200 )
				ThreatValue += 0.2;
			if ( SpecialPause > 0 )
				ThreatValue += 5;
			if ( IsInState('Hunting') && (NewStrength < 0.2)
				&& (Level.TimeSeconds - HuntStartTime < 3)
				&& (relativeStrength(Enemy) < FMin(0, NewStrength)) )
				ThreatValue -= 0.3;
		}
	}

	if ( NewThreat.IsA('PlayerPawn') )
		ThreatValue += 0.15;

	return ThreatValue;
}

function EnemyAcquired()
{
}

/* RelativeStrength()
returns a value indicating the relative strength of other
0.0 = equal to self
> 0 stronger than self
< 0 weaker than self

Since the result will be compared to the creature's aggressiveness, it should be
on the same order of magnitude (-1 to 1)

Assess based on health and weapon
*/

function float RelativeStrength(Pawn Other)
{
	local float compare;
	local int adjustedStrength, adjustedOther;
	local int bTemp;

	adjustedStrength = health;
	adjustedOther = 0.5 * (Other.health + Other.Default.Health);
	compare = 0.01 * float(adjustedOther - adjustedStrength);
	if ( Weapon != None )
	{
		compare -= (Weapon.RateSelf(bTemp) - 0.3);
		if ( Weapon.AIRating < 0.4 )
		{
			compare += 0.2;
			if ( (Other.Weapon != None) && (Other.Weapon.AIRating >= 0.4) )
				compare += 0.3;
		}
	}
	if ( Other.Weapon != None )
		compare += (Other.Weapon.RateSelf(bTemp) - 0.3);
	//log(other.class$" relative strength to "$class$" is "$compare);
	return compare;
}

function PlayMeleeAttack()
{
	//log("play melee attack");
	Acceleration = AccelRate * VRand();
	TweenToWaiting(0.15);
	FireWeapon();
}

function PlayRangedAttack()
{
    FireWeapon();
    PlayWaiting();
//	TweenToWaiting(0.3);
}

function PlayMovingAttack()
{
	PlayRunning();
	FireWeapon();
}

function PlayOutOfWater()
{
	PlayDuck();
}

//FIXME - here decide when to pause/start firing based on weapon,etc
function PlayCombatMove()
{
	PlayRunning();
	if ( skill >= 2 )
		bReadyToAttack = true;
	if ( Enemy == None )
		return;
	if ( Weapon == None )
	{
		bAltFire = 0;
		bFire = 0;
		return;
	}
	if ( bReadyToAttack && bCanFire )
	{
		if ( NeedToTurn(Enemy.Location) )
		{
			bAltFire = 0;
			bFire = 0;
		}
		else
			FireWeapon();
	}
	else
	{
		bFire = 0;
		bAltFire = 0;
	}
}

function FastInAir()
{
	PlayInAir();
}

state FindAir
{
ignores SeePlayer, HearNoise, Bump;

	function HeadZoneChange(ZoneInfo newHeadZone)
	{
		Global.HeadZoneChange(newHeadZone);
	    if ( Health <=0 || bDeleteme )
		   return;
		if (!newHeadZone.bWaterZone)
			GotoState('Attacking');
	}

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
	{
		Super.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if ( NextState == 'TakeHit' )
		{
			NextState = 'FindAir';
			NextLabel = 'TakeHit';
			GotoState('TakeHit');
		}
	}

	function HitWall(vector HitNormal, actor Wall)
	{
		//change directions
		Destination = 200 * (Normal(Destination - Location) + HitNormal);
	}

	function AnimEnd()
	{
		if (Enemy != None)
			PlayCombatMove();
		else if ( (Physics == PHYS_Falling) && (Velocity.Z < -300) )
			FastInAir();
		else
			PlayRunning();
	}

	function Timer()
	{
		bReadyToAttack = True;
		settimer(0.5, false);
	}

	function EnemyNotVisible()
	{
		////log("enemy not visible");
		bReadyToAttack = false;
	}

	function PickDestination(bool bNoCharge)
	{
		Destination = VRand();
		Destination.Z = 1;
		Destination = Location + 200 * Destination;
	}

Begin:
	//log("Find air");
	TweenToRunning(0.2);
	Enable('AnimEnd');
	PickDestination(false);

DoMove:
	if ( Enemy == None )
		MoveTo(Destination);
	else
	{
		bCanFire = true;
		StrafeFacing(Destination, Enemy);
	}
	GotoState('Attacking');

TakeHit:
	TweenToRunning(0.12);
	Goto('DoMove');
}

///////////////////////////////////////////////////////

state Charging
{
ignores SeePlayer, HearNoise;


	function TryToDuck(vector duckDir, bool bReversed)
	{
		if ( FRand() < 0.7 )
		{
			Global.TryToDuck(duckDir, bReversed);
			return;
		}
		if ( MoveTarget == Enemy )
			TryStrafe(duckDir);
	}

	function bool StrafeFromDamage(vector momentum, float Damage, name DamageType, bool bFindDest)
	{
		local vector sideDir;
		local float healthpct;

		if ( (damageType == 'shot') || (damageType == 'jolted') )
			healthpct = 0.17;
		else
			healthpct = 0.25;

		healthpct *= CombatStyle;
		if ( FRand() * Damage < healthpct * Health )
			return false;

		if ( !bFindDest )
			return true;

		sideDir = Normal( Normal(Enemy.Location - Location) Cross vect(0,0,1) );
		if ( (momentum dot sidedir) > 0 )
			sidedir *= -1;

		return TryStrafe(sideDir);
	}

	function bool TryStrafe(vector sideDir)
	{
		local vector extent, HitLocation, HitNormal;
		local actor HitActor;

	    if ( Health <=0 || bDeleteme )
		   return false;
		Extent.X = CollisionRadius;
		Extent.Y = CollisionRadius;
		Extent.Z = CollisionHeight;
		HitActor = Trace(HitLocation, HitNormal, Location + 100 * sideDir, Location, false, Extent);
		if (HitActor != None)
		{
			sideDir *= -1;
			HitActor = Trace(HitLocation, HitNormal, Location + 100 * sideDir, Location, false, Extent);
		}
		if (HitActor != None)
			return false;

		if ( Physics == PHYS_Walking )
		{
			HitActor = Trace(HitLocation, HitNormal, Location + 100 * sideDir - MaxStepHeight * vect(0,0,1), Location + 100 * sideDir, false, Extent);
			if ( HitActor == None )
				return false;
		}
		Destination = Location + 250 * sideDir;
		GotoState('TacticalMove', 'DoStrafeMove');
		return true;
	}

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		local float pick;
		local vector sideDir;
		local bool bWasOnGround;

		bWasOnGround = (Physics == PHYS_Walking);
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			if (AttitudeTo(Enemy) == ATTITUDE_Fear)
			{
				NextState = 'Retreating';
				NextLabel = 'Begin';
			}
			else if ( StrafeFromDamage(momentum, Damage, damageType, false) )
			{
				NextState = 'TacticalMove';
				NextLabel = 'NoCharge';
			}
			else
			{
				NextState = 'Charging';
				NextLabel = 'TakeHit';
			}
			GotoState('TakeHit');
		}
		else if ( StrafeFromDamage(momentum, Damage, damageType, true) )
			return;
		else if ( bWasOnGround && (MoveTarget == Enemy) &&
					(Physics == PHYS_Falling) ) //weave
		{
			pick = 1.0;
			if ( bStrafeDir )
				pick = -1.0;
			sideDir = Normal( Normal(Enemy.Location - Location) Cross vect(0,0,1) );
			sideDir.Z = 0;
			Velocity += pick * GroundSpeed * 0.7 * sideDir;
			if ( FRand() < 0.2 )
				bStrafeDir = !bStrafeDir;
		}
	}

	function Timer()
	{
		bReadyToAttack = True;
        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		{
			GotoState('Attacking');
			return;
		}
		Target = Enemy;
		if ( (VSize(Enemy.Location - Location)
				<= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			|| (FRand() > 0.7 + 0.1 * skill) )
			GotoState('RangedAttack');
	}

	function EndState()
	{
		bFire = 0;
		bAltFire = 0;
		Super.EndState();
	}

AdjustFromWall:
	StrafeTo(Destination, Focus);
	Goto('CloseIn');

ResumeCharge:
	PlayRunning();
	Goto('Charge');

Begin:
	TweenToRunning(0.15);

Charge:
	bFromWall = false;

CloseIn:
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');

	if ( Enemy.Region.Zone.bWaterZone )
	{
		if (!bCanSwim)
			GotoState('TacticalMove', 'NoCharge');
	}
	else if (!bCanFly && !bCanWalk)
		GotoState('TacticalMove', 'NoCharge');

	if (Physics == PHYS_Falling)
	{
		DesiredRotation = Rotator(Enemy.Location - Location);
		Focus = Enemy.Location;
		Destination = Enemy.Location;
		WaitForLanding();
	}
	if( actorReachable(Enemy) )
	{
		bCanFire = true;
		MoveToward(Enemy);
		if (bFromWall)
		{
			bFromWall = false;
			if (PickWallAdjust())
			{
				if ( Physics == PHYS_Falling )
					SetFall();
				else
					StrafeFacing(Destination, Enemy);
			}
			else
				GotoState('TacticalMove', 'NoCharge');
		}
	}
	else
	{
NoReach:
        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    	GotoState('Attacking');
		bCanFire = false;
		bFromWall = false;
		//log("route to enemy "$Enemy);
		if (!FindBestPathToward(Enemy))
		{
			Sleep(0.0);
			GotoState('TacticalMove', 'NoCharge');
		}
SpecialNavig:
		if ( SpecialPause > 0.0 )
		{
			Target = Enemy;
			bFiringPaused = true;
			NextState = 'Charging';
			NextLabel = 'Begin';
			GotoState('RangedAttack');
		}
Moving:
        if ( !IsAnimating() )
	    	AnimEnd();
        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    	GotoState('Attacking');
		if (VSize(MoveTarget.Location - Location) < 2.5 * CollisionRadius)
		{
			bCanFire = true;
			StrafeFacing(MoveTarget.Location, Enemy);
		}
		else
		{
			if ( !bCanStrafe || !LineOfSightTo(Enemy) ||
				(Skill - 2 * FRand() + (Normal(Enemy.Location - Location - vect(0,0,1) * (Enemy.Location.Z - Location.Z))
					Dot Normal(MoveTarget.Location - Location - vect(0,0,1) * (MoveTarget.Location.Z - Location.Z))) < 0) )
			{
				if ( GetAnimGroup(AnimSequence) == 'MovingAttack' )
				{
					AnimSequence = '';
					TweenToRunning(0.12);
				}
				HaltFiring();
				MoveToward(MoveTarget);
			}
			else
			{
				bCanFire = true;
				StrafeFacing(MoveTarget.Location, Enemy);
			}
		}
	}

	GotoState('Attacking');

GotThere:
	////log("Got to enemy");
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');
	Target = Enemy;
	GotoState('RangedAttack');

TakeHit:
	TweenToRunning(0.12);
	if (MoveTarget == Enemy)
	{
		bCanFire = true;
		MoveToward(MoveTarget);
	}

	Goto('Charge');
}

state TacticalMove
{
ignores SeePlayer, HearNoise;

	function SetFall()
	{
		Acceleration = vect(0,0,0);
		Destination = Location;
		NextState = 'Attacking';
		NextLabel = 'Begin';
		NextAnim = 'Breath1l';
		GotoState('FallingState');
 }

	function WarnTarget(Pawn shooter, float projSpeed, vector FireDir)
	{
		if ( bCanFire && (FRand() < 0.4) )
			return;

		Super.WarnTarget(shooter, projSpeed, FireDir);
	}

	function Timer()
	{
		bReadyToAttack = True;
		Enable('Bump');
   	    if ( Health <=0 || bDeleteme )
	      return;
	    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    {
        	GotoState('Attacking');
        	return;
        }
		Target = Enemy;
		if (VSize(Enemy.Location - Location)
				<= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			GotoState('MeleeAttack');
		else if ( bHasRangedAttack && ((!bMovingRangedAttack && (FRand() < 0.8)) || (FRand() > 0.5 + 0.17 * skill)) )
			GotoState('RangedAttack');
	}

	function PainTimer()
	{
		if ( (FootRegion.Zone.bPainZone) && (FootRegion.Zone.DamagePerSec > 0)
			&& (FootRegion.Zone.DamageType != ReducedDamageType) )
			GotoState('Retreating');
		Super.PainTimer();
	}


// PickDestination()
//Choose a destination for the tactical move, based on aggressiveness and the tactical
//situation. Make sure destination is reachable
//

	function PickDestination(bool bNoCharge)
	{
		local vector pickdir, enemydir, enemyPart, Y, minDest;
		local actor HitActor;
		local vector HitLocation, HitNormal, collSpec;
		local float Aggression, enemydist, minDist, strafeSize, optDist;
		local bool success, bNoReach;

        if ( !bReadyToAttack && (TimerRate == 0.0) )
			SetTimer(0.7, false);

		bChangeDir = false;
		if (Region.Zone.bWaterZone && !bCanSwim && bCanFly)
		{
			Destination = Location + 75 * (VRand() + vect(0,0,1));
			Destination.Z += 100;
			return;
		}
        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    {
	 	 WhatToDoNext('Waiting', 'TurnFromWall');
		 return;
        }
		if ( Enemy.Region.Zone.bWaterZone )
			bNoCharge = bNoCharge || !bCanSwim;
		else
			bNoCharge = bNoCharge || (!bCanFly && !bCanWalk);

		success = false;
		enemyDist = VSize(Location - Enemy.Location);
		Aggression = 2 * (CombatStyle + FRand()) - 1.1;
		if ( Enemy.bIsPlayer && (AttitudeToPlayer == ATTITUDE_Fear) && (CombatStyle > 0) )
			Aggression = Aggression - 2 - 2 * CombatStyle;
		if ( Weapon != None )
			Aggression += 2 * Weapon.SuggestAttackStyle();
		if ( Enemy.Weapon != None )
			Aggression += 2 * Enemy.Weapon.SuggestDefenseStyle();

		if ( enemyDist > 1000 )
			Aggression += 1;
		if ( !bNoCharge )
			bNoCharge = ( Aggression < FRand() );

		if ( (Physics == PHYS_Walking) || (Physics == PHYS_Falling) )
		{
			if (Location.Z > Enemy.Location.Z + 140) //tactical height advantage
				Aggression = FMax(0.0, Aggression - 1.0 + CombatStyle);
			else if (Location.Z < Enemy.Location.Z - CollisionHeight) // below enemy
			{
				if ( !bNoCharge && (Aggression > 0) && (FRand() < 0.6) )
				{
					GotoState('Charging');
					return;
				}
				else if ( (enemyDist < 1.1 * (Enemy.Location.Z - Location.Z))
						&& !actorReachable(Enemy) )
				{
					bNoReach = true;
					aggression = -1.5 * FRand();
				}
			}
		}

		if (!bNoCharge && (Aggression > 2 * FRand()))
		{
			if ( bNoReach && (Physics != PHYS_Falling) )
			{
				TweenToRunning(0.15);
				GotoState('Charging', 'NoReach');
			}
			else
				GotoState('Charging');
			return;
		}

		if (enemyDist > FMax(VSize(OldLocation - Enemy.OldLocation), 240))
			Aggression += 0.4 * FRand();

		enemydir = (Enemy.Location - Location)/enemyDist;
		minDist = FMin(160.0, 3*CollisionRadius);
		optDist = 80 + FMin(EnemyDist, 250 * (FRand() + FRand()));
		Y = (enemydir Cross vect(0,0,1));
		if ( Physics == PHYS_Walking )
		{
			Y.Z = 0;
			enemydir.Z = 0;
		}
		else
			enemydir.Z = FMax(0,enemydir.Z);

		strafeSize = FMax(-0.7, FMin(0.85, (2 * Aggression * FRand() - 0.3)));
		enemyPart = enemydir * strafeSize;
		strafeSize = FMax(0.0, 1 - Abs(strafeSize));
		pickdir = strafeSize * Y;
		if ( bStrafeDir )
			pickdir *= -1;
		bStrafeDir = !bStrafeDir;
		collSpec.X = CollisionRadius;
		collSpec.Y = CollisionRadius;
		collSpec.Z = FMax(6, CollisionHeight - 18);

		minDest = Location + minDist * (pickdir + enemyPart);
		HitActor = Trace(HitLocation, HitNormal, minDest, Location, false, collSpec);
		if (HitActor == None)
		{
			success = (Physics != PHYS_Walking);
			if ( !success )
			{
				collSpec.X = FMin(14, 0.5 * CollisionRadius);
				collSpec.Y = collSpec.X;
				HitActor = Trace(HitLocation, HitNormal, minDest - (18 + MaxStepHeight) * vect(0,0,1), minDest, false, collSpec);
				success = (HitActor != None);
			}
			if (success)
				Destination = minDest + (pickdir + enemyPart) * optDist;
		}

		if ( !success )
		{
			collSpec.X = CollisionRadius;
			collSpec.Y = CollisionRadius;
			minDest = Location + minDist * (enemyPart - pickdir);
			HitActor = Trace(HitLocation, HitNormal, minDest, Location, false, collSpec);
			if (HitActor == None)
			{
				success = (Physics != PHYS_Walking);
				if ( !success )
				{
					collSpec.X = FMin(14, 0.5 * CollisionRadius);
					collSpec.Y = collSpec.X;
					HitActor = Trace(HitLocation, HitNormal, minDest - (18 + MaxStepHeight) * vect(0,0,1), minDest, false, collSpec);
					success = (HitActor != None);
				}
				if (success)
					Destination = minDest + (enemyPart - pickdir) * optDist;
			}
			else
			{
				if ( (CombatStyle <= 0) || (Enemy.bIsPlayer && (AttitudeTo(Enemy) == ATTITUDE_Fear)) )
					enemypart = vect(0,0,0);
				else if ( (enemydir Dot enemyPart) < 0 )
					enemyPart = -1 * enemyPart;
				pickDir = Normal(enemyPart - pickdir + HitNormal);
				minDest = Location + minDist * pickDir;
				collSpec.X = CollisionRadius;
				collSpec.Y = CollisionRadius;
				HitActor = Trace(HitLocation, HitNormal, minDest, Location, false, collSpec);
				if (HitActor == None)
				{
					success = (Physics != PHYS_Walking);
					if ( !success )
					{
						collSpec.X = FMin(14, 0.5 * CollisionRadius);
						collSpec.Y = collSpec.X;
						HitActor = Trace(HitLocation, HitNormal, minDest - (18 + MaxStepHeight) * vect(0,0,1), minDest, false, collSpec);
						success = (HitActor != None);
					}
					if (success)
						Destination = minDest + pickDir * optDist;
				}
			}
		}

		if ( !success )
			GiveUpTactical(bNoCharge);
		else
		{
			pickDir = (Destination - Location);
			enemyDist = VSize(pickDir);
			if ( enemyDist > minDist + 2 * CollisionRadius )
			{
				pickDir = pickDir/enemyDist;
				HitActor = Trace(HitLocation, HitNormal, Destination + 2 * CollisionRadius * pickdir, Location, false);
				if ( (HitActor != None) && ((HitNormal dot pickDir) < -0.6) )
					Destination = HitLocation - 2 * CollisionRadius * pickdir;
			}
		}
	}

	function EndState()
	{
        bFire = 0;
		bAltFire = 0;
		bAvoidLedges = false;
		MinHitWall -= 0.15;
		if (JumpZ > 0)
			bCanJump = true;
	}

TacticalTick:
	Sleep(0.02);
Begin:
	TweenToRunning(0.15);
	Enable('AnimEnd');
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        	GotoState('Attacking');
	if (Physics == PHYS_Falling)
	{
		DesiredRotation = Rotator(Enemy.Location - Location);
		Focus = Enemy.Location;
		Destination = Enemy.Location;
		WaitForLanding();
	}
	PickDestination(false);

DoMove:
	if ( !bCanStrafe )
	{
DoDirectMove:
		Enable('AnimEnd');
		if ( GetAnimGroup(AnimSequence) == 'MovingAttack' )
		{
			AnimSequence = '';
			TweenToRunning(0.12);
		}
		HaltFiring();
		MoveTo(Destination);
	}
	else
	{
DoStrafeMove:
		Enable('AnimEnd');
		bCanFire = true;
		StrafeFacing(Destination, Enemy);
	}

	if ( (Enemy != None) && !LineOfSightTo(Enemy) && ValidRecovery() )
		Goto('RecoverEnemy');
	else
	{
		bReadyToAttack = true;
		GotoState('Attacking');
	}

NoCharge:
	TweenToRunning(0.15);
	Enable('AnimEnd');
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        	GotoState('Attacking');
	if (Physics == PHYS_Falling)
	{
		DesiredRotation = Rotator(Enemy.Location - Location);
		Focus = Enemy.Location;
		Destination = Enemy.Location;
		WaitForLanding();
	}
	PickDestination(true);
	Goto('DoMove');

AdjustFromWall:
	Enable('AnimEnd');
	StrafeTo(Destination, Focus);
	Destination = Focus;
	Goto('DoMove');

TakeHit:
	TweenToRunning(0.12);
	Goto('DoMove');

RecoverEnemy:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        	GotoState('Attacking');
	Enable('AnimEnd');
	bReadyToAttack = true;
	HidingSpot = Location;
	bCanFire = false;
	Destination = LastSeeingPos + 3 * CollisionRadius * Normal(LastSeeingPos - Location);
	if ( bCanStrafe || (VSize(LastSeeingPos - Location) < 3 * CollisionRadius) )
		StrafeFacing(Destination, Enemy);
	else
		MoveTo(Destination);
	if ( Weapon == None )
		Acceleration = vect(0,0,0);
	if ( NeedToTurn(Enemy.Location) )
	{
		PlayTurning();
		TurnToward(Enemy);
	}
	if ( bHasRangedAttack && CanFireAtEnemy() )
	{
		Disable('AnimEnd');
		DesiredRotation = Rotator(Enemy.Location - Location);
		if ( Weapon == None )
		{
			PlayRangedAttack();
			FinishAnim();
			TweenToRunning(0.1);
			bReadyToAttack = false;
			SetTimer(TimeBetweenAttacks, false);
		}
		else
		{
			FireWeapon();
			if ( Weapon.bSplashDamage )
			{
				bFire = 0;
				bAltFire = 0;
				Acceleration = vect(0,0,0);
				Sleep(0.1);
			}
		}

		if ( (FRand() + 0.1 > CombatStyle) )
		{
			Enable('EnemyNotVisible');
			Enable('AnimEnd');
			Destination = HidingSpot + 4 * CollisionRadius * Normal(HidingSpot - Location);
			Goto('DoMove');
		}
	}
	if ( !bMovingRangedAttack )
		bReadyToAttack = false;

	GotoState('Attacking');
}

state Hunting
{
ignores EnemyNotVisible;

	function Bump(actor Other)
	{
		//log(Other.class$" bumped "$class);
		if (Pawn(Other) != None)
		{
			if (Enemy == Other)
				bReadyToAttack = True; //can melee right away
			SetEnemy(Pawn(Other));
			LastSeenPos = Enemy.Location;
		}
		setTimer(2.0, false);
		Disable('Bump');
	}

	function bool SetEnemy(Pawn NewEnemy)
	{
		if (Global.SetEnemy(NewEnemy))
		{
			bReadyToAttack = true;
			DesiredRotation = Rotator(Enemy.Location - Location);
			if ( CombatStyle > FRand() )
				GotoState('Charging');
			else
				GotoState('Attacking');
			return true;
		}
		return false;
	}

	function AnimEnd()
	{
		PlayRunning();
		bFire = 0;
		bAltFire = 0;
		bReadyToAttack = true;
        Enable('Bump');
		Disable('AnimEnd');
	}

	function EndState()
	{
		bFire = 0;
		bAltFire = 0;
		Super.EndState();
	}
}

state TakeHit
{
ignores seeplayer, hearnoise, bump, hitwall;

	function Timer()
	{
		bReadyToAttack = true;
	}
}

state RangedAttack
{
ignores SeePlayer, HearNoise, Bump;


	function KeepAttacking()
	{
		if ( bFiringPaused )
			return;
		if ( (Enemy == None) || (Enemy.Health <= 0) || (Enemy.bDeleteMe)
              || (Enemy==self) || !CanFireAtEnemy()  )
		{
			bFire = 0;
			bAltFire = 0;
			GotoState('Attacking');
		}
		else if ( Skill > 3.5 * FRand() - 0.5 )
		{
			bReadyToAttack = true;
			GotoState('TacticalMove');
		}
	}

	function AnimEnd()
	{
		local float decision;

		if ( health <= 0 || bDeleteme)
			return;
		if ( (Weapon == None) || ((bFire == 0) && (bAltFire == 0)) )
		{
			GotoState('Attacking');
			return;
		}
		decision = FRand() - 0.2 * skill;
		if ( decision < 0 )
			GotoState('RangedAttack', 'DoneFiring');
		else
		{
		    FireWeapon();
		//	PlayWaiting();
			TweenToWaiting(0.3);
        }
    }

	function SpecialFire()
	{
		bFiringPaused = true;
		SetTimer(0.75 + VSize(Target.Location - Location)/Weapon.AltProjectileSpeed, false);
		SpecialPause = 0.0;
		NextState = 'Attacking';
		NextLabel = 'Begin';
	}

	function BeginState()
	{
	    if(weapon==none )
	    {
	        bMovingRangedAttack = false;
            bHasRangedAttack = false;
	        GotoState('Attacking');
	    }
		Disable('AnimEnd');
		if ( bFiringPaused )
		{
			SetTimer(SpecialPause, false);
			SpecialPause = 0;
		}
		else
		{
          if ( Enemy != none && Enemy.health > 0 && !Enemy.bdeleteme && Enemy != self )
            Target = Enemy;
          else
            GotoState('Attacking');
        }
	}

	function EndState()
	{
		bFire = 0;
		bAltFire = 0;
		Super.EndState();
	}
Challenge:
    FinishAnim();

	Disable('AnimEnd');
	Sleep(0.0);

	Acceleration = vect(0,0,0); //stop
	if ( Enemy != none)
	 DesiredRotation = Rotator(Enemy.Location - Location);
	PlayChallenge();
	FinishAnim();
	if ( bCrouching && !Region.Zone.bWaterZone )
		Sleep(0.8 + FRand());
	bCrouching = false;
	TweenToFighter(0.1);
	Goto('FaceTarget');

Begin:
    FinishAnim();
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        GotoState('Attacking');
	Acceleration = vect(0,0,0); //stop
	DesiredRotation = Rotator(Enemy.Location - Location);
	TweenToFighter(0.15);

FaceTarget:
	Disable('AnimEnd');
	Sleep(0.0);

	FinishAnim();


	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');
	Target = Enemy;
	if (NeedToTurn(Enemy.Location))
	{
		PlayTurning();
		TurnToward(Enemy);
		TweenToFighter(0.1);
	}
	FinishAnim();

	if (Enemy != none && VSize(Location - Enemy.Location) < 0.9 * MeleeRange + CollisionRadius + Enemy.CollisionRadius)
		GotoState('MeleeAttack', 'ReadyToAttack');

ReadyToAttack:
	if (!bHasRangedAttack || Enemy == none || Enemy.health <= 0 || Enemy.bDeleteme || Enemy == self)
		GotoState('Attacking');
	DesiredRotation = Rotator(Enemy.Location - Location);
	PlayRangedAttack();
	Enable('AnimEnd');
	Sleep(0.0);

Firing:
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');
	TurnToward(Enemy);
	Goto('Firing');

DoneFiring:
	Disable('AnimEnd');
	Sleep(0.0);
	FinishAnim();
	KeepAttacking();
	Goto('FaceTarget');
}

state MeleeAttack
{
ignores SeePlayer, HearNoise, Bump;
/* DamageTarget
check if attack hit target, and if so damage it
*/
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 )
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'MeleeAttack';
			NextLabel = 'Begin';
		}
	}

	function KeepAttacking()
	{
		if ( (Enemy == None) || (Enemy.Health <= 0)
			|| (VSize(Enemy.Location - Location) > (MeleeRange + Enemy.CollisionRadius + CollisionRadius)) )
			GotoState('Attacking');
	}

	function EnemyNotVisible()
	{
		//log("enemy not visible");
		GotoState('Attacking');
	}

	function AnimEnd()
	{
		GotoState('MeleeAttack', 'DoneAttacking');
	}

	function BeginState()
	{
		Target = Enemy;
		Disable('AnimEnd');
		bReadyToAttack = false;
	}

Begin:
	if ( Enemy == None )
		GotoState('Attacking');
	DesiredRotation = Rotator(Enemy.Location - Location);
	if ( skill < 3 )
		TweenToFighter(0.15);
	else
		TweenToFighter(0.11);

FaceTarget:
	Acceleration = vect(0,0,0); //stop
	if (NeedToTurn(Enemy.Location))
	{
		PlayTurning();
		TurnToward(Enemy);
		TweenToFighter(0.1);
	}
	FinishAnim();
	OldAnimRate = 0;	// force no tween

	if ( (Physics == PHYS_Swimming) || (Physics == PHYS_Flying) )
	{
		 if ( VSize(Location - Enemy.Location) > MeleeRange + CollisionRadius + Enemy.CollisionRadius )
			GotoState('RangedAttack', 'ReadyToAttack');
	}
	else if ( (Abs(Location.Z - Enemy.Location.Z)
			> FMax(CollisionHeight, Enemy.CollisionHeight) + 0.5 * FMin(CollisionHeight, Enemy.CollisionHeight)) ||
		(VSize(Location - Enemy.Location) > MeleeRange + CollisionRadius + Enemy.CollisionRadius) )
		GotoState('RangedAttack', 'ReadyToAttack');

/*
	if ( (Physics == PHYS_Swimming) || (Physics == PHYS_Flying) )
	{
		 if ( VSize(Location - Enemy.Location) > MeleeRange + CollisionRadius + Enemy.CollisionRadius )
			GotoState('RangedAttack', 'FaceTarget');
	}
	else if ( (Abs(Location.Z - Enemy.Location.Z)
			> FMax(CollisionHeight, Enemy.CollisionHeight) + 0.5 * FMin(CollisionHeight, Enemy.CollisionHeight)) ||
		(VSize(Location - Enemy.Location) > MeleeRange + CollisionRadius + Enemy.CollisionRadius) )
		GotoState('RangedAttack', 'FaceTarget');
 */
ReadyToAttack:
	DesiredRotation = Rotator(Enemy.Location - Location);
	PlayMeleeAttack();
	Enable('AnimEnd');
Attacking:
	TurnToward(Enemy);
	Goto('Attacking');
DoneAttacking:
	Disable('AnimEnd');
    Sleep(0.0);
	FinishAnim();
	KeepAttacking();
	if ( FRand() < 0.3 - 0.1 * skill )
	{
		Acceleration = vect(0,0,0); //stop
		DesiredRotation = Rotator(Enemy.Location - Location);
		PlayChallenge();
		FinishAnim();
		TweenToFighter(0.1);
	}
	Goto('FaceTarget');
}

///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////
function PlayTurning()
{
	if (Region.Zone.bWaterZone )
	{
		PlaySwimming();
		return;
	}
	BaseEyeHeight = Default.BaseEyeHeight;
	if ( (Weapon == none) || (Weapon.Mass < 20) )
		PlayAnim('TurnSM', 0.3, 0.3);
	else
		PlayAnim('TurnLG', 0.3, 0.3);
}

function TweenToWalking(float tweentime)
	{
		if (Region.Zone.bWaterZone )
		{
				TweenToSwimming(tweentime);
				return;
		}
		BaseEyeHeight = Default.BaseEyeHeight;
		if (Weapon == None)
			TweenAnim('Walk', tweentime);
		else if ( Weapon.bPointing )
		{
			if (Weapon.Mass < 20)
				TweenAnim('WalkSMFR', tweentime);
			else
				TweenAnim('WalkLGFR', tweentime);
		}
		else
		{
			if (Weapon.Mass < 20)
				TweenAnim('WalkSM', tweentime);
			else
				TweenAnim('WalkLG', tweentime);
		}
	}

function TweenToRunning(float tweentime)
{
	if (Region.Zone.bWaterZone )
	{
		TweenToSwimming(tweentime);
		return;
	}
	BaseEyeHeight = Default.BaseEyeHeight;
	if (Weapon == None)
		TweenAnim('Run', tweentime);
	else if ( Weapon.bPointing )
	{
		if (Weapon.Mass < 20)
			TweenAnim('RunSMFR', tweentime);
		else
			TweenAnim('RunLGFR', tweentime);
	}
	else
	{
		if (Weapon.Mass < 20)
			TweenAnim('RunSM', tweentime);
		else
			TweenAnim('RunLG', tweentime);
	}
}

function PlayWalking()
{
	if (Region.Zone.bWaterZone )
	{
		PlaySwimming();
		return;
	}
	BaseEyeHeight = Default.BaseEyeHeight;
	if (Weapon == None)
		LoopAnim('Walk');
	else if ( Weapon.bPointing )
	{
		if (Weapon.Mass < 20)
			LoopAnim('WalkSMFR');
		else
			LoopAnim('WalkLGFR');
	}
	else
	{
		if (Weapon.Mass < 20)
			LoopAnim('WalkSM');
		else
			LoopAnim('WalkLG');
	}
}

function PlayRunning()
{
    strafedodge=false;
	if (Region.Zone.bWaterZone )
	{
		PlaySwimming();
		return;
	}

	BaseEyeHeight = Default.BaseEyeHeight;
	if (Weapon == none)
		LoopAnim('Run');
	else if ( Weapon.bPointing )
	{
		if (Weapon.Mass < 20)
			LoopAnim('RunSMFR');
		else
			LoopAnim('RunLGFR');
	}
	else
	{
		if (Weapon.Mass < 20)
			LoopAnim('RunSM');
		else
			LoopAnim('RunLG');
	}
}

function PlayRising()
{
	BaseEyeHeight = 0.4 * Default.BaseEyeHeight;
	TweenAnim('DuckWlkS', 0.7);
}

function PlayFeignDeath()
{
	local float decision;

	BaseEyeHeight = 0;
	if ( decision < 0.33 )
		TweenAnim('DeathEnd', 0.5);
	else if ( decision < 0.67 )
		TweenAnim('DeathEnd2', 0.5);
	else
		TweenAnim('DeathEnd3', 0.5);
}

function PlayLanded(float impactVel)
{
	impactVel = impactVel/JumpZ;
	impactVel = 0.1 * impactVel * impactVel;
	BaseEyeHeight = Default.BaseEyeHeight;

	if ( impactVel > 0.17 )
		PlaySound(LandGrunt, SLOT_Talk, FMin(4, 5 * impactVel),false,1600,FRand()*0.4+0.8);
	if ( !FootRegion.Zone.bWaterZone && (impactVel > 0.01) )
		PlaySound(Land, SLOT_Interact, FClamp(4 * impactVel,0.2,4.5), false,1600, 1.0);

	if ( (impactVel > 0.06) || (GetAnimGroup(AnimSequence) == 'Jumping') )
	{
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			TweenAnim('LandSMFR', 0.12);
		else
			TweenAnim('LandLGFR', 0.12);
	}
	else if ( !IsAnimating() )
	{
		if ( GetAnimGroup(AnimSequence) == 'TakeHit' )
			AnimEnd();
		else
		{
			if ( (Weapon == None) || (Weapon.Mass < 20) )
				TweenAnim('LandSMFR', 0.12);
			else
				TweenAnim('LandLGFR', 0.12);
		}
	}
}

function PlayInAir()
{
	BaseEyeHeight =  0.7 * Default.BaseEyeHeight;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('JumpSMFR', 0.8);
	else
		TweenAnim('JumpLGFR', 0.8);
}

function PlayDuck()
{
	BaseEyeHeight = 0;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('DuckWlkS', 0.25);
	else
		TweenAnim('DuckWlkL', 0.25);
}

function TweenToCrawl(float tweentime)
{
	if (Region.Zone.bWaterZone )
	{
		if ( (vector(Rotation) Dot Acceleration) > 0 )
			TweenToSwimming(tweentime);
		else
			TweenToWaiting(tweentime);
		return;
	}
	BaseEyeHeight = 0;
 	if ( (Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('DuckWlkS', tweentime);
	else
		TweenAnim('DuckWlkL', tweentime);
}

function PlayCrawling()
{
	//log("Play duck");
    if (Region.Zone.bWaterZone )
	{
		PlaySwimming();
        return;
	}
	BaseEyeHeight = 0;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		LoopAnim('DuckWlkS');
	else
		LoopAnim('DuckWlkL');
}

function PlayDive()
{
	TweenToSwimming(0.2);
}

function TweenToPatrolStop(float tweentime)
{
  TweenToWaiting(tweentime);
}

function TweenToWaiting(float tweentime)
{
	if (Region.Zone.bWaterZone )
	{
		TweenToSwimming(tweentime);
			return;
	}
	else
	{
		BaseEyeHeight = Default.BaseEyeHeight;
		if ( Enemy != None )
			ViewRotation = Rotator(Enemy.Location - Location);
		else
			ViewRotation.Pitch = 0;
		ViewRotation.Pitch = ViewRotation.Pitch & 65535;
		If ( (ViewRotation.Pitch > RotationRate.Pitch)
			&& (ViewRotation.Pitch < 65536 - RotationRate.Pitch) )
		{
			If (ViewRotation.Pitch < 32768)
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
					TweenAnim('AimUpSm', 0.3);
				else
					TweenAnim('AimUpLg', 0.3);
			}
			else
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
					TweenAnim('AimDnSm', 0.3);
				else
					TweenAnim('AimDnLg', 0.3);
			}
		}
		else if ( (Weapon == None) || (Weapon.Mass < 20) )
			TweenAnim('StillSMFR', tweentime);
		else
			TweenAnim('STILLLGFR', tweentime);
	}
}

function TweenToFighter(float tweentime)
{
	TweenToWaiting(tweentime);
}

function PlayThreatening()
{
 if (Region.Zone.bWaterZone)
	{
		PlaySwimming();
		return;
	}
 PlayChallenge();
}

function PlayPatrolStop()
{
 if (Region.Zone.bWaterZone)
	{
		PlaySwimming();
		return;
	}
 PlayWaiting();
}

function PlayChallenge()
{
	local float decision;

	decision = FRand();
	if ( decision < 0.6 )
		TweenToWaiting(0.1);
	else
	    PlayAnim('Taunt1');
}

function PlayWaitingAmbush()
{
  PlayWaiting();
}

function PlayFiring()
{
    if ( (Weapon != None) && (Weapon.AmmoType != None) )
  	    Weapon.AmmoType.AmmoAmount = 9999;
	// switch animation sequence mid-stream if needed
    if (Region.Zone.bWaterZone )
		return;
	if (AnimSequence == 'RunLG')
		AnimSequence = 'RunLGFR';
	else if (AnimSequence == 'RunLG2')
		AnimSequence = 'RunLGFR';
	else if (AnimSequence == 'RunLG3')
		AnimSequence = 'RunLGFR';
	else if (AnimSequence == 'RunSM')
		AnimSequence = 'RunSMFR';
	else if (AnimSequence == 'RunSM2')
		AnimSequence = 'RunSMFR';
	else if (AnimSequence == 'Run')
		AnimSequence = 'RunSMFR';
	else if (AnimSequence == 'WalkLG')
		AnimSequence = 'WalkLGFR';
	else if (AnimSequence == 'WalkSM')
		AnimSequence = 'WalkSMFR';
	else if (AnimSequence == 'Walk')
		AnimSequence = 'WalkSMFR';
	else if ( AnimSequence == 'JumpSMFR' )
	{
		TweenAnim('JumpSMFR', 0.03);
		return;
	}
	else if ( AnimSequence == 'JumpLGFR' )
	{
		TweenAnim('JumpLGFR', 0.03);
		return;
    }
	else if ( AnimSequence == 'LANDLGFR' )
	{
		TweenAnim('LANDLGFR', 0.03);
		return;
	}
	else if ( AnimSequence == 'LANDSMFR' )
	{
		TweenAnim('LANDSMFR', 0.03);
		return;
	}

	else if ( AnimSequence == 'AimUpSm' )
	{
		loopAnim('AimUpSm');
		return;
	}
	else if ( AnimSequence == 'AimUpLg' )
	{
		loopAnim('AimUpLg');
		return;
	}

	else if ( AnimSequence == 'AimDnSm' )
	{
		loopAnim('AimDnSm');
		return;
	}
	else if ( AnimSequence == 'AimDnLg' )
	{
		loopAnim('AimDnLg');
		return;
    }

/*	else if ( AnimSequence == 'StillFRRP' )
	{
		AnimSequence = 'StillFRRP';;
		return;
    }      */


   /*
       else if ( ((bFire == 0) && (bAltFire == 0)) )
	   {

	  		if ( Weapon.Mass < 20 )
			TweenAnim('StillSMFR',0.2);
		else
			TweenAnim('STILLLGFR',0.2);
	    }
   */



	else if ( (GetAnimGroup(AnimSequence) == 'Waiting') || (GetAnimGroup(AnimSequence) == 'Gesture')
		&& (AnimSequence != 'TreadLG') && (AnimSequence != 'TreadSM')
        && (AnimSequence != 'SWIMSM') && (AnimSequence != 'SWIMLG') )
	{
  		if ( Weapon.Mass < 20 )
			TweenAnim('StillSMFR',0.2);
		else
			TweenAnim('STILLLGFR',0.2);

	}
	else if ( AnimSequence == 'STILLLGFR' )
	{
	    TweenAnim('STILLLGFR',0.1);
		return;
    }
	else if ( AnimSequence == 'StillSMFR' )
	{
		TweenAnim('StillSMFR',0.1);
		return;
    }
}

function PlayWeaponSwitch(Weapon NewWeapon)
{
	if ( (Weapon == None) || (Weapon.Mass < 20) )
	{
		if ( (NewWeapon != None) && (NewWeapon.Mass > 20) )
		{
			if ( (AnimSequence == 'RunSM') || (AnimSequence == 'RunSMFR') )
				AnimSequence = 'RunLG';
			else if ( (AnimSequence == 'WalkSM') || (AnimSequence == 'WalkSMFR') )
				AnimSequence = 'WalkLG';
		 	else if ( AnimSequence == 'JumpSMFR' )
		 		AnimSequence = 'JumpLGFR';
			else if ( AnimSequence == 'DuckWlkL' )
				AnimSequence = 'DuckWlkS';
		 	else if ( AnimSequence == 'StillSMFR' )
		 		AnimSequence = 'StillFRRP';
			else if ( AnimSequence == 'AimDnSm' )
				AnimSequence = 'AimDnLg';
			else if ( AnimSequence == 'AimUpSm' )
				AnimSequence = 'AimUpLg';
		}
	}
	else if ( (NewWeapon == None) || (NewWeapon.Mass < 20) )
	{
		if ( (AnimSequence == 'RunLG') || (AnimSequence == 'RunLGFR') )
			AnimSequence = 'RunSM';
		else if ( (AnimSequence == 'WalkLG') || (AnimSequence == 'WalkLGFR') )
			AnimSequence = 'WalkSM';
	 	else if ( AnimSequence == 'JumpLGFR' )
	 		AnimSequence = 'JumpSMFR';
		else if ( AnimSequence == 'DuckWlkS' )
			AnimSequence = 'DuckWlkL';
	 	else if (AnimSequence == 'StillFRRP')
	 		AnimSequence = 'StillSMFR';
		else if ( AnimSequence == 'AimDnLg' )
			AnimSequence = 'AimDnSm';
		else if ( AnimSequence == 'AimUpLg' )
			AnimSequence = 'AimUpSm';
	}
}

function PlaySwimming()
{
	if ( (vector(Rotation) dot Acceleration) > 0 )
	{
     BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
     EyeHeight = BaseEyeHeight;
    	if ((Weapon == None) || (Weapon.Mass < 20) )
		   LoopAnim('SwimSM', -1.0/WaterSpeed,, 0.5);
	    else
		   LoopAnim('SwimLG', -1.0/WaterSpeed,, 0.5);
	}
	else
	{
     BaseEyeHeight =  Default.BaseEyeHeight;
     EyeHeight = BaseEyeHeight;
     if ((Weapon == None) || (Weapon.Mass < 20) )
		   LoopAnim('TreadSM', -1.0/WaterSpeed,, 0.5);
	 else
		   LoopAnim('TreadLG', -1.0/WaterSpeed,, 0.5);
    }
}

function TweenToSwimming(float tweentime)
{
 if ( (vector(Rotation) Dot Acceleration) > 0 )
 {
     BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
	 if ((Weapon == None) || (Weapon.Mass < 20) )
	 	TweenAnim('SwimSM',tweentime);
	 else
	 	TweenAnim('SwimLG',tweentime);
 }
 else
 {
    BaseEyeHeight = Default.BaseEyeHeight;
    if ((Weapon == None) || (Weapon.Mass < 20) )
	   TweenAnim('TreadSM',tweentime);
    else
     TweenAnim('TreadLG',tweentime);
 }
  EyeHeight = BaseEyeHeight;
}

///////////////////////////////////////////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

function PlayDying(name DamageType, vector HitLoc)
{
	local vector X,Y,Z, HitVec, HitVec2D;
	local float dotp;
	local carcass carc;

	BaseEyeHeight = Default.BaseEyeHeight;
	PlayDyingSound();

	if ( FRand() < 0.15 )
	{
		PlayAnim('Dead2',0.7,0.1);
		return;
	}
	if ( (Velocity.Z > 250) && (FRand() < 0.7) )
	{
		if ( ((hitLoc.Z > Location.Z) && (FRand() < 0.65)) && !Level.Game.bVeryLowGore )
		{
			PlayAnim('Dead5',0.7,0.1);
//			PlaySound(Die,SLOT_Talk, 4 * TransientSoundVolume);
			if ( Level.NetMode != NM_Client )
			{
				carc = Spawn(class 'MaleHead',,, Location + CollisionHeight * vect(0,0,0.8), Rotation + rot(3000,0,16384) );
				if (carc != None)
				{
					carc.Initfor(self);
					carc.Velocity = Velocity + VSize(Velocity) * VRand();
					carc.Velocity.Z = FMax(carc.Velocity.Z, Velocity.Z);
				}
				carc = Spawn(class 'CreatureChunks');
				if (carc != None)
				{
					carc.Mesh = mesh 'CowBody1';
					carc.Initfor(self);
					carc.Velocity = Velocity + VSize(Velocity) * VRand();
					carc.Velocity.Z = FMax(carc.Velocity.Z, Velocity.Z);
				}
				carc = Spawn(class 'Arm1',,, Location + CollisionHeight * vect(0,0,0.8), Rotation + rot(3000,0,16384) );
				if (carc != None)
				{
					carc.Initfor(self);
					carc.Velocity = Velocity + VSize(Velocity) * VRand();
					carc.Velocity.Z = FMax(carc.Velocity.Z, Velocity.Z);
				}
			}
		}
		else
			PlayAnim('Dead1', 0.7, 0.1);

		return;
	}

	// check for head hit
	if ( ((DamageType == 'Decapitated') || (HitLoc.Z - Location.Z > 0.6 * CollisionHeight))
		 && !Level.Game.bVeryLowGore )
	{
		DamageType = 'Decapitated';
		PlayAnim('Dead4', 0.7, 0.1);
		if ( Level.NetMode != NM_Client )
		{
			carc = Spawn(class 'MaleHead',,, Location + CollisionHeight * vect(0,0,0.8), Rotation + rot(3000,0,16384) );
			if (carc != None)
			{
				carc.Initfor(self);
				carc.Velocity = Velocity + VSize(Velocity) * VRand();
				carc.Velocity.Z = FMax(carc.Velocity.Z, Velocity.Z);
			}
		}
		return;
	}

	GetAxes(Rotation,X,Y,Z);
	X.Z = 0;
	HitVec = Normal(HitLoc - Location);
	HitVec2D= HitVec;
	HitVec2D.Z = 0;
	dotp = HitVec2D dot X;

	if (Abs(dotp) > 0.71) //then hit in front or back
		PlayAnim('Dead3', 0.7, 0.1);
	else
	{
		dotp = HitVec dot Y;
		if (dotp > 0.0)
			PlayAnim('Dead6', 0.7, 0.1);
		else
			PlayAnim('Dead7', 0.7, 0.1);
	}
}

function PlayGutHit(float tweentime)
{
	if ( (AnimSequence == 'GutHit') || (AnimSequence == 'Dead2') )
	{
		if (FRand() < 0.5)
			TweenAnim('LeftHit', tweentime);
		else
			TweenAnim('RightHit', tweentime);
	}
	else if ( FRand() < 0.6 )
		TweenAnim('GutHit', tweentime);
	else
		TweenAnim('Dead2', tweentime);

}

function PlayHeadHit(float tweentime)
{
	if ( (AnimSequence == 'HeadHit') || (AnimSequence == 'Dead3') )
	    TweenAnim('GutHit', tweentime);
	else if ( FRand() < 0.6 )
		TweenAnim('HeadHit', tweentime);
    else
		TweenAnim('Dead3', tweentime);
}

function PlayLeftHit(float tweentime)
{
	if ( (AnimSequence == 'LeftHit') || (AnimSequence == 'Dead6') )
	    TweenAnim('GutHit', tweentime);
	else if ( FRand() < 0.6 )
	    TweenAnim('LeftHit', tweentime);
	else
		TweenAnim('Dead6', tweentime);
}

function PlayRightHit(float tweentime)
{
	if ( (AnimSequence == 'RightHit') || (AnimSequence == 'Dead1') )
	      	TweenAnim('GutHit', tweentime);
	else if ( FRand() < 0.6 )
	        TweenAnim('RightHit', tweentime);

    else
		TweenAnim('Dead1', tweentime);

}
//////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

auto state StartUp
{
    function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
    {}

	function BeginState()
	{

		if( bBeamingIn )
		{
			Style = STY_Translucent;
			bMeshEnviroMap = True;
			Texture = Texture'UMSMarinesII.marinsuit.mcloak';
			ScaleGlow = 0.01;
			Fatness = 250;
		}

		SetMovementPhysics();
		if (Physics == PHYS_Walking)
			SetPhysics(PHYS_Falling);
    }

    function sethome()
    {
     local NavigationPoint aNode;

     bIsPlayer = true;
    // bIsPlayer =  WeaponType != none;
     if ( WeaponType != None )
     {
       bIsPlayer = true;
	   myWeapon = Spawn(WeaponType);
	   if ( myWeapon != None )
       {
 	    myWeapon.ReSpawnTime = 0.0;
       }
     }
     if ( myweapon != None )
       myWeapon.Touch(self);
     else
     {
      foreach RadiusActors (class'weapon',myWeapon,collisionradius)
	   {
         if (myWeapon.IsInState('PickUp'))
         {
	      myWeapon.ReSpawnTime = 0.0;
          myWeapon.Touch(self);
         }
 	   }
     }
	 if ( WeaponType != None )
	   bIsPlayer = false;
     aNode = Level.NavigationPointList;
     while ( aNode != none )
      {
		if ( aNode.IsA('HomeBase') && (aNode.tag == tag) )
		{
			home = HomeBase(aNode);
			return;
		}
		aNode = aNode.nextNavigationPoint;
      }
    }
Begin:
	SetHome();
	if (SharedAlarmTag != '')
		SetAlarm();
	if ( AlarmTag == '' && bIsPlayer )
	    bIsPlayer=false;
	if (TeamTag != '')
		SetTeam();

	if(bBeamingIn)
	{
		bHidden = true;
		SetCollision(False);
		Land = none;
		LandGrunt = none;
		Octagon = Spawn( class'UMSBeamOctagon',,, Location );
		Sleep( 2.0 );
		GotoState( 'BeamingIn' );
	}

	if (Orders == 'Guarding')
	{
		OrderObject = Spawn(class 'GuardPoint');
		if (OrderTag != '')
			Tag = OrderTag; //so will be triggered if guarded object is touched
	}
	else if (!bFixedStart)
	{
		if (Orders == 'Patroling')
			InitPatrolLoc();
		else if (Orders == 'Ambushing')
			InitAmbushLoc();
	}

	if (Orders != '')
	{
		if (Orders == 'Attacking')
		{
			Orders = '';
			if (enemy != None)
				GotoState('Attacking');
			else
				StartRoaming();
		}
		else if ( bDelayedPatrol && (Orders == 'Patroling') )
			GotoState('Patroling', 'DelayedPatrol');
		else
			GotoState(Orders);
		if ( Physics == PHYS_Falling )
			SetFall();
		else
			SetMovementPhysics();
	}
	else
		GotoState('Waiting');
}

function ChangedWeapon()
{
    Super.ChangedWeapon();
    bIsPlayer = false;
    bMovingRangedAttack = true;
    bHasRangedAttack = true;
    if ( Weapon != None )
    {
       	Weapon.FireOffset = Weapon.FireOffset * DrawScale;
	    Weapon.PlayerViewOffset = Weapon.PlayerViewOffset * DrawScale;

        Weapon.SetHand(-0.5);
       if (weapon.IsA('DispersionPistol'))
       {
           If(DispPowerLevel >4)
              DispPowerLevel=4;
           If(DispPowerLevel <0)
              DispPowerLevel=0;
	       DispersionPistol(weapon).PowerLevel=DispPowerLevel;
	    }
    }
}

function TossWeapon()
{
	if ( Weapon == None )
		return;
	Weapon.FireOffset = Weapon.Default.FireOffset;
	Weapon.PlayerViewOffset = Weapon.Default.PlayerViewOffset;

	Super.TossWeapon();
}

function PlayVictoryDance()
{
 PlayAnim('Taunt1', 0.6, 0.1);
}

function string KillMessage(name damageType, pawn Other)
{
	return(HumanKillMessage);
}

state VictoryDance
{
ignores EnemyNotVisible;

 function BeginState()
 {
   HaltFiring();
   super.BeginState();
 }
}

state Dying
{
ignores SeePlayer, EnemyNotVisible, HearNoise, Died, Bump, Trigger, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget, LongFall, SetFall, PainTimer;

	function BeginState()
	{
    	bFire = 0;
		bAltFire = 0;
		if( Weapon != none )
		{
			Weapon.AmmoType.AmmoAmount = Weapon.Default.AmmoType.AmmoAmount - Rand( 4 );
		}
		super.BeginState();
	}

}

function Died(pawn Killer, name damageType, vector HitLocation)
{
	if( Weapon != none )
	{
		Weapon.AmmoType.AmmoAmount = Weapon.AmmoType.Default.AmmoAmount - Rand( 3 );
	}
    bIsPlayer = false;
	super.Died(Killer, damageType, HitLocation);
}



function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
{
	local int actualDamage;
	local bool bAlreadyDead;

	//log(self@"take damage in state"@GetStateName());
	bAlreadyDead = (Health <= 0);

	if (Physics == PHYS_None)
		SetMovementPhysics();
	if (Physics == PHYS_Walking)
		momentum.Z = FMax(momentum.Z, 0.4 * VSize(momentum));
	if ( instigatedBy == self )
		momentum *= 0.6;
	momentum = momentum/Mass;
	AddVelocity( momentum );

	actualDamage = Level.Game.ReduceDamage(Damage, DamageType, self, instigatedBy);
		if (Inventory != None) //then check if carrying armor
			actualDamage = Inventory.ReduceDamage(actualDamage, DamageType, HitLocation);
	if ( bIsPlayer )
	{
		if (ReducedDamageType == 'All') //God mode
			actualDamage = 0;
		//else if (Inventory != None) //then check if carrying armor
			//actualDamage = Inventory.ReduceDamage(actualDamage, DamageType, HitLocation);
		else
			actualDamage = Damage;
	}
	else if ( (InstigatedBy != None) &&
				(InstigatedBy.IsA(Class.Name) || self.IsA(InstigatedBy.Class.Name)) )
		ActualDamage = ActualDamage * FMin(1 - ReducedDamagePct, 0.35);
	else if ( (ReducedDamageType == 'All') ||
		((ReducedDamageType != '') && (ReducedDamageType == damageType)) )
		actualDamage = float(actualDamage) * (1 - ReducedDamagePct);

	Health -= actualDamage;
	if (CarriedDecoration != None)
		DropDecoration();
	if ( HitLocation == vect(0,0,0) )
	{
		//FIXEM@ log("Zero hit loc instigated by"@Instigator@"with weapon"@Instigator.weapon); //FIXME remove
		HitLocation = Location;
	}
	if (Health > 0)
	{
		if (instigatedBy != None)
			damageAttitudeTo(instigatedBy);
		PlayHit(actualDamage, hitLocation, damageType, Momentum.Z);
	}
	else if ( !bAlreadyDead )
	{
		//log(self$" died");
		NextState = '';
		PlayDeathHit(actualDamage, hitLocation, damageType);
		if ( actualDamage > mass )
			Health = -1 * actualDamage;
		Enemy = instigatedBy;
		Died(instigatedBy, damageType, HitLocation);
	}
	else
	{
		//Warn(self$" took regular damage while already dead");
		SpawnGibbedCarcass();
		if ( bIsPlayer )
		{
			HidePlayer();
			GotoState('Dying');
		}
		else
			Destroy();
	}
	MakeNoise(1.0);
}

state StakeOut
{
ignores EnemyNotVisible;

     function PlayChallenge()
     {
         PlayWaiting();
     }
}

state BeamingIn // Code taken from RLCoopE and adjusted THX Rayne!
{
	ignores SeePlayer, EnemyNotVisible, HearNoise, KilledBy, Trigger, Bump, HitWall, Falling, WarnTarget, Died, LongFall, PlayLanded, TakeDamage;
	
	function BeginState()
	{
		SetCollision(False);
		Mass = 20000;
		Style = STY_Translucent;
		ScaleGlow = -3;
		BeamEffect=Spawn(Class'UMSBeamShieldEffect',Self,,Location,Rotation);
		PlaySound( sound'BeamedIn' );
		if(MyWeapon.Mass <= 20)		
		LoopAnim( 'BREATHSM', 0.4 );
		else if (MyWeapon.Mass > 20)
		LoopAnim( 'BREATHLG', 0.4 );
		Spawn(Class'SMTeleport');
		//if(Skill >= 3)
		//{
			//Texture = None;
			//bMeshEnviroMap = False;
		//}
		BeamEffect.Fatness=80;
		Fatness=60;

		if( MyWeapon != none )
		{
			MyWeapon.Style = STY_Translucent;
			MyWeapon.bMeshEnviroMap = true;
			MyWeapon.Texture = Texture'UMSMarinesII.beamtexture';
			MyWeapon.ScaleGlow = 0.01;
		}

		SetMovementPhysics(); 
		if ( Physics == PHYS_Walking )
		{
			SetPhysics( PHYS_Falling );
		}
	}

	function EndState()
	{
		bUnlit=Default.bUnlit;
		ScaleGlow = Default.ScaleGlow;
		Style = Default.Style;
		SetCollision(True,True,True);
		if(BeamEffect!=None)
		BeamEffect.Destroy();
		Octagon.Destroy();
		bHidden = False;
		SightRadius=227327;
		GoToState('Hunting');
	}

	simulated function Tick( float DeltaTime )
	{
		if( ScaleGlow < 1.5 )
			ScaleGlow += 0.03;
		else
		{
			Style = Default.Style;

			if( ScaleGlow > 0.15 )
				ScaleGlow -= 0.03;
		}

		if( Fatness < 128)
		{
			Fatness++;
		}

		if( BeamEffect.Fatness < 165)
		{
			BeamEffect.Fatness++;
		}

		if( MyWeapon != none && MyWeapon.ScaleGlow < 1.5 )
		{
			MyWeapon.ScaleGlow += 0.03;
		}

		if( bHidden )
		{
			bHidden = false;
			Weapon.bHidden = false;
		}
		
		else
		
		if( FRand() < 0.2 && !bHidden )
		{
			bHidden = true;
			Weapon.bHidden = true;
		}
	}

Begin:
	SetCollision(False);
	if( Enemy != none )
	{
		TurnToward( Enemy );
	}
	Texture = None;
	bMeshEnviroMap = False;
	if (Level.Game.Difficulty >= 3)
	sleep( 2.5 );
	else 
	sleep( 5.0 );
	Style = Default.Style;
	MyWeapon.Texture = MyWeapon.Default.Texture;
	MyWeapon.ScaleGlow = MyWeapon.Default.ScaleGlow;
	MyWeapon.bMeshEnviroMap = false;
	MyWeapon.Style=STY_Normal;
	Mass = Default.Mass;
	GotoState( 'Hunting' );
}

defaultproperties
{
	Accuracy=0.0
	drown=Sound'UnrealShare.Male.MDrown1'
	breathagain=Sound'UnrealShare.Male.MGasp1'
	Footstep1=Sound'UnrealI.Male.metwalk1'
	Footstep2=Sound'UnrealI.Male.metwalk2'
	Footstep3=Sound'UnrealI.Male.metwalk3'
	HitSound3=Sound'UnrealShare.Male.MInjur3'
	HitSound4=Sound'UnrealShare.Male.MInjur4'
	Die2=None
	Die3=Sound'UnrealShare.Male.MDeath3'
	Die4=Sound'UnrealShare.Male.MDeath4'
	GaspSound=Sound'UnrealShare.Male.MGasp2'
	UWHit1=Sound'UnrealShare.Male.MUWHit1'
	UWHit2=Sound'UnrealShare.Male.MUWHit2'
	LandGrunt=Sound'UnrealShare.Male.lland01'
	JumpSound=Sound'UnrealShare.Male.MJump1'
	WeaponType=Class'UnrealI.Minigun'
	myWeapon=None
	HumanKillMessage=" was blown away by a Marine"
	DispPowerLevel=1
	strafedodge=False
	Aggressiveness=0.9
	RefireRate=0.3
	CarcassType=Class'UnrealShare.MaleBody'
	Health=200
	MeleeRange=50.0
	GroundSpeed=380.0
	AirSpeed=400.0
	AccelRate=2048.0
	AirControl=0.35
	SightRadius=4000.0
	UnderWaterTime=200.0
	CombatStyle=0.3
	HitSound1=Sound'UnrealShare.Male.MInjur1'
	HitSound2=Sound'UnrealShare.Male.MInjur2'
	Die=Sound'UnrealShare.Male.MDeath1'
	Intelligence=BRAINS_HUMAN
	bCanStrafe=True
	bAutoActivate=True
	TransientSoundVolume=1.0
	CollisionRadius=17.0
	CollisionHeight=39.0
	Buoyancy=100.0
	Skin=Texture'UnrealShare.Skins.Kurgan'
	Mesh=LodMesh'UnrealI.Male1'
	AnimSequence="Breath1L"
	RotationRate=(Pitch=3072,Yaw=30000,Roll=2048)
	DrawType=DT_Mesh
	LightBrightness=70
	LightHue=40
	LightSaturation=128
	LightRadius=6
	bStasis=False
}
