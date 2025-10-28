//=============================================================================
// UMSCombatDrone
//=============================================================================
class UMSCombatDrone extends UMSSpecialForces;


#exec MESH IMPORT MESH=UMSDrone ANIVFILE=Models\UMSCombatDrone\UMSDrone_a.3d DATAFILE=Models\UMSCombatDrone\UMSDrone_d.3d X=0 Y=0 Z=0 LODSTYLE=10 LODFRAME=3
#exec MESH LODPARAMS MESH=UMSDrone STRENGTH=0.0
#exec MESH ORIGIN MESH=UMSDrone X=0 Y=0 Z=-40 YAW=0 PITCH=0 ROLL=0

#exec MESH SEQUENCE MESH=UMSDrone SEQ=ALL       STARTFRAME=0 NUMFRAMES=868 RATE=16
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RefPose   STARTFRAME=0 NUMFRAMES=1 RATE=16
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Still     STARTFRAME=3 NUMFRAMES=1 RATE=16
#exec MESH SEQUENCE MESH=UMSDrone SEQ=GutHit    STARTFRAME=4   NUMFRAMES=1				Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=AimDnLg   STARTFRAME=5   NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=AimDnSm   STARTFRAME=6   NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=AimUpLg   STARTFRAME=7   NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=AimUpSm   STARTFRAME=8   NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Taunt1    STARTFRAME=9   NUMFRAMES=24 RATE=15		Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Breath1   STARTFRAME=33  NUMFRAMES=7  RATE=6		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Breath2   STARTFRAME=40  NUMFRAMES=11 RATE=7		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=CockGun   STARTFRAME=51  NUMFRAMES=8  RATE=6		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DuckWlkL  STARTFRAME=59  NUMFRAMES=14 RATE=15		Group=Ducking
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DuckWlkS  STARTFRAME=74  NUMFRAMES=14 RATE=15		Group=Ducking
#exec MESH SEQUENCE MESH=UMSDrone SEQ=HeadHit   STARTFRAME=89  NUMFRAMES=1				Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=JumpLgFr  STARTFRAME=90  NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=JumpSmFr  STARTFRAME=91  NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LandLgFr  STARTFRAME=92  NUMFRAMES=1				Group=Landing
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LandSmFr  STARTFRAME=93  NUMFRAMES=1				Group=Landing
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LeftHit   STARTFRAME=94  NUMFRAMES=1				Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Look      STARTFRAME=95  NUMFRAMES=40 RATE=15     	Group=Waiting 
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RightHit  STARTFRAME=136 NUMFRAMES=1				Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RunLg     STARTFRAME=137 NUMFRAMES=10 RATE=17
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RunLgFr   STARTFRAME=148 NUMFRAMES=10 RATE=17    	Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RunSm     STARTFRAME=159 NUMFRAMES=10 RATE=17
#exec MESH SEQUENCE MESH=UMSDrone SEQ=RunSmFr   STARTFRAME=170 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StillFrRp STARTFRAME=181 NUMFRAMES=10 RATE=24		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StillLgFr STARTFRAME=192 NUMFRAMES=10 RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StillSmFr STARTFRAME=202 NUMFRAMES=10  RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=SwimLg    STARTFRAME=212 NUMFRAMES=15 RATE=15
#exec MESH SEQUENCE MESH=UMSDrone SEQ=SwimSm    STARTFRAME=228 NUMFRAMES=15 RATE=15
#exec MESH SEQUENCE MESH=UMSDrone SEQ=TreadLg   STARTFRAME=244 NUMFRAMES=15 RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=TreadSm   STARTFRAME=260 NUMFRAMES=15 RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Victory1  STARTFRAME=276 NUMFRAMES=45 RATE=15  		Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WalkLg    STARTFRAME=321 NUMFRAMES=16 RATE=18
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WalkLgFr  STARTFRAME=338 NUMFRAMES=16 RATE=18		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WalkSm    STARTFRAME=355 NUMFRAMES=16 RATE=18
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WalkSmFr  STARTFRAME=372 NUMFRAMES=16 RATE=18		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Wave      STARTFRAME=389 NUMFRAMES=15 RATE=15		Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Walk      STARTFRAME=404 NUMFRAMES=16 RATE=18
#exec MESH SEQUENCE MESH=UMSDrone SEQ=TurnLg    STARTFRAME=421 NUMFRAMES=2  RATE=15					// 2 frames of walklgfr
#exec MESH SEQUENCE MESH=UMSDrone SEQ=TurnSm    STARTFRAME=423 NUMFRAMES=2  RATE=15					// 2 frames of walksmfr
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Breath1L  STARTFRAME=425 NUMFRAMES=7  RATE=6		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Breath2L  STARTFRAME=432 NUMFRAMES=11 RATE=7		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=CockGunL  STARTFRAME=443 NUMFRAMES=8  RATE=6		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LookL     STARTFRAME=451 NUMFRAMES=40 RATE=15     	Group=Waiting 
#exec MESH SEQUENCE MESH=UMSDrone SEQ=WaveL     STARTFRAME=492 NUMFRAMES=15 RATE=15		Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Chat1     STARTFRAME=507 NUMFRAMES=10 RATE=16		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Chat2     STARTFRAME=517 NUMFRAMES=10 RATE=16		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Thrust    STARTFRAME=527 NUMFRAMES=44 RATE=24		Group=Gesture
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DodgeB    STARTFRAME=571 NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DodgeF    STARTFRAME=572 NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DodgeR    STARTFRAME=573 NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DodgeL    STARTFRAME=574 NUMFRAMES=1				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Fighter   STARTFRAME=575 NUMFRAMES=1								// first frame of stilllgfr
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Flip      STARTFRAME=576 NUMFRAMES=21				Group=Jumping
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead1     STARTFRAME=597 NUMFRAMES=18 RATE=12		Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead2     STARTFRAME=615 NUMFRAMES=17 RATE=12		
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead3     STARTFRAME=632 NUMFRAMES=11 RATE=12
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead4     STARTFRAME=643 NUMFRAMES=23 RATE=12
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead7     STARTFRAME=666 NUMFRAMES=21 RATE=15		Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead8     STARTFRAME=687 NUMFRAMES=28 RATE=15		Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead9     STARTFRAME=715 NUMFRAMES=5 RATE=5			Group=TakeHit
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead9B    STARTFRAME=721 NUMFRAMES=9 RATE=15		
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Dead11    STARTFRAME=730 NUMFRAMES=24 RATE=15
#exec MESH SEQUENCE MESH=UMSDrone SEQ=BackRun   STARTFRAME=754 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StrafeL   STARTFRAME=765 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StrafeR   STARTFRAME=776 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=BackRun2  STARTFRAME=787 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StrafeL2  STARTFRAME=798 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=StrafeR2  STARTFRAME=809 NUMFRAMES=10 RATE=17		Group=MovingFire
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LookDown  STARTFRAME=820 NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=LookUp    STARTFRAME=821 NUMFRAMES=1				Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DeathEnd3 STARTFRAME=714 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DeathEnd  STARTFRAME=631 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DeathEnd2 STARTFRAME=642 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DeathEnd3 STARTFRAME=714 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSDrone SEQ=DuckWlk   STARTFRAME=822 NUMFRAMES=14 RATE=15		Group=Ducking
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Tread     STARTFRAME=837 NUMFRAMES=15 RATE=15		Group=Waiting
#exec MESH SEQUENCE MESH=UMSDrone SEQ=Swim	  STARTFRAME=853 NUMFRAMES=15 RATE=15

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

