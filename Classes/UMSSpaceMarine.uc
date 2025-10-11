//=============================================================================
// UMSSpaceMarine  -- Asgard
//
//   Source code rights:
//   Copyright 2005 Asgard. All right reserved.
//   asgard15000@iprimus.com.au
//    http://www.angelfire.com/empire/napali/
//
// Special thanks to Turboman for extracting, fixing and adding new animation
// sequences to the spacemarine model.
// Nice work :)
//
//=============================================================================

class UMSSpaceMarine extends UMSSpaceMarineBase;

#exec OBJ LOAD FILE=..\Sounds\Marine.uax PACKAGE=UMSMarinesII.Marine
#exec OBJ LOAD FILE=..\Sounds\Activates.uax

#exec AUDIO IMPORT FILE="Sounds\UMSStatic.WAV" NAME="UMSStatic" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st1.WAV" NAME="st1" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st2.WAV" NAME="st2" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st3.WAV" NAME="st3" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st4.WAV" NAME="st4" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st5.WAV" NAME="st5" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st6.WAV" NAME="st6" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st7.WAV" NAME="st7" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st8.WAV" NAME="st8" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st9.WAV" NAME="st9" GROUP="UMSMarines"
#exec AUDIO IMPORT FILE="Sounds\st10.WAV" NAME="st10" GROUP="UMSMarines"

#exec AUDIO IMPORT FILE="Sounds\tripExplo.WAV" NAME="tripExplo" GROUP="tripwire"
#exec AUDIO IMPORT FILE="Sounds\TWalarm.WAV" NAME="TWalarm" GROUP="tripwire"


#exec mesh IMPORT MESH=Marine ANIVFILE=MODELS\Marine_a.3d DATAFILE=MODELS\Marine_d.3d X=0 Y=0 Z=0 UNMIRROR=0
#exec mesh ORIGIN MESH=Marine X=0 Y=0 Z=0

//cleaned up these animations... tagged OBSOLETE are animations from older versions (pre v2.00) or test anims

#exec mesh SEQUENCE MESH=Marine SEQ=All         STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Marine SEQ=ACTIVATE   STARTFRAME=26 NUMFRAMES=26
#exec MESH SEQUENCE MESH=Marine SEQ=AIMDNLG    STARTFRAME=53 NUMFRAMES=1  Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=AIMDNSM    STARTFRAME=55 NUMFRAMES=1  Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=AIMUPLG    STARTFRAME=57 NUMFRAMES=1  Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=AIMUPSM    STARTFRAME=59 NUMFRAMES=1  Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=BACKSTEP    STARTFRAME=833 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=Marine SEQ=BACKSTEPLGFR STARTFRAME=848 NUMFRAMES=15 RATE=20 Group=MovingAttack
#exec MESH SEQUENCE MESH=Marine SEQ=BACKSTEPSMFR STARTFRAME=863 NUMFRAMES=15 RATE=20 Group=MovingAttack
#exec mesh SEQUENCE MESH=Marine SEQ=BREATH      STARTFRAME=74 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=BREATH1    STARTFRAME=81 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=BREATH2    STARTFRAME=81 NUMFRAMES=7  RATE=6  Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=BREATHUNARMED     STARTFRAME=67 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=BREATHLG    STARTFRAME=74 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=BREATHSM    STARTFRAME=81 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=BREATHLG2   STARTFRAME=1015 NUMFRAMES=10 RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=BUTTON1     STARTFRAME=104 NUMFRAMES=16
#exec MESH SEQUENCE MESH=Marine SEQ=COCKGUN    STARTFRAME=128 NUMFRAMES=8  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=COCKGUNL    STARTFRAME=128 NUMFRAMES=8  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=DEAD1       STARTFRAME=136 NUMFRAMES=16 Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=DEAD2       STARTFRAME=136 NUMFRAMES=16 Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=DEAD3       STARTFRAME=152 NUMFRAMES=13 Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=DEAD4       STARTFRAME=165 NUMFRAMES=13 Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=DEAD5       STARTFRAME=878 NUMFRAMES=16 Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=DEAD6       STARTFRAME=894 NUMFRAMES=16 Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=DEAD7       STARTFRAME=136 NUMFRAMES=16 Group=TakeHit
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD7A      STARTFRAME=910 NUMFRAMES=13 Group=TakeHit //torso
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD7B      STARTFRAME=923 NUMFRAMES=13 Group=TakeHit //legs
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD8A      STARTFRAME=936 NUMFRAMES=16 Group=TakeHit //leftarm backwards
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD8B      STARTFRAME=952 NUMFRAMES=16 Group=TakeHit //rightarm backwards
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD8C    STARTFRAME=1152 NUMFRAMES=12 Group=TakeHit //rightarm forwards
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD8D    STARTFRAME=1165 NUMFRAMES=12 Group=TakeHit //leftarm forwards
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD10A     STARTFRAME=968 NUMFRAMES=16 Group=TakeHit //leftleg forwards
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD10B     STARTFRAME=984 NUMFRAMES=16 Group=TakeHit //leftleg backwards
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD10C   STARTFRAME=1120 NUMFRAMES=16 Group=TakeHit //rightleg forwards
#exec mesh SEQUENCE MESH=Marine SEQ=DEAD10D   STARTFRAME=1136 NUMFRAMES=16 Group=TakeHit //rightleg backwards
#exec MESH SEQUENCE MESH=Marine SEQ=DEATHEND    STARTFRAME=164 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Marine SEQ=DUCKWLKL    STARTFRAME=178 NUMFRAMES=15 RATE=15 Group=Ducking
#exec MESH SEQUENCE MESH=Marine SEQ=DUCKWLKS    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Ducking
#exec MESH SEQUENCE MESH=Marine SEQ=GUTHIT      STARTFRAME=208 NUMFRAMES=1  Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=HEADHIT     STARTFRAME=209 NUMFRAMES=1  Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=JUMPLGFR    STARTFRAME=210 NUMFRAMES=1  Group=Jumping
#exec MESH SEQUENCE MESH=Marine SEQ=JUMPSMFR    STARTFRAME=211 NUMFRAMES=1  Group=Jumping
#exec MESH SEQUENCE MESH=Marine SEQ=LANDLGFR    STARTFRAME=212 NUMFRAMES=1  Group=Landing
#exec MESH SEQUENCE MESH=Marine SEQ=LANDSMFR    STARTFRAME=213 NUMFRAMES=1  Group=Landing
#exec MESH SEQUENCE MESH=Marine SEQ=LEFTHIT     STARTFRAME=214 NUMFRAMES=1  Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=LOOK       STARTFRAME=230 NUMFRAMES=15 RATE=15 Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=LOOKL       STARTFRAME=230 NUMFRAMES=15 RATE=15 Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=PUNCH       STARTFRAME=245 NUMFRAMES=13 Group=Attack
#exec MESH SEQUENCE MESH=Marine SEQ=FIGHTER     STARTFRAME=259 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Marine SEQ=RAPELLING   STARTFRAME=258 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Marine SEQ=REFPOSE     STARTFRAME=259 NUMFRAMES=1
#exec MESH SEQUENCE MESH=Marine SEQ=RIGHTHIT    STARTFRAME=286 NUMFRAMES=1  Group=TakeHit
#exec MESH SEQUENCE MESH=Marine SEQ=run        STARTFRAME=1278 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=runlg2     STARTFRAME=1358 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=runlg3      STARTFRAME=1298 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=runlg     STARTFRAME=1378 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=runlgfr    STARTFRAME=1318 NUMFRAMES=20 RATE=34 Group=MovingAttack
#exec MESH SEQUENCE MESH=Marine SEQ=runsm     STARTFRAME=1398 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=runsm2      STARTFRAME=1278 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=runsmfr    STARTFRAME=1338 NUMFRAMES=20 RATE=34 Group=MovingAttack
#exec MESH SEQUENCE MESH=Marine SEQ=STRAFErLG  STARTFRAME=1418 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=STRAFErSM  STARTFRAME=1438 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=STRAFElLG  STARTFRAME=1458 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=STRAFElSM  STARTFRAME=1478 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=STRAFEl    STARTFRAME=1458 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=STRAFEr    STARTFRAME=1418 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=Marine SEQ=RELOADLG   STARTFRAME=1178 NUMFRAMES=20 RATE=20 Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=RELOADSM   STARTFRAME=1198 NUMFRAMES=20 RATE=20 Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=RIFLESTOMP  STARTFRAME=260 NUMFRAMES=13 Group=Attack
#exec MESH SEQUENCE MESH=Marine SEQ=RIFLESTOMP2 STARTFRAME=273 NUMFRAMES=13 Group=Attack
#exec MESH SEQUENCE MESH=Marine SEQ=SALUTE     STARTFRAME=394 NUMFRAMES=7  RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=Marine SEQ=SLAM        STARTFRAME=401 NUMFRAMES=10 Group=Attack
#exec MESH SEQUENCE MESH=Marine SEQ=STILL       STARTFRAME=411 NUMFRAMES=1


#exec MESH SEQUENCE MESH=Marine SEQ=STILLFRRP  STARTFRAME=413 NUMFRAMES=1  Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=STILLLGFR   STARTFRAME=414 NUMFRAMES=10 RATE=15 Group=Attack
#exec mesh SEQUENCE MESH=Marine SEQ=STILLSMFR  STARTFRAME=432 NUMFRAMES=8 Group=Attack


