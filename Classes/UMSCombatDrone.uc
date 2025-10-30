//=============================================================================
// UMSCombatDrone
//=============================================================================
class UMSCombatDrone extends UMSSpecialForces;


#exec MESH IMPORT MESH=UMSDrone ANIVFILE=Models\UMSCombatDrone\UMSDrone_a.3d DATAFILE=Models\UMSCombatDrone\UMSDrone_d.3d X=0 Y=0 Z=0 LODSTYLE=10 LODFRAME=3
#exec MESH LODPARAMS MESH=UMSDrone STRENGTH=0.0
#exec MESH ORIGIN MESH=UMSDrone X=0 Y=0 Z=-40 YAW=0 PITCH=0 ROLL=0

#exec MESH SEQUENCE MESH=UMSDrone SEQ=ALL        STARTFRAME=0 NUMFRAMES=868 RATE=16
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RefPose    STARTFRAME=0 NUMFRAMES=1 RATE=16
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Still      STARTFRAME=3 NUMFRAMES=1 RATE=16
#exec MESH SEQUENCE MESH=UMSDrone SEQ=GutHit     STARTFRAME=4   NUMFRAMES=1				Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=AimDnLg    STARTFRAME=5   NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=AimDnSm    STARTFRAME=6   NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=AimUpLg    STARTFRAME=7   NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=AimUpSm    STARTFRAME=8   NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Taunt1     STARTFRAME=9   NUMFRAMES=24 RATE=15		Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Breath1    STARTFRAME=33  NUMFRAMES=7  RATE=6		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Breath2    STARTFRAME=40  NUMFRAMES=11 RATE=7		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=CockGun    STARTFRAME=51  NUMFRAMES=8  RATE=6		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DuckWlkL   STARTFRAME=59  NUMFRAMES=14 RATE=15		Group=Ducking
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DuckWlkS   STARTFRAME=74  NUMFRAMES=14 RATE=15		Group=Ducking
#exec MESH SEQUENCE MESH=UMSDrone SEQ=HeadHit    STARTFRAME=89  NUMFRAMES=1				Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=JumpLgFr   STARTFRAME=90  NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=JumpSmFr   STARTFRAME=91  NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LandLgFr   STARTFRAME=92  NUMFRAMES=1				Group=Landing
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LandSmFr   STARTFRAME=93  NUMFRAMES=1				Group=Landing
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LeftHit    STARTFRAME=94  NUMFRAMES=1				Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Look       STARTFRAME=95  NUMFRAMES=40 RATE=15     	Group=Waiting 
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RightHit   STARTFRAME=136 NUMFRAMES=1				Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RunLg      STARTFRAME=137 NUMFRAMES=10 RATE=17
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RunLgFr    STARTFRAME=148 NUMFRAMES=10 RATE=17    	Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RunSm      STARTFRAME=159 NUMFRAMES=10 RATE=17
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RunSmFr    STARTFRAME=170 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StillFrRp  STARTFRAME=181 NUMFRAMES=10 RATE=24		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StillLgFr  STARTFRAME=192 NUMFRAMES=10 RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StillSmFr  STARTFRAME=202 NUMFRAMES=10  RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=SwimLg     STARTFRAME=212 NUMFRAMES=15 RATE=15
#exec MESH SEQUENCE MESH=UMSDrone SEQ=SwimSm     STARTFRAME=228 NUMFRAMES=15 RATE=15
#exec MESH SEQUENCE MESH=UMSDrone SEQ=TreadLg    STARTFRAME=244 NUMFRAMES=15 RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=TreadSm    STARTFRAME=260 NUMFRAMES=15 RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Victory1   STARTFRAME=276 NUMFRAMES=45 RATE=15  	Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WalkLg     STARTFRAME=321 NUMFRAMES=16 RATE=18
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WalkLgFr   STARTFRAME=338 NUMFRAMES=16 RATE=18		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WalkSm     STARTFRAME=355 NUMFRAMES=16 RATE=18
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WalkSmFr   STARTFRAME=372 NUMFRAMES=16 RATE=18		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Wave       STARTFRAME=389 NUMFRAMES=15 RATE=15		Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Walk       STARTFRAME=404 NUMFRAMES=16 RATE=18
#exec MESH SEQUENCE MESH=UMSDrone SEQ=TurnLg     STARTFRAME=421 NUMFRAMES=2  RATE=15					// 2 frames of walklgfr
#exec MESH SEQUENCE MESH=UMSDrone SEQ=TurnSm     STARTFRAME=423 NUMFRAMES=2  RATE=15					// 2 frames of walksmfr
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Breath1L   STARTFRAME=425 NUMFRAMES=7  RATE=6		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Breath2L   STARTFRAME=432 NUMFRAMES=11 RATE=7		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=CockGunL   STARTFRAME=443 NUMFRAMES=8  RATE=6		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LookL      STARTFRAME=451 NUMFRAMES=40 RATE=15     	Group=Waiting 
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WaveL      STARTFRAME=492 NUMFRAMES=15 RATE=15		Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Chat1      STARTFRAME=507 NUMFRAMES=10 RATE=16		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Chat2      STARTFRAME=517 NUMFRAMES=10 RATE=16		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Thrust     STARTFRAME=527 NUMFRAMES=44 RATE=24		Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DodgeB     STARTFRAME=571 NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DodgeF     STARTFRAME=572 NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DodgeR     STARTFRAME=573 NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DodgeL     STARTFRAME=574 NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Fighter    STARTFRAME=575 NUMFRAMES=1								// first frame of stilllgfr
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Flip       STARTFRAME=576 NUMFRAMES=21				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead1      STARTFRAME=597 NUMFRAMES=18 RATE=12		Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead2      STARTFRAME=615 NUMFRAMES=17 RATE=12		
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead3      STARTFRAME=632 NUMFRAMES=11 RATE=12
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead4      STARTFRAME=643 NUMFRAMES=23 RATE=12
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead7      STARTFRAME=666 NUMFRAMES=21 RATE=15		Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead8      STARTFRAME=687 NUMFRAMES=28 RATE=15		Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead9      STARTFRAME=715 NUMFRAMES=5 RATE=5		Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead9B     STARTFRAME=721 NUMFRAMES=9 RATE=15		
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead11     STARTFRAME=730 NUMFRAMES=24 RATE=15
#exec MESH SEQUENCE MESH=UMSDrone SEQ=BackRun    STARTFRAME=754 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StrafeL    STARTFRAME=765 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StrafeR    STARTFRAME=776 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=BackRun2   STARTFRAME=787 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StrafeL2   STARTFRAME=798 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StrafeR2   STARTFRAME=809 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LookDown   STARTFRAME=820 NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LookUp     STARTFRAME=821 NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DeathEnd3  STARTFRAME=714 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DeathEnd   STARTFRAME=631 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DeathEnd2  STARTFRAME=642 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DeathEnd3  STARTFRAME=714 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DuckWlk    STARTFRAME=822 NUMFRAMES=14 RATE=15		Group=Ducking
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Tread      STARTFRAME=837 NUMFRAMES=15 RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Swim	   STARTFRAME=853 NUMFRAMES=15 RATE=15
#exec MESH SEQUENCE MESH=UMSDrone SEQ=MeleeR     STARTFRAME=869 NUMFRAMES=11 RATE=16		Group=Attack
#exec MESH SEQUENCE MESH=UMSDrone SEQ=MeleeL     STARTFRAME=880 NUMFRAMES=11 RATE=16		Group=Attack
#exec MESH SEQUENCE MESH=UMSDrone SEQ=MeleeWR    STARTFRAME=891 NUMFRAMES=11 RATE=16		Group=Attack
#exec MESH SEQUENCE MESH=UMSDrone SEQ=MeleeWL    STARTFRAME=902 NUMFRAMES=11 RATE=16		Group=Attack
#exec MESH SEQUENCE MESH=UMSDrone SEQ=MeleeLight STARTFRAME=913 NUMFRAMES=11 RATE=16		Group=Attack
#exec MESH SEQUENCE MESH=UMSDrone SEQ=MeleeHeavy STARTFRAME=924 NUMFRAMES=11 RATE=16		Group=Attack