defaultproperties
{
	Event='None'
	Accuracy=0.0
	drown=Sound'UnrealShare.Male.MDrown1'
	breathagain=Sound'UnrealShare.Male.MGasp1'
	Footstep1=Sound'UMSMarinesII.Footsteps.MStep1'
	Footstep2=Sound'UMSMarinesII.Footsteps.MStep2'
	Footstep3=Sound'UMSMarinesII.Footsteps.MStep3'
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
	WeaponType=Class'UnrealShare.Automag'
	myWeapon=None
	HumanKillMessage=" was blown away by a UMS Combat Drone"
	DispPowerLevel=1
	strafedodge=False
	Aggressiveness=0.9
	RefireRate=0.3
	CarcassType=Class'UMSMarinesII.UMSSpaceMarineCarcass'
	Health=500
	MeleeRange=50.0
	GroundSpeed=280.0
	AirSpeed=400.0
	AccelRate=1248.0
	AirControl=0.35
	SightRadius=4000.0
	UnderWaterTime=-1.0
	CombatStyle=0.2
	HitSound1=Sound'UnrealShare.Male.MInjur1'
	HitSound2=Sound'UnrealShare.Male.MInjur2'
	Die=Sound'UnrealShare.Male.MDeath1'
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
	ExploRange=650.0
	ExploDamage=501.0
	ExploMomentum=70000.0
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
	MenuName="UMS Space Marine"
	Mass=200.0
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