#exec MESH SEQUENCE MESH=Marine SEQ=SWIMLG      STARTFRAME=520 NUMFRAMES=15 RATE=15
#exec MESH SEQUENCE MESH=Marine SEQ=SWIMSM      STARTFRAME=535 NUMFRAMES=15 RATE=15
#exec MESH SEQUENCE MESH=Marine SEQ=TALK       STARTFRAME=565 NUMFRAMES=15 RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=Marine SEQ=TREADLG     STARTFRAME=580 NUMFRAMES=15 RATE=15 Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=TREADSM     STARTFRAME=595 NUMFRAMES=15 RATE=15 Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=TURNLG     STARTFRAME=612 NUMFRAMES=2
#exec MESH SEQUENCE MESH=Marine SEQ=TURNSM     STARTFRAME=616 NUMFRAMES=2
#exec MESH SEQUENCE MESH=Marine SEQ=VICTORY    STARTFRAME=643 NUMFRAMES=25 RATE=20 Group=Gesture
#exec MESH SEQUENCE MESH=Marine SEQ=WAVE       STARTFRAME=818 NUMFRAMES=15 RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=Marine SEQ=WAVE2A      STARTFRAME=1025 NUMFRAMES=23 RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=Marine SEQ=WAVE2B      STARTFRAME=1048 NUMFRAMES=12 RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=Marine SEQ=WALK        STARTFRAME=668 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=Marine SEQ=WALKDISARMED  STARTFRAME=1000 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=Marine SEQ=WALKLG     STARTFRAME=698 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=Marine SEQ=WALKLGFR   STARTFRAME=728 NUMFRAMES=15 RATE=20 Group=MovingAttack
#exec mesh SEQUENCE MESH=Marine SEQ=WALKSM     STARTFRAME=758 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=Marine SEQ=WALKSMFR   STARTFRAME=788 NUMFRAMES=15 RATE=20 Group=MovingAttack
#exec mesh SEQUENCE MESH=Marine SEQ=WALKSTRAFEL    STARTFRAME=460 NUMFRAMES=20 RATE=20
#exec MESH SEQUENCE MESH=Marine SEQ=WALKSTRAFER    STARTFRAME=500 NUMFRAMES=20 RATE=20

//reused some animations to save vertex data
#exec mesh SEQUENCE MESH=Marine SEQ=TAUNT1    STARTFRAME=394 NUMFRAMES=7  Group=Gesture
#exec mesh SEQUENCE MESH=Marine SEQ=TAUNT1L   STARTFRAME=394 NUMFRAMES=7  Group=Gesture
#exec mesh SEQUENCE MESH=Marine SEQ=VICTORY1L STARTFRAME=643 NUMFRAMES=25 Group=Gesture
#exec mesh SEQUENCE MESH=Marine SEQ=VICTORY1  STARTFRAME=643 NUMFRAMES=25 Group=Gesture
#exec mesh SEQUENCE MESH=Marine SEQ=WAVEL     STARTFRAME=818 NUMFRAMES=15 Group=Gesture
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND2 STARTFRAME=151 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND3 STARTFRAME=164 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND4 STARTFRAME=177 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND5 STARTFRAME=893 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND6 STARTFRAME=909 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND7A STARTFRAME=922 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND7B STARTFRAME=935 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND8A STARTFRAME=951 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND8B STARTFRAME=967 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND10A STARTFRAME=983 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=DEATHEND10B STARTFRAME=999 NUMFRAMES=1
#exec mesh SEQUENCE MESH=Marine SEQ=TALKLG    STARTFRAME=565 NUMFRAMES=15  Group=Gesture
#exec mesh SEQUENCE MESH=Marine SEQ=BREATH1L  STARTFRAME=74 NUMFRAMES=7   RATE=6  Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=BREATH2L  STARTFRAME=81 NUMFRAMES=7   RATE=6  Group=Waiting
// bug in unreal playerclass typo
#exec mesh SEQUENCE MESH=Marine SEQ=VITORY1   STARTFRAME=618 NUMFRAMES=25 Group=Gesture

//UT converts
#exec mesh SEQUENCE MESH=Marine SEQ=Chat1     STARTFRAME=565 NUMFRAMES=15 RATE=15 Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=Chat2     STARTFRAME=565 NUMFRAMES=15 RATE=15 Group=Waiting
#exec MESH SEQUENCE MESH=Marine SEQ=Thrust    STARTFRAME=230 NUMFRAMES=15 RATE=15 Group=Gesture
#exec mesh SEQUENCE MESH=Marine SEQ=DodgeB    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Jumping
#exec mesh SEQUENCE MESH=Marine SEQ=DodgeF    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Jumping
#exec mesh SEQUENCE MESH=Marine SEQ=DodgeR    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Jumping
#exec mesh SEQUENCE MESH=Marine SEQ=DodgeL    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Jumping
#exec mesh SEQUENCE MESH=Marine SEQ=Flip      STARTFRAME=211 NUMFRAMES=1	 Group=Jumping
#exec mesh SEQUENCE MESH=Marine SEQ=Dead8     STARTFRAME=136 NUMFRAMES=16 RATE=15 Group=TakeHit
#exec mesh SEQUENCE MESH=Marine SEQ=Dead9     STARTFRAME=152 NUMFRAMES=13 RATE=15 Group=TakeHit
#exec mesh SEQUENCE MESH=Marine SEQ=Dead9B    STARTFRAME=136 NUMFRAMES=16 RATE=15
#exec mesh SEQUENCE MESH=Marine SEQ=Dead11    STARTFRAME=136 NUMFRAMES=16 RATE=15
#exec mesh SEQUENCE MESH=Marine SEQ=BackRun   STARTFRAME=833 NUMFRAMES=15 RATE=15 Group=MovingFire

//skaarjplayer
#exec mesh SEQUENCE MESH=Marine SEQ=BREATH    STARTFRAME=74 NUMFRAMES=7  RATE=6  Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=DEATH     STARTFRAME=136 NUMFRAMES=16
#exec mesh SEQUENCE MESH=Marine SEQ=DEATH2    STARTFRAME=136 NUMFRAMES=16
#exec mesh SEQUENCE MESH=Marine SEQ=DEATH3    STARTFRAME=152 NUMFRAMES=13
#exec mesh SEQUENCE MESH=Marine SEQ=DEATH4    STARTFRAME=165 NUMFRAMES=13
#exec mesh SEQUENCE MESH=Marine SEQ=DUCK      STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Ducking
#exec mesh SEQUENCE MESH=Marine SEQ=DUCKWALK  STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Ducking
#exec mesh SEQUENCE MESH=Marine SEQ=FIRING    STARTFRAME=432 NUMFRAMES=8  RATE=15 Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=Getup     STARTFRAME=343 NUMFRAMES=7
#exec mesh SEQUENCE MESH=Marine SEQ=INAIR     STARTFRAME=143 NUMFRAMES=1 Group=Jumping
#exec mesh SEQUENCE MESH=Marine SEQ=Jog       STARTFRAME=1298 NUMFRAMES=10 RATE=44
#exec mesh SEQUENCE MESH=Marine SEQ=JogFire   STARTFRAME=1318 NUMFRAMES=10 RATE=44 Group=MovingAttack
#exec mesh SEQUENCE MESH=Marine SEQ=LAND      STARTFRAME=213 NUMFRAMES=1  	Group=Landing
#exec mesh SEQUENCE MESH=Marine SEQ=Lunge     STARTFRAME=193 NUMFRAMES=15 RATE=15	Group=Dodge
#exec mesh SEQUENCE MESH=Marine SEQ=SWIM      STARTFRAME=535 NUMFRAMES=15 RATE=15 Group=Waiting
#exec mesh SEQUENCE MESH=Marine SEQ=RightDodge  STARTFRAME=193 NUMFRAMES=15 RATE=15	Group=Dodge
#exec mesh SEQUENCE MESH=Marine SEQ=LeftDodge   STARTFRAME=193 NUMFRAMES=15 RATE=15	Group=Dodge
#exec mesh SEQUENCE MESH=Marine SEQ=TURN      STARTFRAME=612 NUMFRAMES=2
#exec mesh SEQUENCE MESH=Marine SEQ=WalkFire  STARTFRAME=773 NUMFRAMES=15 Group=MovingAttack