#exec MESH NOTIFY MESH=UMSDrone SEQ=StrafeL  TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=StrafeL  TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=StrafeR  TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=StrafeR  TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=BackRun  TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=BackRun  TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=StrafeL2  TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=StrafeL2  TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=StrafeR2  TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=StrafeR2  TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=BackRun2  TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=BackRun2  TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=Walk     TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=Walk     TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=WalkLG   TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=WalkLG   TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=WalkLGFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=WalkLGFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=WalkSM 	TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=WalkSM 	TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=WalkSMFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=WalkSMFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=MeleeWL TIME=0.34 FUNCTION=PunchDamageTarget

#exec MESH NOTIFY MESH=UMSDrone SEQ=RunLG TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=RunLG TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=RunLGFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=RunLGFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=RunSM TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=RunSM TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=RunSMFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=RunSMFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSDrone SEQ=Dead1 TIME=0.7 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSDrone SEQ=Dead2 TIME=0.9 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSDrone SEQ=Dead3 TIME=0.45 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSDrone SEQ=Dead4 TIME=0.6 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSDrone SEQ=Dead4 TIME=0.9 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSDrone SEQ=Dead7 TIME=0.7 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSDrone SEQ=Dead8 TIME=0.7 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSDrone SEQ=Dead9B TIME=0.8 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSDrone SEQ=Dead11 TIME=0.57 FUNCTION=LandThump


#exec MESHMAP NEW MESHMAP=UMSDrone MESH=UMSDrone
#exec MESHMAP SCALE MESHMAP=UMSDrone X=0.06 Y=0.06 Z=0.12

#exec TEXTURE IMPORT NAME=UMS0 FILE=Textures\Skins\UMSB0.bmp GROUP=Skins FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=UMSDrone NUM=0 TEXTURE=UMS0

#exec TEXTURE IMPORT NAME=GlowRed FILE=Textures\FX\GlowRed.bmp GROUP=Skins FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=UMSDrone NUM=1 TEXTURE=GlowRed

#exec AUDIO IMPORT FILE="Sounds\Voice\CDM101a.WAV" NAME="CDM101a" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM101b.WAV" NAME="CDM101b" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM103a.WAV" NAME="CDM103a" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM104.WAV" NAME="CDM104" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM105.WAV" NAME="CDM105" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM106.WAV" NAME="CDM106" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM107.WAV" NAME="CDM107" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM108.WAV" NAME="CDM108" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM109.WAV" NAME="CDM109" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM110.WAV" NAME="CDM110" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM111.WAV" NAME="CDM111" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM112.WAV" NAME="CDM112" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM113.WAV" NAME="CDM113" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM114.WAV" NAME="CDM114" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM115.WAV" NAME="CDM115" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDM116.WAV" NAME="CDM116" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Footsteps\MedArmorStep1.WAV" NAME="DroneStep1" GROUP="Footsteps"
#exec AUDIO IMPORT FILE="Sounds\Footsteps\MedArmorStep2.WAV" NAME="DroneStep2" GROUP="Footsteps"
#exec AUDIO IMPORT FILE="Sounds\Footsteps\MedArmorStep3.WAV" NAME="DroneStep3" GROUP="Footsteps"
#exec AUDIO IMPORT FILE="Sounds\Footsteps\MedArmorStep4.WAV" NAME="DroneStep4" GROUP="Footsteps"

#exec AUDIO IMPORT FILE="Sounds\SFX\AutoTurretAlert.WAV" NAME="AlertSplode" GROUP="SFX"

#exec AUDIO IMPORT FILE="Sounds\Voice\CDMDeath.WAV" NAME="CDM117A" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDMDeath2.WAV" NAME="CDM117B" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDMDeath3.WAV" NAME="CDM117C" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\CDMDeath4.WAV" NAME="CDM117D" GROUP="Voice"


var effects Glowy;
var bool bSploded;

Function PostBeginPlay()
{
    Glowy=Spawn(Class'UMSDroneGlow',Self,,Location,Rotation);
	bIsFemale=False;
	RandomDeathSound();
}