//=============================================================================
//NOTIFIES
//=============================================================================
#exec MESH NOTIFY MESH=Marine SEQ=Run TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=Run TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunLG TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunLG TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunLG2 TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunLG2 TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunLG3 TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunLG3 TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunLGFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunLGFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunSM TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunSM TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunSM2 TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunSM2 TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunSMFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=RunSMFR TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=Walk TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=Walk TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=WalkDisarmed TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=WalkDisarmed TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=WalkLG TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=WalkLG TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=WalkLGFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=WalkLGFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=WalkSM TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=WalkSM TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=WalkSMFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=WalkSMFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=walkstrafel   TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=walkstrafel   TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=walkstrafer   TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=walkstrafer   TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=Marine SEQ=strafer   TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=strafer   TIME=0.75 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=strafel   TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=strafel   TIME=0.75 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=straferLG TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=straferLG TIME=0.75 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=strafelLG TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=strafelLG TIME=0.75 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=straferSM TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=straferSM TIME=0.75 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=strafelSM TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=strafelSM TIME=0.75 FUNCTION=RunStep
#exec mesh NOTIFY MESH=Marine SEQ=Backstep TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=Backstep TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=BackstepLgFr TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=BackstepLgFr TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=BackstepSmFr TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=BackstepSmFr TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=Backrun TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=Backrun TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=Marine SEQ=Dead1 TIME=0.92 FUNCTION=LandThump
#exec MESH NOTIFY MESH=Marine SEQ=Dead2 TIME=0.92 FUNCTION=LandThump
#exec MESH NOTIFY MESH=Marine SEQ=Dead3 TIME=0.45 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead4 TIME=0.54 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead5 TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead6 TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead7 TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead7a TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead7b TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead8a TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead8b TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead8c TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead8d TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead10a TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead10b TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead10c TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead10d TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Slam TIME=0.48 FUNCTION=SlamDamageTarget
#exec MESH NOTIFY MESH=Marine SEQ=Slam TIME=0.67 FUNCTION=SlamDamageTarget
#exec MESH NOTIFY MESH=Marine SEQ=Punch TIME=0.24 FUNCTION=PunchDamageTarget
#exec MESH NOTIFY MESH=Marine SEQ=Punch TIME=0.76 FUNCTION=PunchDamageTarget
#exec MESH NOTIFY MESH=Marine SEQ=RifleStomp TIME=0.5 FUNCTION=SlamDamageTarget
#exec MESH NOTIFY MESH=Marine SEQ=RifleStomp2 TIME=0.5 FUNCTION=PunchDamageTarget
#exec mesh NOTIFY MESH=Marine SEQ=Talk TIME=0.1 FUNCTION=radio
#exec mesh NOTIFY MESH=Marine SEQ=Taunt1 TIME=0.1 FUNCTION=radio
#exec mesh NOTIFY MESH=Marine SEQ=Taunt1L TIME=0.1 FUNCTION=radio
//ut notifies
#exec MESH NOTIFY MESH=Marine SEQ=Dead7 TIME=0.7 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead8 TIME=0.7 FUNCTION=LandThump
#exec MESH NOTIFY MESH=Marine SEQ=Dead9B TIME=0.8 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Dead11 TIME=0.57 FUNCTION=LandThump
//skaarjplayer notifies
#exec MESH NOTIFY MESH=Marine SEQ=Death  TIME=0.41 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Death2 TIME=0.61 FUNCTION=LandThump
#exec MESH NOTIFY MESH=Marine SEQ=Death3 TIME=0.73 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Death4 TIME=0.62 FUNCTION=LandThump
#exec mesh NOTIFY MESH=Marine SEQ=Jog TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=Jog TIME=0.75 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=JogFire TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=Marine SEQ=JogFire TIME=0.75 FUNCTION=RunStep
#exec mesh NOTIFY MESH=Marine SEQ=Walk TIME=0.25 FUNCTION=WalkStep
#exec MESH NOTIFY MESH=Marine SEQ=Walk TIME=0.75 FUNCTION=WalkStep
#exec MESH NOTIFY MESH=Marine SEQ=WalkFire TIME=0.25 FUNCTION=WalkStep
#exec MESH NOTIFY MESH=Marine SEQ=WalkFire TIME=0.75 FUNCTION=WalkStep
//=============================================================================

//Spacemarine Textures
//=============================================================================
#exec texture IMPORT NAME=Jmarine7 FILE=MODELS\Jmarine7.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=Jmarine8 FILE=MODELS\jmarine8.PCX GROUP=Skins LODSET=2


//Mesh scaling
//=============================================================================
#exec MESHMAP NEW   MESHMAP=Marine MESH=Marine
#exec MESHMAP SCALE MESHMAP=Marine X=0.1 Y=0.1 Z=0.2

//Apply Spacemarine Textures so unrealed mesh browser displays the mesh with textures
//=============================================================================
#exec MESHMAP SETTEXTURE MESHMAP=Marine NUM=1 TEXTURE=Jmarine7
#exec MESHMAP SETTEXTURE MESHMAP=Marine NUM=2 TEXTURE=Jmarine8


#exec mesh NOTIFY MESH=Marine SEQ=COCKGUN TIME=0.45 FUNCTION=Reload
#exec mesh NOTIFY MESH=Marine SEQ=COCKGUNL TIME=0.45 FUNCTION=Reload
#exec mesh NOTIFY MESH=Marine SEQ=RELOADSM TIME=0.45 FUNCTION=Reload
#exec mesh NOTIFY MESH=Marine SEQ=RELOADLG TIME=0.45 FUNCTION=Reload

var Pawn SaluteTarget;
var UMSSpaceMarine LastTalker;
var float LastTalkTime;
var float MessageTime;
var(SpaceMarineExtras) float  CommandRadius;
var(SpaceMarineExtras) bool	bButtonPusher;

var(Sounds) sound slap;
var(Sounds) sound static1;
var(Sounds) sound static2;
var(Sounds) sound static3;
var(Sounds) sound static4;
var(Sounds) sound static5;
var(Sounds) sound static6;
var(Sounds) sound static7;
var(Sounds) sound static8;
var(Sounds) sound static9;
var(Sounds) sound static10;
var(Sounds) sound ExplodeSound;
var(Sounds) sound ActiveExlo;
var(SpaceMarineExtras) sound Reloadsound;

var(SpaceMarineExtras) byte	PunchDamage;
var(SpaceMarineExtras) byte	SlamDamage;
var(SpaceMarineExtras) bool	bTeleportWhenHurt;
var(SpaceMarineExtras) bool bExplodeWhenHurt;
var(SpaceMarineExtras) float ExploRange;
var(SpaceMarineExtras) float ExploDamage;
var(SpaceMarineExtras) float ExploMomentum;

var SilentBallExplosion sbc;
var BlackSmoke bsm;
var bool bInitz;
var int Randsir;

var int TBU;
var bool bReadyToTalk;
var bool bGetResponse;
var bool bRespond;

function PostBeginPlay()
{
 if(bTeleportWhenHurt)
   bExplodeWhenHurt=false;
 bCanSpeak = true;
 bIsFemale = false;
 LastTalkTime=0;
 MessageTime=0;
 bRespond=false;
 super.PostBeginPlay();
}

function PreBeginPlay()
{
    local int newskill;

    super(Pawn).PreBeginPlay();

	if ( Level.Game.bVeryLowGore )
		bGreenBlood = true;

	if ( Skill > 2 )
		bLeadTarget = true;
	else if ( (Skill == 0) && (Health < 500) )
	{
		bLeadTarget = false;
		ReFireRate = 0.75 * ReFireRate;
	}

	if ( bIsBoss )
		Health = Health + 0.15 * Skill * Health;

	bInitialFear = (AttitudeToPlayer == ATTITUDE_Fear);

    if(Level.Game.difficulty > 3)
    {
      newskill = FClamp(Level.Game.difficulty-3, 1, 3);

      if (health > 9 ) // give weaker pawns a small boost
        health += (100 *newskill) / health;
      health *= 1+(0.15*newskill);
      SightRadius+= 100*newskill;
      projectileSpeed += 100*newskill;
      RotationRate.Yaw *= 1+(0.15*newskill);
      AccelRate += 100*newskill;
      groundspeed += 10*newskill;
      waterspeed += 10*newskill;
      airspeed += 10*newskill;
      DamageScaling=default.DamageScaling+(0.5*newskill);
    }
}

function PreSetMovement()
{
	if ( Skill >= 3 )
		RotationRate.Yaw = 100000;
	else
		RotationRate.Yaw = 30000 + 16000 * skill;
	if (JumpZ > 0)
		bCanJump = true;
	bCanWalk = true;
	bCanSwim = true;
	bCanFly = false;
	MinHitWall = -0.5;
	bCanOpenDoors = true;
	bCanDoSpecial = true;
    if ( Skill > 3 )
     Skill=3;
    MaxDesiredSpeed = 0.7 + 0.1 * skill;
    PunchDamage=default.PunchDamage + (skill *4);
    SlamDamage=default.PunchDamage  + (skill *4);
	bCanDuck = false;
}

function Reload()
{
   if (weapon!=none)
   {
    if (weapon.CockingSound !=none)
      PlaySound(weapon.CockingSound, SLOT_Talk,1.0);
    else if (weapon.SelectSound !=none)
      PlaySound(weapon.SelectSound, SLOT_Talk,1.0);
    }
}

function radio()
{
    local int RandNum;

	RandNum = Rand( 10 );

    if (RandNum==0)
		PlaySound(static1, SLOT_None, 2.0, true );
	else if (RandNum==1)
		PlaySound(static2, SLOT_None, 2.0, true );
    else if (RandNum==2)
		PlaySound(static3, SLOT_None, 2.0, true );
	else if (RandNum==3)
		PlaySound(static4, SLOT_None, 2.0, true );
    else if (RandNum==4)
		PlaySound(static5, SLOT_None, 2.0, true );
	else if (RandNum==5)
		PlaySound(static6, SLOT_None, 2.0, true );
	else if (RandNum==6)
		PlaySound(static7, SLOT_None, 2.0, true );
	else if (RandNum==7)
		PlaySound(static8, SLOT_None, 2.0, true );
	else if (RandNum==8)
		PlaySound(static9, SLOT_None, 2.0, true );
	else
		PlaySound(static10, SLOT_None, 2.0, true );
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
		LoopAnim('Run',,, 0.5);
		return;
	}
	if (Focus == Destination)
	{
        if ( Weapon.bPointing )
		{
			if (Weapon.Mass < 20)
				LoopAnim('RUNSMFR',-2.0/GroundSpeed,, 0.5);
			else
				LoopAnim('RUNLGFR',-2.0/GroundSpeed,, 0.5);
		}
		else
		{
			if (Weapon.Mass < 20)
				LoopAnim('RUNSM',-2.0/GroundSpeed,, 0.5);
			else
				LoopAnim('RUNLG',-2.0/GroundSpeed,, 0.5);
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
	if (strafeMag > 0.8)
	{
		if ( Weapon.bPointing )
		{
			if (Weapon.Mass < 20)
				LoopAnim('RUNSMFR',-1.2/GroundSpeed,, 0.5);
			else
				LoopAnim('RUNLGFR',-1.2/GroundSpeed,, 0.5);
		}
		else
		{
			if (Weapon.Mass < 20)
				LoopAnim('RUNSM',-1.2/GroundSpeed,, 0.5);
			else
				LoopAnim('RUNLG2',-1.2/GroundSpeed,, 0.5);
		}
	}
	else if (strafeMag < -0.8)
	{

              DesiredSpeed = (2*WalkingSpeed) * MaxDesiredSpeed;
		      if (Weapon == None)
				LoopAnim('BackStep',(-16*WalkingSpeed)/GroundSpeed,, 0.5);
		      else
		      {
		         if (Weapon.Mass < 20)
				    LoopAnim('BackStepSMFR',(-16*WalkingSpeed)/GroundSpeed,, 0.5);
			     else
				    LoopAnim('BackStepLGFR',(-16*WalkingSpeed)/GroundSpeed,, 0.5);
		      }
	}
	else
	{

     BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
     EyeHeight = BaseEyeHeight;

		Y = (lookDir cross vect(0,0,1));
		if ((Y Dot (Dest2D - Loc2D)) > 0)
		{
			if (AnimSequence == 'straferSM')
			{
					LoopAnim('straferSM',-1.2/GroundSpeed,, 1.0);
			}
			else if (AnimSequence == 'straferlg')
			{
					LoopAnim('straferlg',-1.2/GroundSpeed,, 1.0);
			}
			else
			{
				if (Weapon.Mass < 20)
					LoopAnim('straferSM',-1.2/GroundSpeed,0.1, 1.0);
				else
					LoopAnim('straferlg',-1.2/GroundSpeed,0.1, 1.0);
			}
		}
		else
		{
			if (AnimSequence == 'strafelSM')
			{
					LoopAnim('strafelSM',-1.2/GroundSpeed,, 1.0);
			}
			else if (AnimSequence == 'strafellg')
			{
					LoopAnim('strafellg',-1.2/GroundSpeed,, 1.0);
			}
			else
			{
				if (Weapon.Mass < 20)
					LoopAnim('strafelSM',-1.2/GroundSpeed,0.1, 1.0);
				else
					LoopAnim('strafellg',-1.2/GroundSpeed,0.1, 1.0);
			}
		}
	}
}

function PlayRising()
{
	BaseEyeHeight = 0.4 * Default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
    if (Weapon == none  || Weapon.Mass < 20)
	  TweenAnim('DuckWlkS', 0.7);
	else
      TweenAnim('DuckWlkL', 0.7);
}

function PlayFeignDeath()
{
	local float decision;

	BaseEyeHeight = 0;
	EyeHeight = BaseEyeHeight;
	if ( decision < 0.5 )
		TweenAnim('DeathEnd', 0.5);
	else
		TweenAnim('DeathEnd2', 0.5);
}

function PlayDuck()
{
	BaseEyeHeight = 0;
	EyeHeight = BaseEyeHeight;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('LANDSMFR', 0.25);
	else
		TweenAnim('LandLgFr', 0.25);
}

function PlayOutOfWater()
{
	BaseEyeHeight = 0;
	EyeHeight = BaseEyeHeight;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('DuckWlkS', 0.25);
	else
		TweenAnim('DuckWlkL', 0.25);
}

function PlayDying(name DamageType, vector HitLoc)
{
	local vector X,Y,Z, HitVec, /*HitVec2D*/loc2d,Hitloc2D;
	local float dotx, doty, Ran;
	//local carcass carc;

	BaseEyeHeight = Default.BaseEyeHeight;
	PlayDyingSound();

	if ( DamageType == 'Decapitated')
	{
		PlayHeadDeath(DamageType);
		return;
	}
	GetAxes(Rotation,X,Y,Z);

	if ( (Velocity.Z > 250) && (FRand() < 0.7) )
	{
	    Ran=Frand();
	    if (Ran <0.2)
	    {
	     SpawnbodyPart(Class 'smgib3', Location + (CollisionRadius* 0.2)*X + (CollisionHeight* -0.6)*Z +(CollisionRadius *-0.5)*Y, Rotation + rot(16384,-32468,-16384));
         SpawnbodyPart(Class 'SMGib3R', Location + (CollisionRadius* 0.2)*X + (CollisionHeight* -0.6)*Z +(CollisionRadius *0.5)*Y, Rotation + rot(16384,-32468,16384));
		 PlayAnim('Dead7a', 0.7, 0.1);

		}
	    else if (Ran <0.4)
	    {
	     PlayHeadDeath(DamageType);
	     SpawnbodyPart(Class 'SMGib1R', Location + (CollisionRadius* 0.7)*X + (CollisionHeight* 0.3)*Z +(CollisionRadius *0.9)*Y, Rotation + rot(8182,32468,-16384));
         SpawnbodyPart(Class 'smgib1', Location + (CollisionRadius* 0.7)*X + (CollisionHeight* 0.3)*Z +(CollisionRadius *-0.9)*Y, Rotation + rot(8182,32468,16384));
         SpawnbodyPart(Class 'smgib4', Location + (CollisionHeight* 0.3)*Z , Rotation);
		 PlayAnim('Dead7b', 0.7, 0.1);

		}
        else
          PlayRandDeath();
       return;
	}

    //front or back and left or right
    X.Z = 0;
    loc2d=Location;
    loc2d.Z = 0;
    Hitloc2D = HitLoc;
    Hitloc2D.Z = 0;
	HitVec = Normal(Hitloc2D - loc2d);
	dotx = HitVec dot X;
    Y.z=0;
    doty = HitVec dot Y;

	if ( HitLoc.Z - Location.Z > 0.8 * CollisionHeight )
	{
	       if ( DamageType == 'Exploded')
	        PlayRandDeath();
	       else
			PlayHeadDeath(DamageType);
            return;
	}

    GetAxes(Rotation,X,Y,Z);
    if ( HitLoc.Z > Location.Z )
    {
	  if (dotx > 0.85)
	  {
       PlayFrontDeath();
       return;
      }
      else if (dotx < -0.85)
      {
        PlayBackDeath();
        return;
      }
      if ( FRand() < 0.6)
	  {
	    if (dotx > 0.2)
		 PlayFrontDeath();
		if (dotx < -0.2)
		 PlayBackDeath();
		else
         PlayRandDeath();
		return;
	  }
	  if (doty > 0.5)  //right arm
	  {
	   SpawnbodyPart(Class 'SMGib1R', Location + (CollisionRadius* 0.7)*X + (CollisionHeight* 0.3)*Z +(CollisionRadius *0.9)*Y, Rotation + rot(8182,32468,-16384));
       if(dotx < 0)
          PlayAnim('Dead8c', 0.7, 0.1);
       else
         PlayAnim('Dead8b', 0.7, 0.1);
       return;
      }
      if (doty < -0.5)  //left arm
      {
        SpawnbodyPart(Class 'smgib1', Location + (CollisionRadius* 0.7)*X + (CollisionHeight* 0.3)*Z +(CollisionRadius *-0.9)*Y, Rotation + rot(8182,32468,16384));
        if(dotx < 0)
         PlayAnim('Dead8d', 0.7, 0.1);
        else
         PlayAnim('Dead8a', 0.7, 0.1);
         return;
      }
    }

	if ( HitLoc.Z < Location.Z )
    {
         if ( FRand() < 0.6)
	     {
	       if (dotx > 0.2)
		    PlayFrontDeath();
		   if (dotx < -0.2)
		    PlayBackDeath();
		   else
            PlayRandDeath();
		   return;
	     }
         if (doty < -0.2)  //left leg
         {
          SpawnbodyPart(Class 'smgib3', Location + (CollisionRadius* 0.2)*X + (CollisionHeight* -0.6)*Z +(CollisionRadius *-0.5)*Y, Rotation + rot(16384,-32468,-16384));
          if(dotx < 0)
           PlayAnim('Dead10a', 0.7, 0.1);
          else
           PlayAnim('Dead10b', 0.7, 0.1);
          return;
         }
         if (doty > 0.2)  //Right leg
         {
          SpawnbodyPart(Class 'SMGib3R', Location + (CollisionRadius* 0.2)*X + (CollisionHeight* -0.6)*Z +(CollisionRadius *0.5)*Y, Rotation + rot(16384,-32468,16384));
          if(dotx < 0)
           PlayAnim('Dead10c', 0.7, 0.1);
          else
           PlayAnim('Dead10d', 0.7, 0.1);
          return;
        }

    }
	PlayRandDeath();
}

function SpawnbodyPart(Class <Carcass> C, vector Loc, rotator rot)
{
   local carcass carc;

   if ( Level.NetMode != NM_Client )
	{
      carc = Spawn(C,,, Loc, Rot );
      if (carc != None)
      {
        carc.Initfor(self);
      }
    }
}

function PlayHeadDeath(name DamageType)
{
	local carcass carc;

	PlayAnim('Dead4', 0.7, 0.1);
	if ( Level.NetMode != NM_Client )
	{
	    carc = Spawn(class 'smgib2',,,  Location + CollisionHeight * vect(0,0,0.8), Rotation + rot(3000,0,16384) );
		if (carc != None)
		{
			carc.Initfor(self);
			carc.Velocity = Velocity + VSize(Velocity) * VRand();
			carc.Velocity.Z = FMax(carc.Velocity.Z, Velocity.Z);
		}
	}
}

function PlayFrontDeath()
{
	if ( FRand() < 0.5 )
		PlayAnim('Dead2', 0.7, 0.1);
	else
	    PlayAnim('Dead5', 0.7, 0.1);
}


function PlayBackDeath()
{
	if ( FRand() < 0.5 )
		PlayAnim('Dead3', 0.7, 0.1);
	else
	    PlayAnim('Dead6', 0.7, 0.1);

}

function PlayRandDeath()
{
   local float decision;
   	local carcass carc;

	carc = Spawn(class 'liver');
	if (carc != None)
	{
		carc.Initfor(self);
		carc.Velocity = Velocity + VSize(Velocity) * VRand();
		carc.Velocity.Z = FMax(carc.Velocity.Z, Velocity.Z);
	}
   decision=FRand();
   if ( decision < 0.2 )
     PlayAnim('Dead2', 0.7, 0.1);
   else if ( decision < 0.4 )
     PlayAnim('Dead3', 0.7, 0.1);
   else if ( decision < 0.8 )
     PlayAnim('Dead5',0.7,0.1);
   else
     PlayAnim('Dead6',0.7,0.1);
}

function PlayGutHit(float tweentime)
{
	if ( (LastPainTime - Level.TimeSeconds < 0.3) && (LastPainAnim == 'GutHit') )
	{
		if (FRand() < 0.5)
			TweenAnim('LeftHit', tweentime);
		else
			TweenAnim('RightHit', tweentime);
	}
	else
		TweenAnim('GutHit', tweentime);
}

function PlayHeadHit(float tweentime)
{
	if ( (LastPainTime - Level.TimeSeconds < 0.3) && (LastPainAnim == 'HeadHit') )
	{
		if (FRand() < 0.5)
			TweenAnim('LeftHit', tweentime);
		else
			TweenAnim('RightHit', tweentime);
	}
	else
		TweenAnim('HeadHit', tweentime);
}

function PlayLeftHit(float tweentime)
{
	if ( (LastPainTime - Level.TimeSeconds < 0.3) && (LastPainAnim == 'LeftHit') )
		TweenAnim('GutHit', tweentime);
	else
		TweenAnim('LeftHit', tweentime);
}

function PlayRightHit(float tweentime)
{
	if ( (LastPainTime - Level.TimeSeconds < 0.3) && (LastPainAnim == 'RightHit') )
		TweenAnim('GutHit', tweentime);
	else
		TweenAnim('RightHit', tweentime);
}

function TweenToFighter(float tweentime)
{
    bButtonPusher = false;
	if (Region.Zone.bWaterZone)
	{
		TweenToSwimming(tweentime);
		return;
	}
	if (weapon == none )
	  TweenAnim('FIGHTER', tweentime);
	else
	  TweenToWaiting(tweentime);
}

function TweenToWalking(float tweentime)
{
	if (Region.Zone.bWaterZone )
	{
			TweenToSwimming(tweentime);
			return;
	}
    BaseEyeHeight = Default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
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
    bButtonPusher = false;
	if (Region.Zone.bWaterZone )
	{
		TweenToSwimming(tweentime);
		return;
	}
    BaseEyeHeight = Default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
	if (Weapon == None)
		TweenAnim('RUN', tweentime);
	else if ( Weapon.bPointing )
	{
		if (Weapon.Mass < 20)
			TweenAnim('RUNSMFR', tweentime);
		else
			TweenAnim('RUNLGFR', tweentime);
	}
	else
	{
		if (Weapon.Mass < 20)
			TweenAnim('RUNSM', tweentime);
		else
			TweenAnim('RUNLG', tweentime);
	}
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
		{
			ViewRotation = Rotator(Enemy.Location - Location);
		}
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
		{
			TweenAnim('STILLLGFR', tweentime);
            BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
            EyeHeight = BaseEyeHeight;
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

function WhatToDoNext(name LikelyState, name LikelyLabel)
{
	bFire = 0;
	bAltFire = 0;
    super.WhatToDoNext( LikelyState, LikelyLabel);
}

function PlayChallenge()
{
	//local float decision;
    //local name newAnim;
	local int RandNum;
    local sound voice;
    local float vol;
	local umsspacemarine Friend;
	bFire = 0;
	bAltFire = 0;
	If(AttitudeToPlayer!=ATTITUDE_Hate){
    LastTalkTime=level.TimeSeconds;
	vol = 2.0;
    LastTalker = self;
    Talker( LastTalker );
    bGetResponse=false;
    bRespond=false;

	if( !bIsFemale && bReadyToTalk && TBU != 3 )
	{
		RandNum = Rand( 12 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.MS101a';
		else if (RandNum==1)
				voice=sound'UMSMarinesII.MS101b';
		else if (RandNum==2)
				voice=sound'UMSMarinesII.MS102a';
		else if (RandNum==3)
				voice=sound'UMSMarinesII.MS102b';
		else if (RandNum==4)
				voice=sound'UMSMarinesII.MS201a';
        else if (RandNum==5)
				voice=sound'UMSMarinesII.MS201b';
        else if (RandNum==6)
				voice=sound'UMSMarinesII.MS202a';
        else if (RandNum==7)
				voice=sound'UMSMarinesII.MS202b';
        else if (RandNum==8)
				voice=sound'UMSMarinesII.MS103a';
        else if (RandNum==9)
				voice=sound'UMSMarinesII.MS103b';
        else if (RandNum==10)
				voice=sound'UMSMarinesII.MS203a';
        else if (RandNum==11)
				voice=sound'UMSMarinesII.MS203b';
	}
	else if ( bReadyToTalk && TBU != 3 )
	{
		RandNum = Rand( 6 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.MS301a';
		else if (RandNum==1)
				voice=sound'UMSMarinesII.MS301b';
		else if (RandNum==2)
				voice=sound'UMSMarinesII.MS302a';
		else if (RandNum==3)
				voice=sound'UMSMarinesII.MS302b';
		else if (RandNum==4)
				voice=sound'UMSMarinesII.MS303a';
        else if (RandNum==5)
				voice=sound'UMSMarinesII.MS303b';

	}
	else if (!bIsFemale && bReadyToTalk &&  TBU == 3 )
	{
		RandNum = Rand( 3 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.MS112';
		else if (RandNum==1)
				voice=sound'UMSMarinesII.MS212a';
		else if (RandNum==2)
				voice=sound'UMSMarinesII.MS212b';
	}
	else if (bReadyToTalk &&  TBU == 3 )
	{
		RandNum = Rand( 2 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.MS312a';
		if (RandNum==1)
				voice=sound'UMSMarinesII.MS312b';

	}
    if(voice!=none)
    {
		bReadyToTalk=False;
     	PlaySound( voice, SLOT_Talk,vol*0.9 );
     	PlaySound( voice, SLOT_None,vol*0.9 );
		if (Frand() < 0.5)
		PlayAnim('Wave');
		else
		PlayAnim('CockGun');
		if(TBU != 3)
		SetTimer(3,false);
		else{
		AttitudeToPlayer=ATTITUDE_Hate;
 		foreach RadiusActors( class'UMSSpacemarine', Friend, CommandRadius )
 		{
			if (Friend != self)
			Friend.AttitudeToPlayer=ATTITUDE_Hate;
			Friend.GotoState('Attacking');
			Friend.AcquirePhrase();
 		}
		GotoState('Attacking');}
    }}
/*
	decision = FRand();
    if (Region.Zone.bWaterZone )
       TweenToWaiting(0.1);
    else  if (  Weapon == none )
       PlayAnim('Talk');
    else if ( decision < 0.4 && Weapon != none && Weapon.bInstantHit )
    {
        if (Weapon.Mass < 20)
          PlayAnim('RELOADSM');
        else
          PlayAnim('RELOADLG');
    }
    else if ( decision < 0.8 )
	    PlayAnim('CockGun');
	else
        PlayAnim('Talk');
*/
}

Function Timer()
{
	if(!bReadyToTalk){
	TBU++;
	log(TBU);
	bReadyToTalk=True;}
}

function PlayPatrolStop()
{
	if (Region.Zone.bWaterZone )
	{
		PlaySwimming();
        return;
	}
	if ( bButtonPusher )
	{
		PushButtons();
		return;
	}
    if ( FRand() < 0.15 && weapon !=none)
	{
        if ( Weapon.Mass < 20 )
		 PlayAnim('Breathsm',, 0.3);
		else
		 PlayAnim('Breathlg2',, 0.3);
	}
    else if ( FRand() < 0.3 && weapon !=none)
    	PlayAnim('CockGun', 0.5 + 0.5 * FRand(), 0.3);
    else if ( FRand() < 0.35 )
    	PlayAnim('Look', 0.3 + 0.6 * FRand(), 0.3);
    else if ( FRand() < 0.6 )
        PlayAnim('Activate', 0.4 + 0.6 * FRand(), 0.3);
    else
        PlayAnim('Talk', 0.5, 0.3);
}

function PlayWaiting()
{
	local name newAnim;

	if (Region.Zone.bWaterZone )
	{
		PlaySwimming();
        return;
	}
	if ( bButtonPusher )
	{
		PushButtons();
		return;
	}
    BaseEyeHeight = Default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
 	if ( weapon!=none && Weapon.bPointing  )
	{
	  if ( Enemy != None )
	  {
		ViewRotation = Rotator(Enemy.Location - Location);
	  }
     else
		ViewRotation.Pitch = 0;
		ViewRotation.Pitch = ViewRotation.Pitch & 65535;
		If ( (ViewRotation.Pitch > RotationRate.Pitch)
			&& (ViewRotation.Pitch < 65536 - RotationRate.Pitch) )
		{
			If (ViewRotation.Pitch < 32768)
			{
				if ( Weapon.Mass < 20 )
					TweenAnim('AimUpSm', 0.3);
				else
					TweenAnim('AimUpLg', 0.3);
			}
			else
			{
				if ( Weapon.Mass < 20 )
					TweenAnim('AimDnSm', 0.3);
				else
					TweenAnim('AimDnLg', 0.3);
			}
			return;
         }
         if ( Weapon.Mass < 20 )
		   PlayAnim('StillSMFR',  1.0, 0.3);
		 else
		 {
           BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
           EyeHeight = BaseEyeHeight;
           PlayAnim('STILLLGFR',  1.0 , 0.3);
         }
	}
	else
	{
		if ( FRand() < 0.05 && weapon!=none)
		{
				PlayAnim('CockGun', 0.5 + 0.5 * FRand(), 0.3);
		}
        else if ( FRand() < 0.15 )
		{
				PlayAnim('Look', 0.3 + 0.6 * FRand(), 0.3);
		}
		else
		{
			if ( Weapon == None )
			{
					newAnim = 'BREATHUNARMED';
			}
			else if ( Weapon.Mass < 20 )
			{
					newAnim = 'BREATHSM';
			}
			else
			{
				if ( Health > 50 )
					newAnim = 'BREATHLG';
				else
					newAnim = 'BREATHUNARMED';
			}
			if ( AnimSequence == newAnim )
				LoopAnim(newAnim, 0.3 + 0.7 * FRand());
			else
				PlayAnim(newAnim, 0.3 + 0.7 * FRand(), 0.25);
		}
	}
}

function PlayWaitingAmbush()
{
	if (Region.Zone.bWaterZone)
	{
		PlaySwimming();
		return;
	}
	if ( bButtonPusher )
	{
		PushButtons();
		return;
	}
    if ( Weapon == none )
        LoopAnim('BREATHUNARMED', 0.3 + 0.6 * FRand());
    else if ( Weapon.Mass < 20 )
		LoopAnim('BREATHSM', 0.3 + 0.6 * FRand());
	else
    	LoopAnim('BREATHLG', 0.3 + 0.6 * FRand());
}

function PushButtons()
{
 local float decision, animspeed;

 animspeed = 0.4 + 0.6 * FRand();
 decision = FRand();
 if (decision < 0.2)
  {
   if ( Weapon == None)
       LoopAnim('BREATHUNARMED', animspeed);
   else if (Weapon.Mass < 20 )
		LoopAnim('BREATHSM', animspeed);
   else
    	LoopAnim('BREATHLG', animspeed);
  }
 else if (decision < 0.4)
 {
  LoopAnim('Activate', animspeed);
 }
 else
  LoopAnim('Button1', animspeed);
}

function PlayMeleeAttack()
{
	if ((Region.Zone.bWaterZone || Physics == PHYS_Flying) && weapon!=none)
	{
		PlayRangedAttack();
		return;
	}
	if (Frand()<0.5)
     PlayAnim('Punch');
	else
	 PlayAnim('Slam');
}

function PunchDamageTarget()
{
    if( Target==none)
       return;
	if ( MeleeDamageTarget(PunchDamage, (1000.0 * (Normal(Target.Location - Location)))) )
	{
		PlaySound(Slap, SLOT_Interact);
		PlaySound(Slap, SLOT_Misc);
	}
}

function SlamDamageTarget()
{
    if( Target==none)
       return;
	if ( MeleeDamageTarget(PunchDamage, (2000.0 * (Normal(Target.Location - Location)))) )
	{
		PlaySound(Slap, SLOT_Interact);
		PlaySound(Slap, SLOT_Misc);
	}
}

function eAttitude AttitudeToCreature(Pawn Other)
{
	if ( Other.IsA('UMSSpaceMarine') )
    	return ATTITUDE_Friendly;
    else
		return ATTITUDE_Hate;
}

function eAttitude AttitudeWithFear()
{
    return ATTITUDE_Hate;
}

state Acquisition
{
 ignores falling, landed;

	function SeePlayer(Actor SeenPlayer)
	{
		if ( SetEnemy(Pawn(SeenPlayer)) )
		{
			MakeNoise(1.0);
			LastSeenPos = Enemy.Location;
		}
	}

Playout:
		//  hurry up
Begin:
 Acceleration = vect(0,0,0);
 SetMovementPhysics();
 if (Level.TimeSeconds - LastTalkTime > 2.0)
    AcquirePhrase();
 if (Enemy!=none)
 {
  LastSeenPos = Enemy.Location;
  NotifyPeers( 'Attack', Enemy );
 }
 if ( LastTalker==self )
 {
    if (NeedToTurn(LastSeenPos))
     {
   		PlayTurning();
        TurnTo(LastSeenPos);
        FinishAnim();
     }
     MakeNoise(1.0);
	 NextAnim = '';
	 gotoState( 'Attacking' );
 }
 if (LastTalker !=none && LastTalker!=self && LastTalker.Health >0)
 {
	//log("state acquisition ....last talker "$LastTalker);
   if ( Enemy == LastTalker.Enemy && LastTalker.Enemy!=none && LastTalker.Enemy.Health >0)
	{
     if (LineOfSightTo(LastTalker) )
	 {
      if (LastTalker.bTeamLeader )
 	  {
       TurnToward( LastTalker );
	   PlayAnim( 'Salute', 1.0 );
       if( !bIsFemale )
	    {
		    Randsir = Rand( 2 );
		    if (Randsir==0)
              {
			   PlaySound( sound'UMSMarinesII.MS208a', SLOT_Talk );  //yes sir
	           PlaySound( sound'UMSMarinesII.MS208a', SLOT_None );  //yes sir
              }
            else if (Randsir==1)
              {
               PlaySound( sound'UMSMarinesII.MS208b', SLOT_Talk );  //yes sir
               PlaySound( sound'UMSMarinesII.MS208b', SLOT_None );  //yes sir
              }
		}
		else
		{
            Randsir = Rand( 2 );
			if (Randsir==0)
              {
			   PlaySound( sound'UMSMarinesII.MS308a', SLOT_Talk );  //yes sir
               PlaySound( sound'UMSMarinesII.MS308a', SLOT_None );  //yes sir
              }
			else if (Randsir==1)
              {
               PlaySound( sound'UMSMarinesII.MS308b', SLOT_Talk );  //yes sir
               PlaySound( sound'UMSMarinesII.MS308b', SLOT_None );  //yes sir
              }
		}
     }
     else
     {
	  if (FRand()< 0.4)
       {
        TurnToward( LastTalker );
	    PlayAnim( 'Wave', 1.6 );
	   }
	 }
	}
    else
      PlayAnim( 'Talk', 0.5 );
    FinishAnim();
   }
  if (NeedToTurn(LastSeenPos))
  {
  	 PlayTurning();
     TurnTo(LastSeenPos);
     FinishAnim();
  }
 }
 GotoState( 'Attacking' );
}

function PlayVictoryDance()
{
    if(HeadRegion.Zone.bWaterZone)
      return;
	if( FRand() < 0.35 )
	  PlayAnim( 'Victory' );
	if( FRand() < 0.5 )
	  PlayAnim( 'wave2a' );
	else
	  GotoState( 'KillVictory' );
}

state KillVictory
{

Begin:
	bFire = 0;
	bAltFire = 0;
	FinishAnim();
	Acceleration = vect( 0, 0, 0 );
	Velocity = vect( 0, 0, 0 );
	PlayAnim( 'Talk', 0.5, 0.1 );
	FinishAnim();
	if( FRand() < 0.5 )
	{
        PlayAnim( 'Salute', 1.0 );
		FinishAnim();
	}
	GotoState( 'Roaming' );
}

function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
{
     if(Damagetype=='Marineexplo')
      return;
     if(Damagetype=='Spacewalk')
      return;
     if( InstigatedBy!=none )
     {
        if (InstigatedBy.IsA( 'UMSSpacemarine' ) && !Level.Game.bTeamGame )
           Damage=0;
    	if( InstigatedBy.IsA( 'PlayerPawn' ) && Health <= default.health* 0.75 && Health >= 30 )
     	  {
           if ( Level.TimeSeconds - LastTalkTime > 1.0 && LastTalker!=self )
 		      HelpPhrase();
   	      }
     }
     if ( Enemy != None )
        LastSeenPos = Enemy.Location;
     super.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
}

function Talker( UMSSpacemarine Other )
{
 local UMSSpacemarine Friend;

 foreach RadiusActors( class'UMSSpacemarine', Friend, CommandRadius )
 {
		if (Friend != self)
		Friend.Reciever(Other);
 }
}

function Reciever( UMSSpacemarine Other )
{
		lastTalker=Other;
        LastTalkTime= Level.TimeSeconds;
}

function NotifyPeers( name Message, optional Pawn Other )
{
	local UMSSpacemarine Friend;

    if ( Level.TimeSeconds - MessageTime < 0.2 )
	    return;
    else
    	MessageTime = Level.TimeSeconds;

	foreach RadiusActors( class'UMSSpacemarine', Friend, CommandRadius )
	{
		if( Friend != self )
		{
            Friend.PeerNotification( Self, Message, Other );
		}
	}
}

function PeerNotification( Pawn Instigator, name Message, optional Pawn Other )
{
        MessageTime = Level.TimeSeconds;

        brespond=false;
        if ( SpecialGoal!= none )
           return;
        if(Health<0 || bDeleteme )
           return;
		if( (message == 'Attack') && (!IsInState('Acquisition') ) && (!IsInState('StartUp')) )
		{
         if( Enemy == none )
          {
		   if( Other != Enemy && Other.health>0 && SetEnemy( Other ) )
		   {
   	         LastSeenPos = Enemy.Location;
             gotoState( 'Acquisition' );
		   }
          }
         else if( Other == Enemy && Enemy.health>0)
   	       LastSeenPos = Enemy.Location;
        }
        else if( message == 'respond' && Other == Enemy && Enemy.health>0 )
         brespond=true;
        else if( message == 'responded')
         brespond=false;
}

function Killed( pawn killer, pawn Other, name damageType )
{
	if( Other ==self && Killer != self )
	{
		Other.PlaySound( sound'UMSStatic', SLOT_Talk, 2.0 , true);
	}
	if( Other!=none && Other!=self && Killer == self )
	{
        KillPhrase();
	}
	Super.Killed( killer, Other, damageType );
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
		RandNum = Rand( 15 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.MS110';  //target eliminated
		else if (RandNum==1)
				voice=sound'UMSMarinesII.MS115';  //enemy's dead
		else if (RandNum==2)
				voice=sound'UMSMarinesII.MS116';  //target eliminated
		else if (RandNum==3)
				voice=sound'UMSMarinesII.MS210a';  //target eliminated
		else if (RandNum==4)
				voice=sound'UMSMarinesII.MS210b';  //target eliminated
        else if (RandNum==5)
				voice=sound'UMSMarinesII.MS216a';  //target eliminated
        else if (RandNum==6)
				voice=sound'UMSMarinesII.MS215a';  //enemy's dead
        else if (RandNum==7)
				voice=sound'UMSMarinesII.MS215b';  //enemy's dead
        else if (RandNum==8)
				voice=sound'gotemm';  //ha gotem
        else if (RandNum==9)
				voice=sound'nextonem';  // where the next one
        else if (RandNum==10)
				voice=sound'tooeasym'; //too easy
        else if (RandNum==11)
				voice=sound'sdownm'; //and stay down
        else if (RandNum==12)
				voice=sound'scratchm';  //  scratch one more
        else if (RandNum==13)
				voice=sound'messm';  // Ooo Messy Way to go
        else if (RandNum==14)
				voice=sound'ashesm';  // Ashes to ashes baby

	}
	else
	{
		RandNum = Rand( 12 );


        if (RandNum==0)
				voice=sound'UMSMarinesII.MS315a'; //enemies dead
        else if (RandNum==1)
				voice=sound'UMSMarinesII.MS315b';  //enemies dead
		else if (RandNum==2)
				voice=sound'UMSMarinesII.MS310b';  //target elim
		else if (RandNum==3)
				voice=sound'UMSMarinesII.MS316a';  //target elim
		else if (RandNum==4)
				voice=sound'UMSMarinesII.MS316b';  //target elim
        else if (RandNum==5)
				voice=sound'gotemf';  //got em
        else if (RandNum==6)
				voice=sound'takethatf'; // take that
        else if (RandNum==7)
				voice=sound'woof';  //  wooaahh
        else if (RandNum==8)
				voice=sound'adownf';  //  another one down
        else if (RandNum==9)
				voice=sound'nastyf';  //  nasty
        else if (RandNum==10)
				voice=sound'scratchf';  //  scratch one more
        else if (RandNum==11)
				voice=sound'messf';  // what a mess
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
         RandNum = Rand( 6 );
         if (RandNum==0)
		    	voice=sound'UMSMarinesII.MS214a';  //I need some help here
	     else if (RandNum==1)
				voice=sound'UMSMarinesII.MS214b';  //I need some help here
         else if (RandNum==2)
				voice=sound'UMSMarinesII.MS209a';  //Im in trouble
         else if (RandNum==3)
				voice=sound'UMSMarinesII.MS209b';  //Im in trouble
         else if (RandNum==4)
				voice=sound'UMSMarinesII.MS204a';  //I'm Hit
         else if (RandNum==5)
				voice=sound'backupm';  // need backup

	}
	else
	{
		RandNum = Rand( 6 );
        if (RandNum==0)
				voice=sound'UMSMarinesII.MS314a'; //I need some help here
		else if (RandNum==1)
				voice=sound'UMSMarinesII.MS314b'; //I need some help here
        else if (RandNum==2)
				voice=sound'UMSMarinesII.MS309a';  //Im in trouble
        else if (RandNum==3)
				voice=sound'UMSMarinesII.MS309b';  //Im in trouble
        else if (RandNum==4)
				voice=sound'UMSMarinesII.MS304a';  //I'm Hit
        else if (RandNum==5)
				voice=sound'backupf';  // I need backup
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

	if( !bIsFemale )
	{
  	    RandNum = Rand( 7 );

    	if (RandNum==0)
				voice=sound'UMSMarinesII.MS106'; //target acquired
		else if (RandNum==1)
				voice=sound'UMSMarinesII.MS206a'; //target acquired
		else if (RandNum==2)
				voice=sound'UMSMarinesII.MS206b'; //target acquired
        else if (RandNum==3)
				voice=sound'incomingm'; //incoming
        else if (RandNum==4)
				voice=sound'lockm'; //lock amd load
        else if (RandNum==5)
				voice=sound'lookoutm'; //look out
        else if (RandNum==6)
				voice=sound'companym'; //we got company
	}
	else
	{
		RandNum = Rand( 6 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.MS306a'; //target acquired
		else if (RandNum==1)
				voice=sound'UMSMarinesII.MS306b';  //target acquired
        else if (RandNum==2)
				voice=sound'incomingf'; //incoming
        else if (RandNum==3)
				voice=sound'lookoutf'; //look out
        else if (RandNum==4)
				voice=sound'heref'; //here we go
        else if (RandNum==5)
				voice=sound'companyf'; //we got company
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
       	RandNum = Rand( 17 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.MS111';  //fire
		else if (RandNum==1)
				voice=sound'UMSMarinesII.MS211a'; //fire
		else if (RandNum==2)
				voice=sound'UMSMarinesII.MS211b';  //fire
        else if (RandNum==3)
				voice=sound'UMSMarinesII.MS212a'; //open fire
		else if (RandNum==4)
				voice=sound'UMSMarinesII.MS212b'; //open fire
		else if (RandNum==5)
				voice=sound'UMSMarinesII.MS213a'; //attack my target
		else if (RandNum==6)
				voice=sound'UMSMarinesII.MS213b'; //attack my target
		else if (RandNum==7)
				voice=sound'UMSMarinesII.MS112';  //open fire
		else if (RandNum==8)
				voice=sound'UMSMarinesII.MS113';  //attack my target
        else if (RandNum==9)
				voice=sound'UMSMarinesII.MS205a'; //im closing in
		else if (RandNum==10)
				voice=sound'UMSMarinesII.MS205b'; //im closing in
        else if (RandNum==11)
				voice=sound'UMSMarinesII.MS207a'; //go
		else if (RandNum==12)
				voice=sound'UMSMarinesII.MS207b'; //go
		else if (RandNum==13)
				voice=sound'covermem';  //cover me
		else if (RandNum==14)
				voice=sound'gogom';  //go go go
		else if (RandNum==15)
				voice=sound'moveitm';  //move it
		else if (RandNum==16)
				voice=sound'movem';  //move move move

        if((RandNum==0 || RandNum==1 || RandNum==2 || RandNum==3 || RandNum==4
           || RandNum==5 || RandNum==6 || RandNum==7 || RandNum==8
           || RandNum==13)&& FRand()<0.5)

           bGetResponse=true;
	}
	else
	{
		RandNum = Rand( 12 );

		if (RandNum==0)
				voice=sound'UMSMarinesII.MS305a';  //im closing in
        else if (RandNum==1)
				voice=sound'UMSMarinesII.MS305b';  //im closing in
		else if (RandNum==2)
				voice=sound'UMSMarinesII.MS311a';  //fire
		else if (RandNum==3)
				voice= sound'UMSMarinesII.MS311b';  //fire
		else if (RandNum==4)
				voice= sound'UMSMarinesII.MS312a';  //open fire
		else if (RandNum==5)
				voice=sound'UMSMarinesII.MS312b';  //open fire
		else if (RandNum==6)
				voice=sound'UMSMarinesII.MS313a';  //attack my target
		else if (RandNum==7)
				voice=sound'UMSMarinesII.MS313b';  //attack my target
        else if (RandNum==8)
				voice=sound'UMSMarinesII.MS307a';  //go
		else if (RandNum==9)
				voice=sound'UMSMarinesII.MS307b';  //go
		else if (RandNum==10)
				voice=sound'covermef';  //cover me
		else if (RandNum==11)
				voice=sound'gogof';  //go go

        if(( RandNum==2 || RandNum==3 || RandNum==4 || RandNum==5 || RandNum==6
           || RandNum==7 )&& FRand()<0.5)
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


state Waiting
{
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if ( Enemy != None )
			LastSeenPos = Enemy.Location;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else if ( Enemy != None && Enemy.Health >0 )
        {
 		    NotifyPeers( 'Attack', Enemy );
		 	GotoState('Attacking');
        }
	}

	function EnemyAcquired()
	{
		GotoState('Acquisition');
	}

    function BeginState()
	{
		HaltFiring();
        super.BeginState();
	}
}

state Roaming
{
	ignores EnemyNotVisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
        if ( Enemy != None )
	 	{
		 	LastSeenPos = Enemy.Location;
            NotifyPeers( 'Attack', Enemy );
		 	if ( NextState == 'TakeHit' )
		 	 {
		 	 	NextState = 'Attacking'; //default
		 	 	NextLabel = 'Begin';
		 	 	GotoState('TakeHit');
			 }
		 	else
			  GotoState('Attacking');
		}
	}

	function EnemyAcquired()
	{
		GotoState('Acquisition');
	}

    function BeginState()
	{
		HaltFiring();
        super.BeginState();
	}
}

state Wandering
{
	ignores EnemyNotVisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if ( Enemy != None && Enemy.Health >0 )
		 {
			LastSeenPos = Enemy.Location;
            NotifyPeers( 'Attack', Enemy );
		 }
		if ( NextState == 'TakeHit' )
		 {
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		 }
		else
			GotoState('Attacking');
	}

	function EnemyAcquired()
	{
		GotoState('Acquisition');
	}

    function BeginState()
	{
		HaltFiring();
        super.BeginState();
	}
}

state MeleeAttack
{
ignores SeePlayer, HearNoise, Bump;


	function BeginState()
	{
	 if ( skill <= 1 )
	   bCanDuck = false;
     else
       bCanDuck = true;

	  bFire = 0;
	  bAltFire = 0;
 	  Super.BeginState();
	}

	function EndState()
	{
	    super.EndState();
	    bCanDuck = false;
	}
}

state Charging
{
ignores SeePlayer, HearNoise;


    function AnimEnd()
    {
     super.AnimEnd();
     if(bRespond && Level.TimeSeconds - LastTalkTime > 1.0 )
     RespondPhrase();
    }

	function Timer()
	{
   	    if ( Health <=0 || bDeleteme )
	      return;
		bReadyToAttack = True;
        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		{
			GotoState('Attacking');
			return;
		}
		Target = Enemy;
		if (VSize(Enemy.Location - Location)
				<= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			GotoState('MeleeAttack');
		else if ( bHasRangedAttack && (FRand() > 0.7 + 0.1 * skill) )
			GotoState('RangedAttack');
		else if ( bHasRangedAttack && !bMovingRangedAttack)
		{
			if ( FRand() < CombatStyle * 0.8 )
				SetTimer(1.0,false);
			else
				GotoState('Attacking');
		}
	}

	function BeginState()
	{
	 if ( skill <= 1 )
	   bCanDuck = false;
     else
       bCanDuck = true;

      bGetResponse=false;
      if ( Level.TimeSeconds - LastTalkTime > 2.0 && LastTalker!=self)
       {
	    ChargePhrase();
        if (bGetResponse)
        {
          NotifyPeers( 'respond', Enemy );
          bRespond=false;
        }
       }
      if ( Enemy != None && Enemy.Health >0 )
       NotifyPeers( 'Attack', Enemy );
 	  Super.BeginState();
	}

	function EndState()
	{
	    super.EndState();
	    bCanDuck = false;
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
	if( (Intelligence <= BRAINS_Reptile) || actorReachable(Enemy) )
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
			NextLabel = 'Moving';
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
	if (Enemy!=none && VSize(Location - Enemy.Location) < CollisionRadius + Enemy.CollisionRadius + MeleeRange)
		Goto('GotThere');
	if ( !bFromWall && bHasRangedAttack && (FRand() > CombatStyle + 0.1) )
		GotoState('Attacking');
	MoveTimer = 0.0;
	bFromWall = false;
	Goto('CloseIn');

GotThere:
   if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');
   Target = Enemy;
   GotoState('MeleeAttack');

TakeHit:
   TweenToRunning(0.12);
   if (MoveTarget == Enemy)
   {
      bCanFire = true;
	  MoveToward(MoveTarget);
   }

   goto('Charge');
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
		NextAnim = AnimSequence;
		GotoState('FallingState');
	}

	function BeginState()
	{
      bGetResponse=false;
      if ( Level.TimeSeconds - LastTalkTime > 2.0 && LastTalker!=self )
       {
	    ChargePhrase();
        if (bGetResponse)
        {
          NotifyPeers( 'respond', Enemy );
          bRespond=false;
        }
       }
	  super.BeginState();
	}

	function Timer()
	{
		bReadyToAttack = True;
   	    if ( Health <=0 || bDeleteme )
	      return;
	    Enable('Bump');
	    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    {
        	GotoState('Attacking');
        	return;
        }
		Target = Enemy;
		if (VSize(Enemy.Location - Location)
				<= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			GotoState('MeleeAttack');
		else if ( FRand() > 0.5 + 0.17 * skill || skill>1)// stand still occasionally
			GotoState('RangedAttack');
	}

	function PainTimer()
	{
	    if ( Health <=0 || bDeleteme )
	      return;
		if ( (FootRegion.Zone.bPainZone) && (FootRegion.Zone.DamagePerSec > 0)
			&& (FootRegion.Zone.DamageType != ReducedDamageType)
            && (FootRegion.Zone.DamageType != 'spacewalk') )
			GotoState('Retreating');
		Super.PainTimer();
	}

    function AnimEnd()
    {
     super.AnimEnd();
     if(bRespond && Level.TimeSeconds - LastTalkTime > 1.0 )
     RespondPhrase();
    }
}

auto state StartUp
{
ignores PeerNotification;

}

function Died(pawn Killer, name damageType, vector HitLocation)
{
	if ( bDeleteMe )
		return;
	if ( !Level.Game.bDeathMatch && bIsPlayer )
	       bIsPlayer=false;
	if ( bTeleportWhenHurt )
	{
        bExplodeWhenHurt=false;
	    PlayAnim('Activate');
        bInitz=true;
	    GotoState('Teleporting');
	}
	else if ( bExplodeWhenHurt )
	{
		PlayAnim('Activate');
		GotoState('Exploding');
	}
	else
		Super.Died(Killer, damageType, HitLocation);
}

state Exploding
{
ignores PeerNotification, TakeDamage, SeePlayer, EnemyNotVisible, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget, Died;

     function destroyed()
     {
      MakeNoise(1.0);
      super.destroyed();
      if ( bExplodeWhenHurt )
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

	function BeginState()
	{
		bStasis = false;
        Acceleration = Vect(0,0,0);
		SetPhysics(PHYS_None);
	}

Begin:
 FinishAnim();
 Playsound(ActiveExlo);
 sleep(0.5);
 Notifydeath();
 Destroy();
}

State Teleporting
{
ignores PeerNotification, TakeDamage, SeePlayer, EnemyNotVisible, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget, Died;

	function Tick(float DeltaTime)
	{
		local int NewFatness;
        local Actor A;

        if( bInitz )
           return;
        if(Weapon!=none)
        {
             Weapon.style=style;
             Weapon.ScaleGlow=ScaleGlow;
             Weapon.fatness=fatness;
        }
		if ( Style == STY_Translucent )
		{
			ScaleGlow -= 3 * DeltaTime;
	    	if ( ScaleGlow < 0.3 )
	     	{
		    	if ( event != '' )
		    		ForEach AllActors( class'Actor', A, event )
		    		if (enemy!=none)
		    		 A.Trigger( Self, Enemy );
		    		else
		      		 A.Trigger( Self, self );
		        if(!bDeleteme)
		        	Destroy();
		    }
			return;
		}
		else
		{
			NewFatness = fatness - 100 * DeltaTime;
			if ( NewFatness < 80 )
			{
				bUnlit = true;
				ScaleGlow = 2.0;
				Style = STY_Translucent;
			}
		}

		fatness = Clamp(NewFatness, 0, 255);
	}

	function BeginState()
	{
		bStasis = false;
        Acceleration = Vect(0,0,0);
		SetPhysics(PHYS_None);
	}

Begin:
	FinishAnim();
	bInitz=false;
    PlaySound(sound'Teleport1',, 8.0);
    Spawn(class'SMteleport');
}

defaultproperties
{
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
	HumanKillMessage=" was blown away by a UMS Space Marine"
	WalkingSpeed=0.2
	CarcassType=Class'UMSMarinesII.UMSSpaceMarineCarcass'
	Health=100
	MeleeRange=60.0
	GroundSpeed=380.0
	AccelRate=1248.0
	JumpZ=425.0
	BaseEyeHeight=39.0
	EyeHeight=39.0
	UnderWaterTime=-1.0
	CombatStyle=0.2
	MenuName="UMS Space Marine"
	CollisionRadius=20.5
	CollisionHeight=41.0
	Mass=200.0
	Buoyancy=200.0
	Mesh=LodMesh'UMSMarinesII.Marine'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.JMarine7'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.JMarine8'
}