Function RandomDeathSound()
{
	local int RandNum;
    local float vol;
    local sound Death;

    LastTalkTime=level.TimeSeconds;
	vol = 2.0;
    LastTalker = self;
    Talker( LastTalker );
    bGetResponse=false;
    bRespond=false;

		RandNum = Rand( 4 );

		if (RandNum==0)
				Death=sound'UMSMarinesII.CDM117A';  
		else if (RandNum==1)
				Death=sound'UMSMarinesII.CDM117B';  
		else if (RandNum==2)
				Death=sound'UMSMarinesII.CDM117C';  
		else if (RandNum==3)
				Death=sound'UMSMarinesII.CDM117D';

    if(Death!=none)
    {
		Die=Death;
		Die2=Death;
		Die3=Death;
		Die4=Death;
    }
}

function PlayMovingAttack()
{
	PlayRunning();
	FireWeapon();
}

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


Function FireWeapon()
{	
    if(bDoSpecial && Health < 0.35 * Default.Health)
	GotoState('BombingRun');
	else if (bAutoDoSpecial)
	GotoState('BombingRun');
	else	
	Super.FireWeapon();
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
		PlaySound(step, SLOT_Interact, 4, false, 400.0, 1.0);
	else
		PlaySound(step, SLOT_Interact, 4, false, 1200.0, 1.0);
}

function KillPhrase()
{
	local int RandNum;
    local float vol;
    local sound voice;

    LastTalkTime=level.TimeSeconds;
	vol = 2.0;
    LastTalker = self;
    Talker( LastTalker );
    bGetResponse=false;
    bRespond=false;

	if( !bIsFemale )
	{
		RandNum = Rand( 3 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.CDM110';  //target eliminated
		else if (RandNum==1)
				voice=sound'UMSMarinesII.CDM115';  //enemy's dead
		else if (RandNum==2)
				voice=sound'UMSMarinesII.CDM116';  //target eliminated
	}
    if(voice!=none)
    {
     PlaySound( voice, SLOT_Talk,vol*0.9 );
     PlaySound( voice, SLOT_None,vol*0.9 );
    }
}

function HelpPhrase()
{
	local int RandNum;
    local float vol;
    local sound voice;

    LastTalkTime=level.TimeSeconds;
	vol = 2.0;
	LastTalker = self;
    Talker( LastTalker );
    bGetResponse=true;
    bRespond=false;
	if( !bIsFemale )
    {
         RandNum = Rand( 3 );
         if (RandNum==0)
		    	voice=sound'UMSMarinesII.CDM114';  //I need some help here
	     else if (RandNum==1)
				voice=sound'UMSMarinesII.CDM109';  //I need some help here
         else if (RandNum==2)
				voice=sound'UMSMarinesII.CDM104';  //Im in trouble
	}
    if(voice!=none)
    {
     PlaySound( voice, SLOT_Talk,vol*0.9 );
     PlaySound( voice, SLOT_None,vol*0.9 );
    }
}

function AcquirePhrase()
{
	local int RandNum;
    local float vol;
    local sound voice;

    LastTalkTime=level.TimeSeconds;
	vol = 2.0;
    LastTalker = self;
    Talker( LastTalker );
    bRespond=false;

	if(bActFriendly)
	{
		if(!bIsFemale)
		voice=sound'UMSMarinesII.Him2'; // Hi!
		else
		voice=sound'UMSMarinesII.Hif2'; // Hi!
	}
	else
	{
		if( !bIsFemale )
		{
			RandNum = Rand( 3 );

			if (RandNum==0)
					voice=sound'UMSMarinesII.CDM106'; //target acquired
			else if (RandNum==1)
					voice=sound'UMSMarinesII.CDM106'; //target acquired
			else if (RandNum==2)
					voice=sound'UMSMarinesII.CDM106'; //target acquired
		}
	}
    if(voice!=none)
    {
     PlaySound( voice, SLOT_Talk,vol*0.9 );
     PlaySound( voice, SLOT_None,vol*0.9 );
    }
}

function ChargePhrase()
{
	local int RandNum;
    local float vol;
    local sound voice;

	vol = 2.0;
	LastTalkTime=level.TimeSeconds;
    LastTalker = self;
    Talker( LastTalker );
    bGetResponse=false;
    bRespond=false;
	if( !bIsFemale )
	{
       	RandNum = Rand( 3 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.CDM111';  //fire
		else if (RandNum==1)
				voice=sound'UMSMarinesII.CDM112'; //fire
		else if (RandNum==2)
				voice=sound'UMSMarinesII.CDM113';  //fire

        if((RandNum==0 || RandNum==1 || RandNum==2 || RandNum==3 || RandNum==4
           || RandNum==5 || RandNum==6 || RandNum==7 || RandNum==8
           || RandNum==13)&& FRand()<0.5)

           bGetResponse=true;
	}
    if(voice!=none)
    {
     PlaySound( voice, SLOT_Talk,vol*0.9 );
     PlaySound( voice, SLOT_None,vol*0.9 );
    }
}

function RespondPhrase()
{
	local int RandNum;
    local float vol;
    local sound voice;

    bRespond=false;
    NotifyPeers( 'responded');
    if( Level.TimeSeconds - LastTalkTime > 2.0 )
     return;
	vol = 2.0;
	LastTalkTime=level.TimeSeconds;
    LastTalker = self;
    Talker( LastTalker );

	if( !bIsFemale )
	{
       	RandNum = Rand( 7 );
      if (RandNum==0)
         voice=sound'onmywaym';
      else if (RandNum==1)
         voice=sound'imonitm';
      else if (RandNum==2)
         voice=sound'rogerm';
      else if (RandNum==3)
         voice=sound'affirmativem';
      else if (RandNum==4)
         voice=sound'willdom';
      else if (RandNum==5)
         voice=sound'yougotitm';
      else if (RandNum==6)
         voice=sound'ten4m';
    }
    else
    {
     RandNum = Rand( 7 );

       if (RandNum==0)
         voice=sound'onmywayf';
       else if (RandNum==1)
         voice=sound'imonitf';
       else if (RandNum==2)
         voice=sound'rogerf';
      else if (RandNum==3)
         voice=sound'affirmativef';
      else if (RandNum==4)
         voice=sound'aquiref';
      else if (RandNum==5)
         voice=sound'okf';
      else if (RandNum==6)
         voice=sound'ten4f';
    }
    if(voice!=none)
    {
     PlaySound( voice, SLOT_Talk,vol );
     PlaySound( voice, SLOT_None,vol );
    }
}


function PlayRunning()
{
    local float strafeMag;
	local vector Focus2D, Loc2D, Dest2D;
	local vector lookDir, moveDir, Y;

    strafedodge=false;
	if (Region.Zone.bWaterZone )
	{
		PlaySwimming();
        return;
	}
    DesiredSpeed = MaxDesiredSpeed;
	BaseEyeHeight = Default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
	if (Weapon == None)
	{
		LoopAnim('Run',0.85,, 0.5);
		return;
	}
	if (Focus == Destination)
	{
        if ( Weapon.bPointing )
		{
			if (Weapon.Mass < 20)
				LoopAnim('RUNSMFR',0.85,, 0.5);
			else
				LoopAnim('RUNLGFR',0.85,, 0.5);
		}
		else
		{
			if (Weapon.Mass < 20)
				LoopAnim('RUNSM',0.85,, 0.5);
			else
				LoopAnim('RUNLG',0.85,, 0.5);
		}
    }
	Focus2D = Focus;
	Focus2D.Z = 0;
	Loc2D = Location;
	Loc2D.Z = 0;
	Dest2D = Destination;
	Dest2D.Z = 0;
	lookDir = Normal(Focus2D - Loc2D);
	moveDir = Normal(Dest2D - Loc2D);
	strafeMag = lookDir dot moveDir;
	if (strafeMag > 0.85)
	{
		if ( Weapon.bPointing )
		{
			if (Weapon.Mass < 20)
				LoopAnim('RUNSMFR',0.85,, 0.5);
			else
				LoopAnim('RUNSMFR',0.85,, 0.5);
		}
		else
		{
			if (Weapon.Mass < 20)
				LoopAnim('RUNSM',0.85,, 0.5);
			else
				LoopAnim('RUNSM',0.85,, 0.5);
		}
	}
	else if (strafeMag < -0.85)
	{

              DesiredSpeed = (2*WalkingSpeed) * MaxDesiredSpeed;
		      if (Weapon == None)
				LoopAnim('Backrun2',(-16*WalkingSpeed)/GroundSpeed,, 0.5);
		      else
		      {
		         if (Weapon.Mass < 20)
				    LoopAnim('Backrun',(-16*WalkingSpeed)/GroundSpeed,, 0.5);
			     else
				    LoopAnim('Backrun',(-16*WalkingSpeed)/GroundSpeed,, 0.5);
		      }
	}
	else
	{

     BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
     EyeHeight = BaseEyeHeight;

		Y = (lookDir cross vect(0,0,1));
		if ((Y Dot (Dest2D - Loc2D)) > 0)
		{
			if (AnimSequence == 'strafer')
			{
					LoopAnim('strafer',0.85,, 1.0);
			}
			else if (AnimSequence == 'strafer')
			{
					LoopAnim('strafer',0.85,, 1.0);
			}
			else
			{
				if (Weapon.Mass < 20)
					LoopAnim('strafer',0.85,0.1, 1.0);
				else
					LoopAnim('strafer',0.85,0.1, 1.0);
			}
		}
		else
		{
			if (AnimSequence == 'strafel')
			{
					LoopAnim('strafel',0.85,, 1.0);
			}
			else if (AnimSequence == 'strafel')
			{
					LoopAnim('strafel',0.85,, 1.0);
			}
			else
			{
				if (Weapon.Mass < 20)
					LoopAnim('strafel',0.85,0.1, 1.0);
				else
					LoopAnim('strafel',0.85,0.1, 1.0);
			}
		}
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
    EyeHeight = BaseEyeHeight;
	if (Weapon == None)
		LoopAnim('Walk');
	else if ( Weapon.bPointing )
	{
		if (Weapon.Mass < 20)
			LoopAnim('WalkSMFR');
		else
			LoopAnim('WalkSMFR');
	}
	else
	{
		if (Weapon.Mass < 20)
			LoopAnim('WalkSM');
		else
			LoopAnim('WalkSM');
	}
}

function PlayMeleeAttack()
{
	if ((Region.Zone.bWaterZone || Physics == PHYS_Flying) && weapon!=none)
	{
		PlayRangedAttack();
		return;
	}
	if (FRand()<0.5)
		PlayAnim('MeleeWL',2);
	else
		PlayAnim('MeleeWL',1.5);
}

Function Timer()
{
	PlaySound(sound'AlertSplode',SLOT_None);
}

State BombingRun
{
	ignores Fireweapon, PeerNotification, SeePlayer, EnemyNotVisible, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget;

     function destroyed()
     {
      MakeNoise(1.0);
      if ( bSploded )
      {
			SpawnGibbedCarcass();
            PlaySound(ExplodeSound, SLOT_None,10.0);
            PlaySound(ExplodeSound, SLOT_Misc,10.0);
            PlaySound(ExplodeSound, SLOT_Talk,10.0);
            sbc=Spawn(Class 'SilentBallExplosion',,, Location);
            if (sbc != none)
            {
		      sbc.drawscale=5*FRand()+5;
              sbc.NetPriority=5.0;
            }
            bsm = Spawn(class'BlackSmoke');
            bsm.DrawScale = 10;
            HurtRadius(ExploDamage, ExploRange, 'Marineexplo', ExploMomentum, Location);
      }
      super.destroyed();
    }

    function Notifydeath()
    {
       local Actor A;
	   if ( event != '' )
		ForEach AllActors( class'Actor', A, event )
	 	if (enemy!=none)
		 A.Trigger( Self, Enemy );
		else
		 A.Trigger( Self, Self );
    }

	Function BeginState()
	{

	}

Begin:
	Acceleration = Vect(0,0,0);
	PlayAnim('Dead9',2);
	PlaySound(sound'AlertSplode',SLOT_None);
	FinishAnim();
	Goto('Run');

Run:
	While(VSize(Enemy.Location - Location) > 128 && !bSploded)
	{
		SetTimer(1,False);
		TurnToward(Enemy);
		TweenToRunning(0.2);
		FinishAnim();
		PlayRunning();
		GroundSpeed=560 - 128;
		MoveToward(Enemy,GroundSpeed);
	}
	if(VSize(Enemy.Location - Location) < 192)
	{
		Acceleration = Vect(0,0,0);
		PlayAnim('Thrust',1.5);
		AmbientSound=Sound'TWAlarm';
		SoundRadius=128;
		Sleep(0.8);
 		Playsound(ActiveExlo);
 		Notifydeath();
		bSploded=True;
 		Destroy();
	}

}

function PlayHit(float Damage, vector HitLocation, name damageType, float MomentumZ)
{
    local float rnd;
    local Bubble1 bub;
    local bool bServerGuessWeapon;
    local vector BloodOffset;
    local int iDam;

    if ( (Damage <= 0) && (ReducedDamageType != 'All') )
        return;

    //DamageClass = class(damageType);
    if ( ReducedDamageType != 'All' ) //spawn some blood
    {
        if (damageType == 'Drowned')
        {
            bub = spawn(class 'Bubble1',,, Location 
                + 0.7 * CollisionRadius * vector(ViewRotation) + 0.3 * EyeHeight * vect(0,0,1));
            if (bub != None)
                bub.DrawScale = FRand()*0.06+0.04; 
        }
        else if ( (damageType != 'Burned') && (damageType != 'Corroded') 
                    && (damageType != 'Fell') )
        {
            BloodOffset = 0.2 * CollisionRadius * Normal(HitLocation - Location);
            BloodOffset.Z = BloodOffset.Z * 0.5;
            spawn(class 'LiandriBotHitEffect',self,,hitLocation + BloodOffset);
        }
    }    

    rnd = FClamp(Damage, 20, 60);

    PlayTakeHitSound(Damage, damageType, 1);
    bServerGuessWeapon = ( ((Weapon != None) && Weapon.bPointing) || (GetAnimGroup(AnimSequence) == 'Dodge') );
    iDam = Clamp(Damage,0,200);
    if ( !bServerGuessWeapon 
        && ((Level.NetMode == NM_DedicatedServer) || (Level.NetMode == NM_ListenServer)) )
    {
        Enable('AnimEnd');
        BaseEyeHeight = Default.BaseEyeHeight;
        PlayTakeHit(0.1, hitLocation, Damage);
    }
}

function PlayDeathHit(float Damage, vector HitLocation, name damageType)
{
    local Bubble1 bub;
    local actor A;

    if ( Region.Zone.bDestructive && (Region.Zone.ExitActor != None) )
        Spawn(Region.Zone.ExitActor);
    if (HeadRegion.Zone.bWaterZone)
    {
        bub = spawn(class 'Bubble1',,, Location 
            + 0.3 * CollisionRadius * vector(Rotation) + 0.8 * EyeHeight * vect(0,0,1));
        if (bub != None)
            bub.DrawScale = FRand()*0.08+0.03; 
        bub = spawn(class 'Bubble1',,, Location 
            + 0.2 * CollisionRadius * VRand() + 0.7 * EyeHeight * vect(0,0,1));
        if (bub != None)
            bub.DrawScale = FRand()*0.08+0.03; 
        bub = spawn(class 'Bubble1',,, Location 
            + 0.3 * CollisionRadius * VRand() + 0.6 * EyeHeight * vect(0,0,1));
        if (bub != None)
            bub.DrawScale = FRand()*0.08+0.03; 
    }

    if ( (damageType != 'Drowned') && (damageType != 'Corroded') )
    {
        spawn(class 'LiandriBotHitEffect',self,'', hitLocation);
        A = Spawn(class'SpriteSmokePuff',,,HitLocation + vect(0,0,8));    
        A.RemoteRole=ROLE_None;
    }
}

defaultproperties
{
	Event='None'
	Accuracy=0.0
	drown=Sound'UnrealShare.Male.MDrown1'
	breathagain=Sound'UnrealShare.Male.MGasp1'
	Footstep1=Sound'UMSMarinesII.Footsteps.DroneStep1'
	Footstep2=Sound'UMSMarinesII.Footsteps.DroneStep2'
	Footstep3=Sound'UMSMarinesII.Footsteps.DroneStep3'
	HitSound3=Sound'UnrealShare.Male.MInjur3'
	HitSound4=Sound'UnrealShare.Male.MInjur4'
	Die2=None
	Die3=None
	Die4=None
	GaspSound=Sound'UnrealShare.Male.MGasp2'
	UWHit1=Sound'UnrealShare.Male.MUWHit1'
	UWHit2=Sound'UnrealShare.Male.MUWHit2'
	LandGrunt=Sound'UnrealShare.Male.lland01'
	JumpSound=Sound'UnrealShare.Male.MJump1'
	WeaponType=Class'UnrealShare.Stinger'
	myWeapon=None
	HumanKillMessage=" was blown away by a UMS Combat Drone"
	DispPowerLevel=1
	strafedodge=False
	Aggressiveness=0.9
	RefireRate=0.3
	CarcassType=Class'UMSMarinesII.LiandriBotCarcass'
	Health=500
	MeleeRange=50.0
	GroundSpeed=280.0
	AirSpeed=400.0
	AccelRate=1248.0
	AirControl=0.35
	SightRadius=4000.0
	UnderWaterTime=-1.0
	CombatStyle=0.85
	HitSound1=None
	HitSound2=None
	Die=None
	Intelligence=BRAINS_HUMAN
	bCanStrafe=True
	bAutoActivate=True
	TransientSoundVolume=1.0
	Buoyancy=200.0
	Skin=Texture'UnrealShare.Skins.Kurgan'
	Mesh=LodMesh'UMSMarinesII.UMSDrone'
	AnimSequence="Breath1L"
	RotationRate=(Pitch=3072,Yaw=30000,Roll=2048)
	DrawType=DT_Mesh
	LightBrightness=70
	LightHue=40
	LightSaturation=128
	LightRadius=6
	bStasis=False
	SaluteTarget=None
	LastTalker=None
	LastTalkTime=0.0
	MessageTime=0.0
	CommandRadius=3000.0
	bButtonPusher=False
	Slap=Sound'UnrealI.Titan.slaphit1Ti'
	static1=Sound'UMSMarinesII.UMSMarines.st1'
	static2=Sound'UMSMarinesII.UMSMarines.st2'
	static3=Sound'UMSMarinesII.UMSMarines.st3'
	static4=Sound'UMSMarinesII.UMSMarines.st4'
	static5=Sound'UMSMarinesII.UMSMarines.st5'
	static6=Sound'UMSMarinesII.UMSMarines.st6'
	static7=Sound'UMSMarinesII.UMSMarines.st7'
	static8=Sound'UMSMarinesII.UMSMarines.st8'
	static9=Sound'UMSMarinesII.UMSMarines.st9'
	static10=Sound'UMSMarinesII.UMSMarines.st10'
	ExplodeSound=Sound'UMSMarinesII.tripwire.tripExplo'
	ActiveExlo=Sound'Activates.Beeps.mactiv62'
	Reloadsound=None
	PunchDamage=5
	SlamDamage=9
	bTeleportWhenHurt=False
	bExplodeWhenHurt=False
	sbc=None
	bsm=None
	bInitz=False
	Randsir=0
	bGetResponse=False
	bRespond=False
	WalkingSpeed=0.2
	JumpZ=425.0
	BaseEyeHeight=39.0
	EyeHeight=39.0
	MenuName="UMS Combat Drone"
	Mass=400.0
	DrawScale=1.25
	CollisionRadius=21.0
	CollisionHeight=53.500000
	Fatness=130
	BeamWaitTime=2.0
	BeamTime=5
	ChallengeTauntMale(0)=Sound'UMSMarinesII.Voice.takeemm'
	ChallengeTauntMale(1)=Sound'UMSMarinesII.Voice.thathurtm'
	ChallengeTauntMale(2)=Sound'UMSMarinesII.Voice.tooeasym2'
	ChallengeTauntMale(3)=Sound'UMSMarinesII.Voice.tooeasym'
	ChallengeTauntFemale(0)=Sound'UMSMarinesII.Voice.takeemf'
	ChallengeTauntFemale(1)=Sound'UMSMarinesII.Voice.marksmanf'
	ChallengeTauntFemale(2)=Sound'UMSMarinesII.Voice.seeyaf'
	ChallengeTauntFemale(3)=Sound'UMSMarinesII.Voice.welldonef'
	Skill=2
	MultiSkins(0)=Texture'UMSMarinesII.Skins.UMS0'
	MultiSkins(1)=Texture'UMSMarinesII.FX.GlowRed'
}