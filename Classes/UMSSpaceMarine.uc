//=============================================================================
// UMSSpaceMarine - Asgard/Xaleros/GFour
//=============================================================================
class UMSSpaceMarine extends ScriptedPawn;

#exec OBJ LOAD FILE=..\Sounds\Ambmodern.uax
#exec AUDIO IMPORT FILE="Sounds\SFX\MAmb.WAV" NAME="MAmb" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\PowerON.WAV" NAME="PowerON" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\PowerOFF.WAV" NAME="PowerOFF" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\Voice\sirmale.WAV" NAME="sirmale" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\sirfemale.WAV" NAME="sirfemale" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\SFX\clank.WAV" NAME="clank" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\Voice\snore.WAV" NAME="snore" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Voice\stepm.WAV" NAME="stepm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\stepf.WAV" NAME="stepf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\gladm.WAV" NAME="gladm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\gladf.WAV" NAME="gladf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\bodiesm.WAV" NAME="bodiesm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\bodiesf.WAV" NAME="bodiesf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\moveonm.WAV" NAME="moveonm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\moveonf.WAV" NAME="moveonf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\howm.WAV" NAME="howm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\howf.WAV" NAME="howf" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Voice\hopelessm.WAV" NAME="hopelessm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\hopelessf.WAV" NAME="hopelessf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\bastm.WAV" NAME="bastm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\bastf.WAV" NAME="bastf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\closem.WAV" NAME="closem" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\closef.WAV" NAME="closef" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\hellm.WAV" NAME="hellm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\hellf.WAV" NAME="hellf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\godm.WAV" NAME="godm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\godf.WAV" NAME="godf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\nightm.WAV" NAME="nightm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\nightf.WAV" NAME="nightf" GROUP="Voice
#exec AUDIO IMPORT FILE="Sounds\Voice\startm.WAV" NAME="startm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\startf.WAV" NAME="startf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\atlastm.WAV" NAME="atlastm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\atlastf.WAV" NAME="atlastf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\luckym.WAV" NAME="luckym" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\luckyf.WAV" NAME="luckyf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\sprintm.WAV" NAME="sprintm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\sprintf.WAV" NAME="sprintf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\expectm.WAV" NAME="expectm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\expectf.WAV" NAME="expectf" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Voice\friendlyff.WAV" NAME="friendlyfF" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\friendlyfm.WAV" NAME="friendlyfM" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\coastf.WAV" NAME="coastf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\coastm.WAV" NAME="coastm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\lookoutf.WAV" NAME="lookoutf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\lookoutm.WAV" NAME="lookoutm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\incomingf.WAV" NAME="incomingf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\incomingm.WAV" NAME="incomingm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\onmywayf.WAV" NAME="onmywayf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\onmywaym.WAV" NAME="onmywaym" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\infestf.WAV" NAME="infestf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\infestm.WAV" NAME="infestm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\letsgof.WAV" NAME="letsgof" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\letsgom.WAV" NAME="letsgom" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\saddlef.WAV" NAME="saddlef" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\saddlem.WAV" NAME="saddlem" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\whatthehellf.WAV" NAME="whatthehellf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\whatthehellm.WAV" NAME="whatthehellm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\beforef.WAV" NAME="beforef" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\beforem.WAV" NAME="beforem" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\getf.WAV" NAME="getf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\getm.WAV" NAME="getm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\rogerf.WAV" NAME="rogerf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\rogerm.WAV" NAME="rogerm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\negativef.WAV" NAME="negativef" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\negativem.WAV" NAME="negativem" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\scratchf.WAV" NAME="scratchf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\scratchm.WAV" NAME="scratchm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\wasteammof.WAV" NAME="wasteammof" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\wasteammom.WAV" NAME="wasteammom" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\sorryf.WAV" NAME="sorryf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\sorrym.WAV" NAME="sorrym" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\gotemf.WAV" NAME="gotemf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\gotemm.WAV" NAME="gotemm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\UhOhf.WAV" NAME="UhOhf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\UhOhm.WAV" NAME="UhOhm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\betterf.WAV" NAME="betterf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\dammgoodm.WAV" NAME="dammgoodm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\blowupf.WAV" NAME="blowupf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\livinm.WAV" NAME="livinm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\marksmanf.WAV" NAME="marksmanf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\cockym.WAV" NAME="cockym" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\herof.WAV" NAME="herof" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\doitagainm.WAV" NAME="doitagainm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\welldonef.WAV" NAME="welldonef" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\niceworkm.WAV" NAME="niceworkm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\missionf.WAV" NAME="missionf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\tooeasym.WAV" NAME="tooeasym" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\tooeasym2.WAV" NAME="tooeasym2" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\takethatf.WAV" NAME="takethatf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\ashesm.WAV" NAME="ashesm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\messf.WAV" NAME="messf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\messm.WAV" NAME="messm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\nastyf.WAV" NAME="nastyf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\thathurtm.WAV" NAME="thathurtm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\rockf.WAV" NAME="rockf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\rockm.WAV" NAME="rockm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\covermef.WAV" NAME="covermef" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\covermem.WAV" NAME="covermem" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\bestf.WAV" NAME="bestf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\seethatm.WAV" NAME="seethatm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\woof.WAV" NAME="woof" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\lockm.WAV" NAME="lockm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\wasclosef.WAV" NAME="wasclosef" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\quietm.WAV" NAME="quietm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\hif.WAV" NAME="hif" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\hif2.WAV" NAME="hif2" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\him.WAV" NAME="him" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\him2.WAV" NAME="him2" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\playf.WAV" NAME="playf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\nextonem.WAV" NAME="nextonem" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\prepf.WAV" NAME="prepf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\prepm.WAV" NAME="prepm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\adownf.WAV" name="adownf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\sdownm.WAV" name="sdownm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\takeemf.WAV" name="takeemf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\takeemm.WAV" name="takeemm" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Voice\seeyaf.WAV" NAME="seeyaf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\seeyam.WAV" NAME="seeyam" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\seeyaf2.WAV" NAME="seeyaf2" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\seeyam2.WAV" NAME="seeyam2" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\backupf.WAV" NAME="backupf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\backupm.WAV" NAME="backupm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\hellof.WAV" NAME="hellof" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\hellom.WAV" NAME="hellom" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Voice\brbackf.WAV" NAME="brbackf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\brbackm.WAV" name="brbackm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\breakf.WAV" NAME="breakf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\breakm.WAV" name="breakm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\sloggingf.WAV" NAME="sloggingf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\sloggingm.WAV" name="sloggingm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\heref.WAV" name="heref" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\herem.WAV" name="herem" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\imgoodf.WAV" name="imgoodf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\imgoodm.WAV" name="imgoodm" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Voice\companyf.WAV" name="companyf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\companym.WAV" name="companym" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\gogom.WAV" name="gogom" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\gogof.WAV" name="gogof" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\moveitm.WAV" name="moveitm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\movem.WAV" name="movem" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Voice\imonitf.WAV" name="imonitf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\imonitm.WAV" name="imonitm" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\affirmativef.WAV" name="affirmativef" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\affirmativem.WAV" name="affirmativem" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Voice\willdom.WAV" name="willdom" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\aquiref.WAV" name="aquiref" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\okf.WAV" name="okf" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\yougotitm.WAV" name="yougotitm" GROUP="Voice"

#exec AUDIO IMPORT FILE="Sounds\Voice\ten4f.WAV" name="ten4f" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\ten4m.WAV" name="ten4m" GROUP="Voice"

#exec OBJ LOAD FILE=Textures\FX\beam.utx PACKAGE=UMSMarinesII.FX
#exec AUDIO IMPORT FILE="SOUNDS\SFX\CloakOff.WAV" NAME="BeamedIn" GROUP="SFX"

#exec texture IMPORT NAME=MCloak FILE=Textures\FX\MCloak.PCX GROUP="FX"
#exec AUDIO IMPORT FILE="Sounds\SFX\MCloakL.WAV" NAME="MCloakL" GROUP="SFX"

#exec OBJ LOAD FILE=..\Sounds\Marine.uax PACKAGE=UMSMarinesII.Voice
#exec OBJ LOAD FILE=..\Sounds\Activates.uax

#exec AUDIO IMPORT FILE="Sounds\SFX\UMSStatic.WAV" NAME="UMSStatic" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st1.WAV" NAME="st1" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st2.WAV" NAME="st2" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st3.WAV" NAME="st3" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st4.WAV" NAME="st4" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st5.WAV" NAME="st5" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st6.WAV" NAME="st6" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st7.WAV" NAME="st7" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st8.WAV" NAME="st8" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st9.WAV" NAME="st9" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\st10.WAV" NAME="st10" GROUP="SFX"

#exec AUDIO IMPORT FILE="Sounds\Footsteps\MetalHollowR.WAV" NAME="MStep1" GROUP="Footsteps"
#exec AUDIO IMPORT FILE="Sounds\Footsteps\MetalHollowR2.WAV" NAME="MStep2" GROUP="Footsteps"
#exec AUDIO IMPORT FILE="Sounds\Footsteps\MetalHollowL.WAV" NAME="MStep3" GROUP="Footsteps"
#exec AUDIO IMPORT FILE="Sounds\Footsteps\MetalHollowL2.WAV" NAME="MStep4" GROUP="Footsteps"

#exec AUDIO IMPORT FILE="Sounds\SFX\tripExplo.WAV" NAME="tripExplo" GROUP="SFX"
#exec AUDIO IMPORT FILE="Sounds\SFX\TWalarm.WAV" NAME="TWalarm" GROUP="SFX"

#exec mesh IMPORT MESH=UMSMarine ANIVFILE=MODELS\UMSMarine\UMSMarine_a.3d DATAFILE=MODELS\UMSMarine\UMSMarine_d.3d X=0 Y=0 Z=0 UNMIRROR=0
#exec mesh ORIGIN MESH=UMSMarine X=0 Y=0 Z=0

//cleaned up these animations... tagged OBSOLETE are animations from older versions (pre v2.00) or test anims

#exec mesh SEQUENCE MESH=UMSMarine SEQ=All         STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSMarine SEQ=ACTIVATE   STARTFRAME=26 NUMFRAMES=26
#exec MESH SEQUENCE MESH=UMSMarine SEQ=AIMDNLG    STARTFRAME=53 NUMFRAMES=1  Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=AIMDNSM    STARTFRAME=55 NUMFRAMES=1  Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=AIMUPLG    STARTFRAME=57 NUMFRAMES=1  Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=AIMUPSM    STARTFRAME=59 NUMFRAMES=1  Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=BACKSTEP    STARTFRAME=833 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=UMSMarine SEQ=BACKSTEPLGFR STARTFRAME=848 NUMFRAMES=15 RATE=20 Group=MovingAttack
#exec MESH SEQUENCE MESH=UMSMarine SEQ=BACKSTEPSMFR STARTFRAME=863 NUMFRAMES=15 RATE=20 Group=MovingAttack
#exec mesh SEQUENCE MESH=UMSMarine SEQ=BREATH      STARTFRAME=74 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=BREATH1    STARTFRAME=81 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=BREATH2    STARTFRAME=81 NUMFRAMES=7  RATE=6  Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=BREATHUNARMED     STARTFRAME=67 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=BREATHLG    STARTFRAME=74 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=BREATHSM    STARTFRAME=81 NUMFRAMES=7  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=BREATHLG2   STARTFRAME=1015 NUMFRAMES=10 RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=BUTTON1     STARTFRAME=104 NUMFRAMES=16
#exec MESH SEQUENCE MESH=UMSMarine SEQ=COCKGUN    STARTFRAME=128 NUMFRAMES=8  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=COCKGUNL    STARTFRAME=128 NUMFRAMES=8  RATE=6  Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DEAD1       STARTFRAME=136 NUMFRAMES=16 Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DEAD2       STARTFRAME=136 NUMFRAMES=16 Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DEAD3       STARTFRAME=152 NUMFRAMES=13 Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DEAD4       STARTFRAME=165 NUMFRAMES=13 Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DEAD5       STARTFRAME=878 NUMFRAMES=16 Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DEAD6       STARTFRAME=894 NUMFRAMES=16 Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DEAD7       STARTFRAME=136 NUMFRAMES=16 Group=TakeHit
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD7A      STARTFRAME=910 NUMFRAMES=13 Group=TakeHit //torso
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD7B      STARTFRAME=923 NUMFRAMES=13 Group=TakeHit //legs
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD8A      STARTFRAME=936 NUMFRAMES=16 Group=TakeHit //leftarm backwards
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD8B      STARTFRAME=952 NUMFRAMES=16 Group=TakeHit //rightarm backwards
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD8C    STARTFRAME=1152 NUMFRAMES=12 Group=TakeHit //rightarm forwards
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD8D    STARTFRAME=1165 NUMFRAMES=12 Group=TakeHit //leftarm forwards
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD10A     STARTFRAME=968 NUMFRAMES=16 Group=TakeHit //leftleg forwards
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD10B     STARTFRAME=984 NUMFRAMES=16 Group=TakeHit //leftleg backwards
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD10C   STARTFRAME=1120 NUMFRAMES=16 Group=TakeHit //rightleg forwards
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEAD10D   STARTFRAME=1136 NUMFRAMES=16 Group=TakeHit //rightleg backwards
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DEATHEND    STARTFRAME=164 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DUCKWLKL    STARTFRAME=178 NUMFRAMES=15 RATE=15 Group=Ducking
#exec MESH SEQUENCE MESH=UMSMarine SEQ=DUCKWLKS    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Ducking
#exec MESH SEQUENCE MESH=UMSMarine SEQ=GUTHIT      STARTFRAME=208 NUMFRAMES=1  Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=HEADHIT     STARTFRAME=209 NUMFRAMES=1  Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=JUMPLGFR    STARTFRAME=210 NUMFRAMES=1  Group=Jumping
#exec MESH SEQUENCE MESH=UMSMarine SEQ=JUMPSMFR    STARTFRAME=211 NUMFRAMES=1  Group=Jumping
#exec MESH SEQUENCE MESH=UMSMarine SEQ=LANDLGFR    STARTFRAME=212 NUMFRAMES=1  Group=Landing
#exec MESH SEQUENCE MESH=UMSMarine SEQ=LANDSMFR    STARTFRAME=213 NUMFRAMES=1  Group=Landing
#exec MESH SEQUENCE MESH=UMSMarine SEQ=LEFTHIT     STARTFRAME=214 NUMFRAMES=1  Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=LOOK       STARTFRAME=230 NUMFRAMES=15 RATE=15 Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=LOOKL       STARTFRAME=230 NUMFRAMES=15 RATE=15 Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=PUNCH       STARTFRAME=245 NUMFRAMES=13 Group=Attack
#exec MESH SEQUENCE MESH=UMSMarine SEQ=FIGHTER     STARTFRAME=259 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSMarine SEQ=RAPELLING   STARTFRAME=258 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSMarine SEQ=REFPOSE     STARTFRAME=259 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSMarine SEQ=RIGHTHIT    STARTFRAME=286 NUMFRAMES=1  Group=TakeHit
#exec MESH SEQUENCE MESH=UMSMarine SEQ=run        STARTFRAME=1278 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=runlg2     STARTFRAME=1358 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=runlg3      STARTFRAME=1298 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=runlg     STARTFRAME=1378 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=runlgfr    STARTFRAME=1318 NUMFRAMES=20 RATE=34 Group=MovingAttack
#exec MESH SEQUENCE MESH=UMSMarine SEQ=runsm     STARTFRAME=1398 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=runsm2      STARTFRAME=1278 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=runsmfr    STARTFRAME=1338 NUMFRAMES=20 RATE=34 Group=MovingAttack
#exec MESH SEQUENCE MESH=UMSMarine SEQ=STRAFErLG  STARTFRAME=1418 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=STRAFErSM  STARTFRAME=1438 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=STRAFElLG  STARTFRAME=1458 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=STRAFElSM  STARTFRAME=1478 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=STRAFEl    STARTFRAME=1458 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=STRAFEr    STARTFRAME=1418 NUMFRAMES=20 RATE=34
#exec MESH SEQUENCE MESH=UMSMarine SEQ=RELOADLG   STARTFRAME=1178 NUMFRAMES=20 RATE=20 Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=RELOADSM   STARTFRAME=1198 NUMFRAMES=20 RATE=20 Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=RIFLESTOMP  STARTFRAME=260 NUMFRAMES=13 Group=Attack
#exec MESH SEQUENCE MESH=UMSMarine SEQ=RIFLESTOMP2 STARTFRAME=273 NUMFRAMES=13 Group=Attack
#exec MESH SEQUENCE MESH=UMSMarine SEQ=SALUTE     STARTFRAME=394 NUMFRAMES=7  RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=UMSMarine SEQ=SLAM        STARTFRAME=401 NUMFRAMES=10 Group=Attack
#exec MESH SEQUENCE MESH=UMSMarine SEQ=STILL       STARTFRAME=411 NUMFRAMES=1


#exec MESH SEQUENCE MESH=UMSMarine SEQ=STILLFRRP  STARTFRAME=413 NUMFRAMES=1  Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=STILLLGFR   STARTFRAME=414 NUMFRAMES=10 RATE=15 Group=Attack
#exec mesh SEQUENCE MESH=UMSMarine SEQ=STILLSMFR  STARTFRAME=432 NUMFRAMES=8 Group=Attack


#exec MESH SEQUENCE MESH=UMSMarine SEQ=SWIMLG      STARTFRAME=520 NUMFRAMES=15 RATE=15
#exec MESH SEQUENCE MESH=UMSMarine SEQ=SWIMSM      STARTFRAME=535 NUMFRAMES=15 RATE=15
#exec MESH SEQUENCE MESH=UMSMarine SEQ=TALK       STARTFRAME=565 NUMFRAMES=15 RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=UMSMarine SEQ=TREADLG     STARTFRAME=580 NUMFRAMES=15 RATE=15 Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=TREADSM     STARTFRAME=595 NUMFRAMES=15 RATE=15 Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=TURNLG     STARTFRAME=612 NUMFRAMES=2
#exec MESH SEQUENCE MESH=UMSMarine SEQ=TURNSM     STARTFRAME=616 NUMFRAMES=2
#exec MESH SEQUENCE MESH=UMSMarine SEQ=VICTORY    STARTFRAME=643 NUMFRAMES=25 RATE=20 Group=Gesture
#exec MESH SEQUENCE MESH=UMSMarine SEQ=WAVE       STARTFRAME=818 NUMFRAMES=15 RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=UMSMarine SEQ=WAVE2A      STARTFRAME=1025 NUMFRAMES=23 RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=UMSMarine SEQ=WAVE2B      STARTFRAME=1048 NUMFRAMES=12 RATE=15 Group=Gesture
#exec MESH SEQUENCE MESH=UMSMarine SEQ=WALK        STARTFRAME=668 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=UMSMarine SEQ=WALKDISARMED  STARTFRAME=1000 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=UMSMarine SEQ=WALKLG     STARTFRAME=698 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=UMSMarine SEQ=WALKLGFR   STARTFRAME=728 NUMFRAMES=15 RATE=20 Group=MovingAttack
#exec mesh SEQUENCE MESH=UMSMarine SEQ=WALKSM     STARTFRAME=758 NUMFRAMES=15 RATE=20
#exec MESH SEQUENCE MESH=UMSMarine SEQ=WALKSMFR   STARTFRAME=788 NUMFRAMES=15 RATE=20 Group=MovingAttack
#exec mesh SEQUENCE MESH=UMSMarine SEQ=WALKSTRAFEL    STARTFRAME=460 NUMFRAMES=20 RATE=20
#exec MESH SEQUENCE MESH=UMSMarine SEQ=WALKSTRAFER    STARTFRAME=500 NUMFRAMES=20 RATE=20

//reused some animations to save vertex data
#exec mesh SEQUENCE MESH=UMSMarine SEQ=TAUNT1    STARTFRAME=394 NUMFRAMES=7  Group=Gesture
#exec mesh SEQUENCE MESH=UMSMarine SEQ=TAUNT1L   STARTFRAME=394 NUMFRAMES=7  Group=Gesture
#exec mesh SEQUENCE MESH=UMSMarine SEQ=VICTORY1L STARTFRAME=643 NUMFRAMES=25 Group=Gesture
#exec mesh SEQUENCE MESH=UMSMarine SEQ=VICTORY1  STARTFRAME=643 NUMFRAMES=25 Group=Gesture
#exec mesh SEQUENCE MESH=UMSMarine SEQ=WAVEL     STARTFRAME=818 NUMFRAMES=15 Group=Gesture
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND2 STARTFRAME=151 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND3 STARTFRAME=164 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND4 STARTFRAME=177 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND5 STARTFRAME=893 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND6 STARTFRAME=909 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND7A STARTFRAME=922 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND7B STARTFRAME=935 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND8A STARTFRAME=951 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND8B STARTFRAME=967 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND10A STARTFRAME=983 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATHEND10B STARTFRAME=999 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSMarine SEQ=TALKLG    STARTFRAME=565 NUMFRAMES=15  Group=Gesture
#exec mesh SEQUENCE MESH=UMSMarine SEQ=BREATH1L  STARTFRAME=74 NUMFRAMES=7   RATE=6  Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=BREATH2L  STARTFRAME=81 NUMFRAMES=7   RATE=6  Group=Waiting
// bug in unreal playerclass typo
#exec mesh SEQUENCE MESH=UMSMarine SEQ=VITORY1   STARTFRAME=618 NUMFRAMES=25 Group=Gesture

//UT converts
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Chat1     STARTFRAME=565 NUMFRAMES=15 RATE=15 Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Chat2     STARTFRAME=565 NUMFRAMES=15 RATE=15 Group=Waiting
#exec MESH SEQUENCE MESH=UMSMarine SEQ=Thrust    STARTFRAME=230 NUMFRAMES=15 RATE=15 Group=Gesture
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DodgeB    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Jumping
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DodgeF    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Jumping
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DodgeR    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Jumping
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DodgeL    STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Jumping
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Flip      STARTFRAME=211 NUMFRAMES=1	 Group=Jumping
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Dead8     STARTFRAME=136 NUMFRAMES=16 RATE=15 Group=TakeHit
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Dead9     STARTFRAME=152 NUMFRAMES=13 RATE=15 Group=TakeHit
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Dead9B    STARTFRAME=136 NUMFRAMES=16 RATE=15
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Dead11    STARTFRAME=136 NUMFRAMES=16 RATE=15
#exec mesh SEQUENCE MESH=UMSMarine SEQ=BackRun   STARTFRAME=833 NUMFRAMES=15 RATE=15 Group=MovingFire
/*
//skaarjplayer
#exec mesh SEQUENCE MESH=UMSMarine SEQ=BREATH    STARTFRAME=74 NUMFRAMES=7  RATE=6  Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATH     STARTFRAME=136 NUMFRAMES=16
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATH2    STARTFRAME=136 NUMFRAMES=16
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATH3    STARTFRAME=152 NUMFRAMES=13
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DEATH4    STARTFRAME=165 NUMFRAMES=13
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DUCK      STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Ducking
#exec mesh SEQUENCE MESH=UMSMarine SEQ=DUCKWALK  STARTFRAME=193 NUMFRAMES=15 RATE=15 Group=Ducking
#exec mesh SEQUENCE MESH=UMSMarine SEQ=FIRING    STARTFRAME=432 NUMFRAMES=8  RATE=15 Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Getup     STARTFRAME=343 NUMFRAMES=7
#exec mesh SEQUENCE MESH=UMSMarine SEQ=INAIR     STARTFRAME=143 NUMFRAMES=1 Group=Jumping
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Jog       STARTFRAME=1298 NUMFRAMES=10 RATE=44
#exec mesh SEQUENCE MESH=UMSMarine SEQ=JogFire   STARTFRAME=1318 NUMFRAMES=10 RATE=44 Group=MovingAttack
#exec mesh SEQUENCE MESH=UMSMarine SEQ=LAND      STARTFRAME=213 NUMFRAMES=1  	Group=Landing
#exec mesh SEQUENCE MESH=UMSMarine SEQ=Lunge     STARTFRAME=193 NUMFRAMES=15 RATE=15	Group=Dodge
#exec mesh SEQUENCE MESH=UMSMarine SEQ=SWIM      STARTFRAME=535 NUMFRAMES=15 RATE=15 Group=Waiting
#exec mesh SEQUENCE MESH=UMSMarine SEQ=RightDodge  STARTFRAME=193 NUMFRAMES=15 RATE=15	Group=Dodge
#exec mesh SEQUENCE MESH=UMSMarine SEQ=LeftDodge   STARTFRAME=193 NUMFRAMES=15 RATE=15	Group=Dodge
#exec mesh SEQUENCE MESH=UMSMarine SEQ=TURN      STARTFRAME=612 NUMFRAMES=2
#exec mesh SEQUENCE MESH=UMSMarine SEQ=WalkFire  STARTFRAME=773 NUMFRAMES=15 Group=MovingAttack
*/
//=============================================================================
//NOTIFIES
//=============================================================================
#exec MESH NOTIFY MESH=UMSMarine SEQ=Run TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=Run TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunLG TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunLG TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunLG2 TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunLG2 TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunLG3 TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunLG3 TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunLGFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunLGFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunSM TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunSM TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunSM2 TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunSM2 TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunSMFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=RunSMFR TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=Walk TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=Walk TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=WalkDisarmed TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=WalkDisarmed TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=WalkLG TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=WalkLG TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=WalkLGFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=WalkLGFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=WalkSM TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=WalkSM TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=WalkSMFR TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=WalkSMFR TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=walkstrafel   TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=walkstrafel   TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=walkstrafer   TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=walkstrafer   TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=strafer   TIME=0.25 FUNCTION=PlayFootStep //Here
#exec MESH NOTIFY MESH=UMSMarine SEQ=strafer   TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=strafel   TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=strafel   TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=straferLG TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=straferLG TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=strafelLG TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=strafelLG TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=straferSM TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=straferSM TIME=0.75 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=strafelSM TIME=0.25 FUNCTION=PlayFootStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=strafelSM TIME=0.75 FUNCTION=PlayFootStep // Here
#exec mesh NOTIFY MESH=UMSMarine SEQ=Backstep TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=Backstep TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=BackstepLgFr TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=BackstepLgFr TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=BackstepSmFr TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=BackstepSmFr TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=Backrun TIME=0.25 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=Backrun TIME=0.75 FUNCTION=PlayFootStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead1 TIME=0.92 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSMarine SEQ=Dead2 TIME=0.92 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSMarine SEQ=Dead3 TIME=0.45 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead4 TIME=0.54 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead5 TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead6 TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead7 TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead7a TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead7b TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead8a TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead8b TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead8c TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead8d TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead10a TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead10b TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead10c TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead10d TIME=0.92 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Slam TIME=0.48 FUNCTION=SlamDamageTarget
#exec MESH NOTIFY MESH=UMSMarine SEQ=Slam TIME=0.67 FUNCTION=SlamDamageTarget
#exec MESH NOTIFY MESH=UMSMarine SEQ=Punch TIME=0.24 FUNCTION=PunchDamageTarget
#exec MESH NOTIFY MESH=UMSMarine SEQ=Punch TIME=0.76 FUNCTION=PunchDamageTarget
#exec MESH NOTIFY MESH=UMSMarine SEQ=RifleStomp TIME=0.5 FUNCTION=SlamDamageTarget
#exec MESH NOTIFY MESH=UMSMarine SEQ=RifleStomp2 TIME=0.5 FUNCTION=PunchDamageTarget
#exec mesh NOTIFY MESH=UMSMarine SEQ=Talk TIME=0.1 FUNCTION=radio
#exec mesh NOTIFY MESH=UMSMarine SEQ=Taunt1 TIME=0.1 FUNCTION=radio
#exec mesh NOTIFY MESH=UMSMarine SEQ=Taunt1L TIME=0.1 FUNCTION=radio
//ut notifies
#exec MESH NOTIFY MESH=UMSMarine SEQ=Dead7 TIME=0.7 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead8 TIME=0.7 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSMarine SEQ=Dead9B TIME=0.8 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Dead11 TIME=0.57 FUNCTION=LandThump
//skaarjplayer notifies
/*
#exec MESH NOTIFY MESH=UMSMarine SEQ=Death  TIME=0.41 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Death2 TIME=0.61 FUNCTION=LandThump
#exec MESH NOTIFY MESH=UMSMarine SEQ=Death3 TIME=0.73 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Death4 TIME=0.62 FUNCTION=LandThump
#exec mesh NOTIFY MESH=UMSMarine SEQ=Jog TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=Jog TIME=0.75 FUNCTION=RunStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=JogFire TIME=0.25 FUNCTION=RunStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=JogFire TIME=0.75 FUNCTION=RunStep
#exec mesh NOTIFY MESH=UMSMarine SEQ=Walk TIME=0.25 FUNCTION=WalkStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=Walk TIME=0.75 FUNCTION=WalkStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=WalkFire TIME=0.25 FUNCTION=WalkStep
#exec MESH NOTIFY MESH=UMSMarine SEQ=WalkFire TIME=0.75 FUNCTION=WalkStep
*/
//=============================================================================

//Spacemarine Textures
//=============================================================================
#exec texture IMPORT NAME=Jmarine7 FILE=Textures\Skins\Jmarine7.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=Jmarine8 FILE=Textures\Skins\jmarine8.PCX GROUP=Skins LODSET=2


//Mesh scaling
//=============================================================================
#exec MESHMAP NEW   MESHMAP=UMSMarine MESH=UMSMarine
#exec MESHMAP SCALE MESHMAP=UMSMarine X=0.1 Y=0.1 Z=0.2

//Apply Spacemarine Textures so unrealed mesh browser displays the mesh with textures
//=============================================================================
#exec MESHMAP SETTEXTURE MESHMAP=UMSMarine NUM=1 TEXTURE=Jmarine7
#exec MESHMAP SETTEXTURE MESHMAP=UMSMarine NUM=2 TEXTURE=Jmarine8


#exec mesh NOTIFY MESH=UMSMarine SEQ=COCKGUN TIME=0.45 FUNCTION=Reload
#exec mesh NOTIFY MESH=UMSMarine SEQ=COCKGUNL TIME=0.45 FUNCTION=Reload
#exec mesh NOTIFY MESH=UMSMarine SEQ=RELOADSM TIME=0.45 FUNCTION=Reload
#exec mesh NOTIFY MESH=UMSMarine SEQ=RELOADLG TIME=0.45 FUNCTION=Reload
//Struct
Struct GOverride
{
	var() bool bAlwaysMale;
	var() bool bAlwaysFemale;
};

// UMSSpaceMarine
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
var(UMSSpaceMarine) class<weapon> WeaponType;
var	  Weapon myWeapon;

var(ExtraVariables) string HumanKillMessage;
Var(UMSSpaceMarineExtras) int DispPowerLevel;
var(UMSSpaceMarineExtras) bool bCadet; // You can now just set marines to be cadets from here. to avoid having un-needed classes.
var bool bWimp;

var bool strafedodge;
var bool bBeamingIn;
var(ExtraVariables) float BeamWaitTime;
var(ExtraVariables) float BeamTime;
//var UMSMarineWaveTool MarineBeamController;
var UMSBeamOctagon Octagon;

// UMSSpaceMarine
var Pawn SaluteTarget;
var UMSSpaceMarine LastTalker;
var UMSSpaceMarine BetrayBuddy;
var float LastTalkTime;
var float MessageTime;
var(ExtraVariables) float  CommandRadius;
var(UMSSpaceMarineExtras) bool bButtonPusher;
var(UMSSpaceMarineExtras) bool bLurePlayer;

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
var(ExtraVariables) sound Reloadsound;
var(ExtraVariables) sound ChallengeTauntMale[4];
var(ExtraVariables) sound ChallengeTauntFemale[4];
var(ExtraVariables) byte	PunchDamage;
var(ExtraVariables) byte	SlamDamage;
var(UMSSpaceMarineExtras) bool	bTeleportWhenHurt;
var(UMSSpaceMarineExtras) bool bExplodeWhenHurt;
var(ExtraVariables) float ExploRange;
var(ExtraVariables) float ExploDamage;
var(ExtraVariables) float ExploMomentum;
var(UMSSpaceMarineExtras) GOverride GenderOverride;

var SilentBallExplosion sbc;
var BlackSmoke bsm;
var bool bInitz;
var int Randsir;

var int TBU;
var bool bReadyToTalk;
var bool bGetResponse;
var bool bRespond;
var bool bLuring;
var bool bActFriendly;

// UMSSM
simulated event Destroyed()
{
	local Inventory Inv;
	local Pawn OtherPawn;

	if ( Role < ROLE_Authority )
		return;

	RemovePawn();

	for( Inv=Inventory; Inv!=None; Inv=Inv.Inventory )
		Inv.Destroy();
	Weapon = None;
	Inventory = None;
	if ( bIsPlayer && (Level.Game != None) )
		Level.Game.logout(self);
	if ( PlayerReplicationInfo != None )
		PlayerReplicationInfo.Destroy();
	for ( OtherPawn=Level.PawnList; OtherPawn!=None; OtherPawn=OtherPawn.nextPawn )
		OtherPawn.Killed(None, self, '');
	super(actor).Destroyed();
}

singular function Falling()
{
	if (bCanFly)
	{
		SetPhysics(PHYS_Flying);
		return;
	}
	//log(class$" Falling");
	// SetPhysics(PHYS_Falling); //note - done by default in physics
 	if (health > 0 && !bDeleteme)
		SetFall();
}

function JumpOffPawn()
{
	Velocity += (60 + CollisionRadius) * VRand();
	Velocity.Z = 180 + CollisionHeight;
	SetPhysics(PHYS_Falling);
	bJumpOffPawn = true;
    if (health > 0 && !bDeleteme)
 	 SetFall();
}

function LongFall()
{
   if (health > 0 && !bDeleteme)
   {
	SetFall();
	GotoState('FallingState', 'LongFall');
   }
}

function Bump(actor Other)
{
	local vector VelDir, OtherDir;
	local float speed;

	if ( Health <= 0 || bDeleteme)
		return;
	if ( Enemy != None )
	{
		if (Other == Enemy)
		{
			GotoState('MeleeAttack');
			return;
		}
		else if ( (Pawn(Other) != None) && SetEnemy(Pawn(Other)) )
		{
			GotoState('MeleeAttack');
			return;
		}
	}
	else
	{
		if (Pawn(Other) != None)
		{
			AnnoyedBy(Pawn(Other));
			if ( SetEnemy(Pawn(Other)) )
			{
				bReadyToAttack = True; //can melee right away
				PlayAcquisitionSound();
				GotoState('Attacking');
				return;
			}
		}
		//if ( TimerRate <= 0 )
			//setTimer(1.0, false);
		if ( bCanSpeak && (ScriptedPawn(Other) != None) && ((TeamLeader == None) || !TeamLeader.bTeamSpeaking) )
			SpeakTo(ScriptedPawn(Other));
	}

	speed = VSize(Velocity);
	if ( speed > 1 )
	{
		VelDir = Velocity/speed;
		VelDir.Z = 0;
		OtherDir = Other.Location - Location;
		OtherDir.Z = 0;
		OtherDir = Normal(OtherDir);
		if ( (VelDir dot OtherDir) > 0.8 )
		{
			/*if ( Pawn(Other) == None )
			{
				MoveTimer = -1.0;
				HitWall(-1 * OtherDir, Other);
			} */
			Velocity.X = VelDir.Y;
			Velocity.Y = -1 * VelDir.X;
			Velocity *= FMax(speed, 280);
		}
	}
	Disable('Bump');
}

singular event BaseChange()
{
	local float decorMass;

    if(bDeleteme)
       return;
	if ( (base == None) && (Physics == PHYS_None) )
		SetPhysics(PHYS_Falling);
	else if (Pawn(Base) != None)
	{
	    if(!Pawn(Base).bDeleteme && Pawn(base).Health > 0)
		Pawn(Base).TakeDamage( (1-Velocity.Z/400)* Mass/Base.Mass, Self,Location,0.5 * Velocity , 'stomped');
		JumpOffPawn();
	}
	else if ( Decoration(Base) != None && !Decoration(Base).bStatic)
    {
     if (  Velocity.Z < -400 || (mass> 200 && Physics != PHYS_None && Decoration(Base).bPushable) )
      {
		decorMass = FMax(Decoration(Base).Mass, 1);
		if(!Decoration(Base).bDeleteme)
		Decoration(Base).TakeDamage((-2* Mass/decorMass * Velocity.Z/400), Self, Location, 0.5 * Velocity, 'stomped');
      }
   }
}

function AddVelocity( vector NewVelocity)
{
    if(Health <=0 || bDeleteme)
    {
     Disable('Hitwall');
     Disable('Bump');
    }
	if (Physics == PHYS_Walking)
		SetPhysics(PHYS_Falling);
	if ( (Velocity.Z > 380) && (NewVelocity.Z > 0) )
		NewVelocity.Z *= 0.5;
	Velocity += NewVelocity;
}

event FootZoneChange(ZoneInfo newFootZone)
{
	local actor HitActor;
	local vector HitNormal, HitLocation;
	local float splashSize;
	local actor splash;

	if ( Level.NetMode == NM_Client )
		return;
	if ( Level.TimeSeconds - SplashTime > 0.25 )
	{
		SplashTime = Level.TimeSeconds;
		if (Physics == PHYS_Falling)
			MakeNoise(1.0);
		else
			MakeNoise(0.3);
		if ( FootRegion.Zone.bWaterZone )
		{
			if ( !newFootZone.bWaterZone && (Role==ROLE_Authority) )
			{
				if ( FootRegion.Zone.ExitSound != None )
					PlaySound(FootRegion.Zone.ExitSound, SLOT_Interact, 1);
				if ( FootRegion.Zone.ExitActor != None )
					Spawn(FootRegion.Zone.ExitActor,,,Location - CollisionHeight * vect(0,0,1));
			}
		}
		else if ( newFootZone.bWaterZone && (Role==ROLE_Authority) )
		{
			splashSize = FClamp(0.000025 * Mass * (300 - 0.5 * FMax(-500, Velocity.Z)), 1.0, 4.0 );
			if ( newFootZone.EntrySound != None )
			{
				HitActor = Trace(HitLocation, HitNormal,
						Location - (CollisionHeight + 40) * vect(0,0,0.8), Location - CollisionHeight * vect(0,0,0.8), false);
				if ( HitActor == None )
					PlaySound(newFootZone.EntrySound, SLOT_Misc, 2 * splashSize);
				else
					PlaySound(WaterStep, SLOT_Misc, 1.5 + 0.5 * splashSize);
			}
			if( newFootZone.EntryActor != None )
			{
				splash = Spawn(newFootZone.EntryActor,,,Location - CollisionHeight * vect(0,0,1));
				if ( splash != None )
					splash.DrawScale = splashSize;
			}
			//log("Feet entering water");
		}
	}

	if (FootRegion.Zone.bPainZone)
	{
		if ( !newFootZone.bPainZone && !HeadRegion.Zone.bWaterZone )
			PainTime = -1.0;
	}
	else if (newFootZone.bPainZone)
    {
      if ( (ReducedDamageType == 'All') ||
		((ReducedDamageType != '') && (ReducedDamageType == newFootZone.damageType)
         && ReducedDamagePct > 0 ) )
		PainTime = -1.0;
      else
		PainTime = 0.01;
    }
}

function SetFall()
{
	if (Enemy != None)
	{
		NextState = 'Attacking'; //default
		NextLabel = 'Begin';
        NextAnim = AnimSequence;
		GotoState('FallingState');
	}
}

singular function SpawnGibbedCarcass()
{
	local carcass carc;

	carc = Spawn(CarcassType);
	if ( carc != None )
	{
		carc.Initfor(self);
		carc.ChunkUp(-1 * Health);
	}
}

singular function Carcass SpawnCarcass()
{
	local carcass carc;

	carc = Spawn(CarcassType);
	if ( carc != None )
		carc.Initfor(self);

	return carc;
}

function gibbedBy(actor Other)
{
	local pawn instigatedBy;

	if ( Role < ROLE_Authority )
		return;
	instigatedBy = pawn(Other);
	if (instigatedBy == None)
		instigatedBy = Other.instigator;
	health = -1000; //make sure gibs
	Died(instigatedBy, 'Gibbed', Location);
}

function eAttitude AttitudeTo(Pawn Other)
{
	if (Other.bIsPlayer && Other!=none && !Other.IsA('ScriptedPawn'))
	{
		if (bIsPlayer && Level.Game.IsA('TeamGame') && (Other.PlayerReplicationInfo != none) && (Team == Other.PlayerReplicationInfo.Team) )
			return ATTITUDE_Friendly;
		else if ( (Intelligence > BRAINS_None) &&
			((AttitudeToPlayer == ATTITUDE_Hate) || (AttitudeToPlayer == ATTITUDE_Threaten)
				|| (AttitudeToPlayer == ATTITUDE_Fear)) ) //check if afraid
		{
			if (RelativeStrength(Other) > Aggressiveness)
				AttitudeToPlayer = AttitudeWithFear();
            else if (AttitudeToPlayer == ATTITUDE_Fear)
                AttitudeToPlayer = ATTITUDE_Hate;
		}
		return AttitudeToPlayer;
	}
	if (Hated == Other && Other!=none)
	{
		if (RelativeStrength(Other) >= Aggressiveness)
			return AttitudeWithFear();
		else
			return ATTITUDE_Hate;
	}
    else if (Other.IsA('ScriptedPawn') && Other!=none )
	{
	 if ( (TeamTag != '') && (TeamTag == ScriptedPawn(Other).TeamTag) )
		return ATTITUDE_Friendly;
	 else if ( bIsPlayer && Level.Game.IsA('TeamGame') )
     {
       if(ScriptedPawn(Other).Team == Team )
			return ATTITUDE_Friendly;
       else
       {
		 if (RelativeStrength(Other) >= Aggressiveness)
			 return AttitudeWithFear();
		 else
		     return ATTITUDE_Hate;
       }
    }
	else
		return AttitudeToCreature(Other);
    }
    else
      return ATTITUDE_Ignore;
}

function Trigger( actor Other, pawn EventInstigator )
{
	local Pawn currentEnemy;

	if ( (Other == Self) || (Health <= 0) || (bDeleteme) )
		return;
	if ( bHateWhenTriggered )
	{
		if ( EventInstigator.bIsPlayer)
			AttitudeToPlayer = ATTITUDE_Hate;
		else
			Hated = EventInstigator;
	}
	currentEnemy = Enemy;
	SetEnemy(EventInstigator);
	if (Enemy != currentEnemy)
	{
		PlayAcquisitionSound();
		GotoState('Attacking');
	}
}

function rotator AdjustAim(float projSpeed, vector projStart, int aimerror, bool leadTarget, bool warnTarget)
{
	local rotator FireRotation;
	local vector FireSpot;
	local actor HitActor;
	local vector HitLocation, HitNormal;
    local int modifier;

	if ( Target == None )
	  {
	   if ( enemy != none && enemy.health >0  && !enemy.bDeleteme && enemy!=self )
		Target = Enemy;
      }
	if ( Target == None)
		return Rotation;
	if ( !Target.IsA('Pawn') )
		return rotator(Target.Location - Location);

	FireSpot = Target.Location;

	aimerror = aimerror * (1 - 10 *
		((Normal(Target.Location - Location)
			Dot Normal((Target.Location + 0.5 * Target.Velocity) - (Location + 0.5 * Velocity))) - 1));

	aimerror = aimerror * (2.4 - 0.5 * (skill + FRand()));
    modifier = FClamp(Level.Game.difficulty-3, 1, 3);
    if(Level.Game.difficulty > 3)
      aimerror *= 1-(0.3*modifier);

	if (leadTarget && (projSpeed > 0))
	{
		FireSpot += FMin(1, 0.7 + 0.6 * FRand()) * (Target.Velocity * VSize(Target.Location - ProjStart)/projSpeed);
		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
		if (HitActor != None)
			FireSpot = 0.5 * (FireSpot + Target.Location);
	}

	HitActor = self; //so will fail first check unless shooting at feet
	if ( bIsPlayer && (Location.Z + 19 >= Target.Location.Z) && Target.IsA('Pawn')
		&& (Weapon != None) && Weapon.bSplashDamage && (0.5 * (skill - 1) > FRand()) )
	{
		// Try to aim at feet
 		HitActor = Trace(HitLocation, HitNormal, FireSpot - vect(0,0,80), FireSpot, false);
		if ( HitActor != None )
		{
			FireSpot = HitLocation + vect(0,0,3);
			HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
		}
		else
			HitActor = self;
	}
	if ( HitActor != None )
	{
		//try middle
		FireSpot.Z = Target.Location.Z;
 		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
	}
	if( HitActor != None )
	{
		////try head
 		FireSpot.Z = Target.Location.Z + 0.9 * Target.CollisionHeight;
 		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
	}
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

function bool CanFireAtEnemy()
{
	local vector HitLocation, HitNormal, EnemyDir, EnemyUp;
	local actor HitActor;
	local float EnemyDist;

	if ( Enemy == none || enemy.health <= 0 || enemy.bdeleteme || Enemy == self )
     return false;
	EnemyDir = Enemy.Location - Location;
	EnemyDist = VSize(EnemyDir);
	EnemyUp = Enemy.CollisionHeight * vect(0,0,0.9);
	if ( EnemyDist > 300 )
	{
		EnemyDir = 300 * EnemyDir/EnemyDist;
		EnemyUp = 300 * EnemyUp/EnemyDist;
	}

	HitActor = Trace(HitLocation, HitNormal, Location + EnemyDir + EnemyUp, Location, true);

	if ( (HitActor == None) || (HitActor == Enemy)
		|| ((Pawn(HitActor) != None) && (AttitudeTo(Pawn(HitActor)) <= ATTITUDE_Ignore)) )
		return true;

	HitActor = Trace(HitLocation, HitNormal, Location + EnemyDir, Location, true);

	return ( (HitActor == None) || (HitActor == Enemy)
			|| ((Pawn(HitActor) != None) && (AttitudeTo(Pawn(HitActor)) <= ATTITUDE_Ignore)) );
}

function bool ChooseTeamAttackFor(ScriptedPawn TeamMember)
{
	if ( (Enemy == None) && TeamMember != none && (TeamMember.Enemy != None) && LineOfSightTo(TeamMember) )
	{
		if (SetEnemy(TeamMember.Enemy))
			MakeNoise(1.0);
	}
	if ( TeamMember != none && TeamMember.health > 0 && !TeamMember.bDeleteme && !bTeamSpeaking )
		SpeakOrderTo(TeamMember);
	if ( TeamMember == self )
	{
		ChooseLeaderAttack();
		return true;
	}

	if ( TeamMember != none && TeamMember.Enemy != none && TeamMember.bReadyToAttack )
	{
		TeamMember.Target = TeamMember.Enemy;
		Enemy=TeamMember.Enemy;
		if ( TeamMember.health > 0 && !TeamMember.bDeleteme && VSize(Enemy.Location - Location) <= (TeamMember.MeleeRange + TeamMember.Enemy.CollisionRadius + TeamMember.CollisionRadius))
		{
			TeamMember.GotoState('MeleeAttack');
			return true;
		}
		else if (TeamMember.bMovingRangedAttack || (TeamMember.TeamID == 1) )
			TeamMember.SetTimer(TimeBetweenAttacks, False);
		else if ( TeamMember.bHasRangedAttack && (TeamMember.bIsPlayer || TeamMember.Enemy.bIsPlayer) && TeamMember.CanFireAtEnemy() )
		{
			if ( TeamMember.health > 0 && !TeamMember.bDeleteme && (!TeamMember.bIsPlayer || (3 * FRand() > Skill)) )
			{
				TeamMember.GotoState('RangedAttack');
				return true;
			}
		}
	}
    if  ( Enemy == none && TeamMember.Enemy != none )
       SetEnemy(TeamMember.Enemy);
	if ( TeamMember != none && TeamMember.health > 0 && !TeamMember.bDeleteme && (!TeamMember.bHasRangedAttack || (TeamMember.TeamID == 1))  )
		TeamMember.GotoState('Charging');
	else if ( TeamMember != none  && TeamMember.health > 0 && !TeamMember.bDeleteme && TeamMember.TeamID == 2 )
	{
		TeamMember.bStrafeDir = true;
		TeamMember.GotoState('TacticalMove', 'NoCharge');
	}
	else if ( TeamMember != none && TeamMember.health > 0 && !TeamMember.bDeleteme && TeamMember.TeamID == 3 )
	{
		TeamMember.bStrafeDir = false;
		TeamMember.GotoState('TacticalMove', 'NoCharge');
	}
	else
	{
     if ( TeamMember != none && TeamMember.health > 0 && !TeamMember.bDeleteme )
  		TeamMember.GotoState('TacticalMove');
	}
	return true;
}

function bool CanStakeOut()
{
	local vector HitLocation, HitNormal;
	local actor HitActor;

	if ( (Physics == PHYS_Flying) && !bCanStrafe )
		return false;
    if (Enemy == none || Enemy.bDeleteme || Enemy.Health<=0 || Enemy==self )
		return false;
	if ( VSize(Enemy.Location - LastSeenPos) > 800 )
		return false;

	HitActor = Trace(HitLocation, HitNormal, LastSeenPos, Location + EyeHeight * vect(0,0,1), false);
	if ( HitActor == None )
	{
		HitActor = Trace(HitLocation, HitNormal, LastSeenPos , Enemy.Location + Enemy.BaseEyeHeight * vect(0,0,1), false);
		return (HitActor == None);
	}
	return false;
}

function bool MeleeDamageTarget(int hitdamage, vector pushdir)
{
	local vector HitLocation, HitNormal;
	local actor HitActor;

	if( Target==self )
        Target = none;
    if (Target == none )   // allow non pawn targets
    {
     if ( enemy != none && enemy.health >0 && !enemy.bDeleteme && enemy!=self )
      Target = Enemy;
    }
    if (Target == none || (Target != none && (Target.bDeleteme
       || (Target.IsA('Pawn') && Pawn(Target).Health <=0))) )
       return false;

    if ( (VSize(Target.Location - Location) <= MeleeRange * 1.4 + Target.CollisionRadius + CollisionRadius)
	     	&& ((Physics == PHYS_Flying) || (Physics == PHYS_Swimming) || (Abs(Location.Z - Target.Location.Z)
		     <= FMax(CollisionHeight, Target.CollisionHeight) + 0.5 * FMin(CollisionHeight, Target.CollisionHeight))) )
      	{
       	      HitActor = Trace(HitLocation, HitNormal, Target.Location, Location, false);
		      if ( HitActor != None )
	        		return false;
		       Target.TakeDamage(hitdamage, Self,HitLocation, pushdir, 'hacked');
		       return true;
	    }
	return false;
}

function bool SetEnemy( Pawn NewEnemy )
{
	local bool resultz;
	local eAttitude newAttitude, oldAttitude;
	local bool noOldEnemyz;
	local float newStrengthz;

	if ( (NewEnemy == Self) || (NewEnemy == None) || (NewEnemy.Health <= 0)
     || NewEnemy.bDeleteme || NewEnemy.IsA('FlockPawn') || NewEnemy.IsA('FlockMasterPawn')
     || Health <= 0 || NewEnemy.IsA('Spectator') )
        return false;
	if ( !bCanWalk && !bCanFly && !NewEnemy.FootRegion.Zone.bWaterZone )
		return false;

    noOldEnemyz = (Enemy == None);
	resultz = false;
	newAttitude = AttitudeTo(NewEnemy);
//	log ("Attitude to potential enemy is "$newAttitude);

	if ( !noOldEnemyz )
	{
		if (Enemy == NewEnemy)
			return true;
		else if ( NewEnemy.IsA('PlayerPawn') && (AlarmTag != '') )
		{
			OldEnemy = Enemy;
			Enemy = NewEnemy;
			resultz = true;
		}
		else if ( newAttitude == ATTITUDE_Friendly )
		{
			if ( bIgnoreFriends )
				return false;
		    if (NewEnemy.bIsPlayer && NewEnemy.Enemy == NewEnemy)
                return false;
			if ( NewEnemy.Enemy != self && NewEnemy.Enemy != None && NewEnemy.Enemy.Health > 0 && !NewEnemy.Enemy.bDeleteme )
			{
				if (!NewEnemy.IsA('ScriptedPawn') && NewEnemy.Enemy.bIsPlayer && (NewEnemy.AttitudeToPlayer < AttitudeToPlayer) )
					AttitudeToPlayer = NewEnemy.AttitudeToPlayer;
				if ( AttitudeTo(NewEnemy.Enemy) < AttitudeTo(Enemy) )
				{
					OldEnemy = Enemy;
					Enemy = NewEnemy.Enemy;
					resultz = true;
				}
			}
		}
		else
		{
			oldAttitude = AttitudeTo(Enemy);
			if ( (newAttitude < oldAttitude) ||
				( (newAttitude == oldAttitude)
					&& ((VSize(NewEnemy.Location - Location) < VSize(Enemy.Location - Location))
						|| !LineOfSightTo(Enemy)) ) )
			{
				if ( bIsPlayer && Enemy.IsA('PlayerPawn') && !NewEnemy.IsA('PlayerPawn') )
				{
					newStrengthz = relativeStrength(NewEnemy);
					if ( (newStrengthz < 0.2) && (relativeStrength(Enemy) < FMin(0, newStrengthz))
						&& (IsInState('Hunting')) && (Level.TimeSeconds - HuntStartTime < 5) )
						resultz = false;
					else
					{
						resultz = true;
						OldEnemy = Enemy;
						Enemy = NewEnemy;
					}
				}
				else
				{
					resultz = true;
					OldEnemy = Enemy;
					Enemy = NewEnemy;
				}
			}
		}
	}
	else if ( newAttitude < ATTITUDE_Ignore )
	{
		resultz = true;
		Enemy = NewEnemy;
	}
	else if ( newAttitude == ATTITUDE_Friendly ) //your enemy is my enemy
	{
//	    log("noticed a friend" $newenemy);
        if ( NewEnemy.IsA('PlayerPawn') && (AlarmTag != '') )
		{
			Enemy = NewEnemy;
			resultz = true;
		}
		if (bIgnoreFriends)
			return false;
 	    if (NewEnemy.bIsPlayer && NewEnemy.Enemy == NewEnemy)
            return false;
        if ( NewEnemy.Enemy != self && NewEnemy.Enemy != None && NewEnemy.Enemy.Health > 0 && !NewEnemy.Enemy.bDeleteme )
		{
			resultz = true;
// 		log("his enemy is my enemy");
			Enemy = NewEnemy.Enemy;
            if (!NewEnemy.IsA('ScriptedPawn') && NewEnemy.Enemy.bIsPlayer && (NewEnemy.AttitudeToPlayer < AttitudeToPlayer) )
					AttitudeToPlayer = NewEnemy.AttitudeToPlayer;
            else if ( NewEnemy.IsA('ScriptedPawn') && (ScriptedPawn(NewEnemy) != None) && (ScriptedPawn(NewEnemy).Hated == Enemy) )
			 	Hated = Enemy;
		}
	}

	if ( resultz )
	{
		//log(class$" has new enemy - "$enemy.class);
 	    LastSeenPos = Enemy.Location;
		LastSeeingPos = Location;
		EnemyAcquired();
		if ( !bFirstHatePlayer && Enemy.bIsPlayer && (FirstHatePlayerEvent != '') )
			TriggerFirstHate();
	}
	else if ( !NewEnemy.IsA('ScriptedPawn') && NewEnemy.bIsPlayer && (NewAttitude < ATTITUDE_Threaten) )
		OldEnemy = NewEnemy;

	return resultz;
}



// UMSSpaceMarine

function PostBeginPlay()
{
	if(bLurePlayer)
	bActFriendly=True;

	if(bTeleportWhenHurt)
		bExplodeWhenHurt=false;

	bCanSpeak = true;
	bIsFemale = false;
	LastTalkTime=0;
	MessageTime=0;
	bRespond=false;

	if(GenderOverride.bAlwaysMale && !GenderOverride.bAlwaysFemale)
	return;
	else if (GenderOverride.bAlwaysFemale && !GenderOverride.bAlwaysMale)
	SetFemaleGender();
	else if (GenderOverride.bAlwaysMale && GenderOverride.bAlwaysFemale)
	{
		Log("Jokes on you that just cancels it out!");
		if( FRand() < 0.5 )
		SetFemaleGender();
		else
		return;
	}
	else if( FRand() < 0.5 )
	SetFemaleGender();
}

function SetFemaleGender()
{
	drown=Sound'UnrealShare.Female.mdrown2fem';
	breathagain=Sound'UnrealShare.Female.hgasp3fem';
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

	if(bCadet)
	{
    	if(!bWimp && Health < 0.65 * Default.Health)
    	WimpOut();
   	 	else if (bWimp && Frand() < 0.35){
		AttitudeToPlayer=ATTITUDE_Fear;
    	GotoState('Retreating');}
	}

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

Function WimpOut()
{
bIsWuss=True;
bWimp=True;
if(!bIsFemale)
PlaySound(Sound'UMSMarinesII.Voice.Backupm', SLOT_Interact);
else
PlaySound(Sound'UMSMarinesII.Voice.Backupf', SLOT_Interact);
CombatStyle=-0.4;
//GotoState('Retreating');
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



// UMSSpaceMarine

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

function TweenToPatrolStop(float tweentime)
{
  TweenToWaiting(tweentime);
}

function PlayDive()
{
	TweenToSwimming(0.2);
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
	     SpawnbodyPart(Class 'UMSsmgib3', Location + (CollisionRadius* 0.2)*X + (CollisionHeight* -0.6)*Z +(CollisionRadius *-0.5)*Y, Rotation + rot(16384,-32468,-16384));
         SpawnbodyPart(Class 'UMSSMGib3R', Location + (CollisionRadius* 0.2)*X + (CollisionHeight* -0.6)*Z +(CollisionRadius *0.5)*Y, Rotation + rot(16384,-32468,16384));
		 PlayAnim('Dead7a', 0.7, 0.1);

		}
	    else if (Ran <0.4)
	    {
	     PlayHeadDeath(DamageType);
	     SpawnbodyPart(Class 'UMSSMGib1R', Location + (CollisionRadius* 0.7)*X + (CollisionHeight* 0.3)*Z +(CollisionRadius *0.9)*Y, Rotation + rot(8182,32468,-16384));
         SpawnbodyPart(Class 'UMSsmgib1', Location + (CollisionRadius* 0.7)*X + (CollisionHeight* 0.3)*Z +(CollisionRadius *-0.9)*Y, Rotation + rot(8182,32468,16384));
         SpawnbodyPart(Class 'UMSsmgib4', Location + (CollisionHeight* 0.3)*Z , Rotation);
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
	   SpawnbodyPart(Class 'UMSSMGib1R', Location + (CollisionRadius* 0.7)*X + (CollisionHeight* 0.3)*Z +(CollisionRadius *0.9)*Y, Rotation + rot(8182,32468,-16384));
       if(dotx < 0)
          PlayAnim('Dead8c', 0.7, 0.1);
       else
         PlayAnim('Dead8b', 0.7, 0.1);
       return;
      }
      if (doty < -0.5)  //left arm
      {
        SpawnbodyPart(Class 'UMSsmgib1', Location + (CollisionRadius* 0.7)*X + (CollisionHeight* 0.3)*Z +(CollisionRadius *-0.9)*Y, Rotation + rot(8182,32468,16384));
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
          SpawnbodyPart(Class 'UMSsmgib3', Location + (CollisionRadius* 0.2)*X + (CollisionHeight* -0.6)*Z +(CollisionRadius *-0.5)*Y, Rotation + rot(16384,-32468,-16384));
          if(dotx < 0)
           PlayAnim('Dead10a', 0.7, 0.1);
          else
           PlayAnim('Dead10b', 0.7, 0.1);
          return;
         }
         if (doty > 0.2)  //Right leg
         {
          SpawnbodyPart(Class 'UMSSMGib3R', Location + (CollisionRadius* 0.2)*X + (CollisionHeight* -0.6)*Z +(CollisionRadius *0.5)*Y, Rotation + rot(16384,-32468,16384));
          if(dotx < 0)
           PlayAnim('Dead10c', 0.7, 0.1);
          else
           PlayAnim('Dead10d', 0.7, 0.1);
          return;
        }

    }
	PlayRandDeath();
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
	    carc = Spawn(class 'UMSsmgib2',,,  Location + CollisionHeight * vect(0,0,0.8), Rotation + rot(3000,0,16384) );
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

	if ( !Level.Game.bDeathMatch && AlarmTag == '' && bIsPlayer )
	   bIsPlayer=false;
	bQuiet = false;
	Enemy = None;
	if ( OldEnemy != None && (OldEnemy.bDeleteme
       || OldEnemy.Health <= 0 || OldEnemy==self ) )// be sure
	  OldEnemy = None;
	if ( OldEnemy != None )
	{
		Enemy = OldEnemy;
		OldEnemy = None;
		GotoState('Attacking');
	}
	else if (Orders == 'Patroling')
		GotoState('Patroling');
	else if (Orders == 'Guarding')
		GotoState('Guarding');
	else if ( Orders == 'Ambushing' )
		GotoState('Ambushing','FindAmbushSpot');
	else if ( (LikelyState != '') && (FRand() < 0.35) )
		GotoState(LikelyState, LikelyLabel);
	else
		StartRoaming();
}

function PlayChallenge()
{
	local float decision;
    //local name newAnim;
	local float R;

	R = FRand();

	if(!bIsFemale)
	{
		if(R < 0.2)
		PlaySound(ChallengeTauntMale[0]);
		else if(R < 0.4)
		PlaySound(ChallengeTauntMale[1]);
		else if(R < 0.8)
		PlaySound(ChallengeTauntMale[2]);
		else if(R < 1)
		PlaySound(ChallengeTauntMale[3]);
	}
	else
	{
		if(R < 0.2)
		PlaySound(ChallengeTauntFemale[0]);
		else if(R < 0.4)
		PlaySound(ChallengeTauntFemale[1]);
		else if(R < 0.8)
		PlaySound(ChallengeTauntFemale[2]);
		else if(R < 1)
		PlaySound(ChallengeTauntFemale[3]);
	}

	bFire = 0;
	bAltFire = 0;

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
	if (FRand()<0.5)
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

state Attacking
{
ignores SeePlayer, HearNoise, Bump, HitWall;

	function ChooseAttackMode()
	{
		local eAttitude AttitudeToEnemy;
		local pawn changeEn;

		if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		{
			if (Orders == 'Attacking')
				Orders = '';
			WhatToDoNext('','');
			return;
		}

		if ( (AlarmTag != '') && Enemy.bIsPlayer )
		{
			if (AttitudeToPlayer > ATTITUDE_Ignore)
			{
				GotoState('AlarmPaused', 'WaitForPlayer');
				return;
			}
			else if ( (AttitudeToPlayer != ATTITUDE_Fear) || bInitialFear )
			{
				GotoState('TriggerAlarm');
				return;
			}
		}

	    if ( !Level.Game.bDeathMatch && AlarmTag == '' && bIsPlayer )
	       bIsPlayer=false;

		AttitudeToEnemy = AttitudeTo(Enemy);

		if (AttitudeToEnemy == ATTITUDE_Fear)
		{
			GotoState('Retreating');
			return;
		}

		else if (AttitudeToEnemy == ATTITUDE_Threaten)
		{
			if(bLurePlayer)
			GotoState('Betraying');
			else
			GotoState('Threatening');
			return;
		}

		else if (AttitudeToEnemy == ATTITUDE_Friendly)
		{
			if (Enemy.bIsPlayer)
				GotoState('Greeting');
			else
				WhatToDoNext('','');
			return;
		}

        else if (!LineOfSightTo(Enemy))
	    {
			if ( (OldEnemy != none  )
				&& (AttitudeTo(OldEnemy) == ATTITUDE_Hate) && LineOfSightTo(OldEnemy) && !OldEnemy.bDeleteme)
			{
				changeEn = enemy;
				enemy = oldenemy;
				oldenemy = changeEn;
			}
			else
			{
            if ( (Orders == 'Guarding') && !LineOfSightTo(OrderObject) )
					GotoState('Guarding');
			else if ( !bHasRangedAttack || VSize(Enemy.Location - Location)
							> 600 + (FRand() * RelativeStrength(Enemy) - CombatStyle) * 600 )
					GotoState('Hunting');
			else if ( bIsBoss || (Intelligence > BRAINS_None) )
			{
					HuntStartTime = Level.TimeSeconds;
					NumHuntPaths = 0;
					GotoState('StakeOut');
			}
			else
					WhatToDoNext('Waiting', 'TurnFromWall');
			    	return;
			}
		}

		else if ( (TeamLeader != None) && TeamLeader.ChooseTeamAttackFor(self) )
			return;

		if (bReadyToAttack )
		{
			////log("Attack!");
			Target = Enemy;
			If (VSize(Enemy.Location - Location) <= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			{
				GotoState('MeleeAttack');
				return;
			}
			else if (bMovingRangedAttack)
				SetTimer(TimeBetweenAttacks, False);
			else if (bHasRangedAttack && (bIsPlayer || enemy.bIsPlayer) && CanFireAtEnemy() )
			{
				if (!bIsPlayer || (2.5 * FRand() > Skill) )
				{
					GotoState('RangedAttack');
					return;
				}
			}
		}

		//decide whether to charge or make a tactical move
		if ( !bHasRangedAttack )
			GotoState('Charging');
		else
			GotoState('TacticalMove');
		//log("Next state is "$state);
	}
}

Function BetrayAnims()
{
	local int RandNum;
	local name AnimSeq;

	RandNum = Rand( 4 );

	if(RandNum == 0)
		AnimSeq='Wave';
	else if(RandNum == 1)
		AnimSeq='WaveL';
	else if(RandNum == 2)
		AnimSeq='Look';
	else if(RandNum == 3)
		AnimSeq='SALUTE';

	if(AnimSeq != 'None')
	{
		PlayAnim(AnimSeq);
	}
}

function BetrayPhrase()
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
				voice=sound'UMSMarinesII.MS103a';  
        else if (RandNum==5)
				voice=sound'UMSMarinesII.MS103b';  
        else if (RandNum==6)
				voice=sound'UMSMarinesII.MS201a';  
        else if (RandNum==7)
				voice=sound'UMSMarinesII.MS201b';  
        else if (RandNum==8)
				voice=sound'UMSMarinesII.MS202a';  
        else if (RandNum==9)
				voice=sound'UMSMarinesII.MS202b'; 
        else if (RandNum==10)
				voice=sound'UMSMarinesII.MS203a'; 
        else if (RandNum==11)
				voice=sound'UMSMarinesII.MS203b'; 

	}
	else
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
    if(voice!=none)
    {
     PlaySound( voice, SLOT_Talk,vol*0.9 );
     PlaySound( voice, SLOT_None,vol*0.9 );
    }
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

	function WarnTarget(Pawn shooter, float projSpeed, vector FireDir)
	{
		local eAttitude att;

		att = AttitudeTo(shooter);
		if ( ((att == ATTITUDE_Ignore) || (att == ATTITUDE_Threaten)) )
			damageAttitudeTo(shooter);
	}

    function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
        if ( (Enemy != None) && (Enemy == InstigatedBy) )
		  LastSeenPos = Enemy.Location;
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else
			GotoState('Attacking');
	}

	singular function HearNoise(float Loudness, Actor NoiseMaker)
	{
		local vector OldLastSeenPos;

		if ( SetEnemy(NoiseMaker.instigator) )
		{
			OldLastSeenPos = LastSeenPos;
			if ( Enemy ==  NoiseMaker.instigator  )
				LastSeenPos = 0.5 * (NoiseMaker.Location + VSize(NoiseMaker.Location - Location) * vector(Rotation));
			else if ( (Pawn(NoiseMaker) != None) && (Enemy == Pawn(NoiseMaker).Enemy) )
				LastSeenPos = 0.5 * (Pawn(NoiseMaker).Enemy.Location + VSize(Pawn(NoiseMaker).Enemy.Location - Location) * vector(Rotation));
			if ( VSize(OldLastSeenPos - Enemy.Location) < VSize(LastSeenPos - Enemy.Location) )
				LastSeenPos = OldLastSeenPos;
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

function string KillMessage(name damageType, pawn Other)
{
	return(HumanKillMessage);
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

state VictoryDance
{
ignores EnemyNotVisible;

 function BeginState()
 {
   HaltFiring();
   super.BeginState();
 }
 
    function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
    {
       	Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
    	if ( health <= 0 || bDeleteme )
    		return;
    	Enemy = instigatedBy;
    	if ( NextState == 'TakeHit' )
    	{
    		NextState = 'Attacking'; //default
    		NextLabel = 'Begin';
    		GotoState('TakeHit');
    	}
    	else
    		GotoState('Attacking');
    }

    function Bump(Actor Other)
    {
	 if ( Health <= 0 || bDeleteme )
		  return;
     if (Other.IsA('Carcass') && !Other.IsA('CreatureChunks') )
      {
       gotoState('VictoryDance', 'Taunt');
       Disable('Bump');
      }
     else
      super.Bump(Other);
    }

	function PickDestination()
	{
		local Actor path;

    	if (Target == none || (target.IsA('Pawn') && Pawn(target).health >0) )
	    {
            target=none;
			WhatToDoNext('Waiting', 'TurnFromWall');
			return;
	    }
	    MoveTarget = none;
		if ( ActorReachable(Target) )
		{
			MoveTarget = Target;
			Destination = Target.Location;
		}
		else
		{
			if (SpecialGoal != None)
				path = FindPathToward(SpecialGoal);
			else
				path = FindPathToward(Target);
			if (path != None)
			{
				MoveTarget = path;
				Destination = path.Location;
			}
			else
				WhatToDoNext('Waiting', 'TurnFromWall');
		}
	}

	function HitWall(vector HitNormal, actor Wall)
	{
	   if (Physics == PHYS_Falling )
			return;
         gotoState('VictoryDance','Taunt');
    }

Begin:
	if ( (Target == None) || (VSize(Location - Target.Location) <
	  (1.3 * CollisionRadius + Target.CollisionRadius + CollisionHeight - Target.CollisionHeight)) )
		Goto('Taunt');
    WaitForLanding();
	TweenToWalking(0.3);
	FinishAnim();
	PlayWalking();
	Enable('Bump');

MoveToEnemy:
	if ( !IsAnimating() )
		PlayWalking();
	PickDestination();
    Sleep(0.0);
	if (SpecialPause > 0.0)
	{
		Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.3);
		Sleep(SpecialPause);
		SpecialPause = 0.0;
		TweenToWalking(0.1);
		FinishAnim();
		PlayWalking();
	}
    if ( MoveTarget == none )
    	Goto('Taunt');
	MoveToward(MoveTarget, WalkingSpeed);
	Enable('Bump');
	if ((Target == None) || ( Target.IsA('pawn') && Pawn(Target).health >0 ) || (VSize(Location - Target.Location) <
		(1.3 * CollisionRadius + Target.CollisionRadius + Abs(CollisionHeight - Target.CollisionHeight))))
		Goto('Taunt');
	Goto('MoveToEnemy');

Taunt:
	Acceleration = vect(0,0,0);
    Disable('HitWall');
	TweenToFighter(0.2);
	FinishAnim();
    if (Target!=none)
    {
     PlayTurning();
	 TurnToward(Target);
     TweenToFighter(0.2);
  	 FinishAnim();
    }
    DesiredRotation = rot(0,0,0);
	DesiredRotation.Yaw = Rotation.Yaw;
	setRotation(DesiredRotation);
	PlayVictoryDance();
	FinishAnim();
    LastPainTime -= 15.0; //set for state waiting
	WhatToDoNext('Waiting','TurnFromWall');
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
	local int actualDamage;
	local bool bAlreadyDead;

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
	local Pawn aPawn;
	local ScriptedPawn ScriptedOther;
	local bool bFoundTeam;

	if( Other ==self && Killer != self )
	{
		Other.PlaySound( sound'UMSStatic', SLOT_Talk, 2.0 , true);
	}
	if( Other!=none && Other!=self && Killer == self )
	{
        KillPhrase();
	}
	
	if ( Health <= 0 || bDeleteme )
		return;
	if (Other.bIsPlayer)
		bCanBePissed = true;

	ScriptedOther = ScriptedPawn(Other);
	if ( (TeamTag != '') && (ScriptedOther != None)
		&& (ScriptedOther.TeamTag == TeamTag) )
	{
		if ( ScriptedOther.bTeamLeader )
			TeamTag = '';
		else if ( ScriptedOther.TeamID < TeamID )
			TeamID--;
		else if ( bTeamLeader )
		{
			aPawn = Level.PawnList;
			while ( aPawn != None )
			{
				if ( (ScriptedPawn(aPawn) != None) && (ScriptedPawn(aPawn) != self) &&
					(ScriptedPawn(aPawn).TeamTag == TeamTag) )
				{
					bFoundTeam = true;
					break;
				}
				aPawn = aPawn.nextPawn;
			}
			if ( !bFoundTeam )
			{
				bTeamLeader = false;
				TeamTag = '';
			}
		}
	}

	if ( OldEnemy == Other )
		OldEnemy = None;

	if ( Enemy == Other )
	{
		Enemy = None;
		if ( (Killer != none) && (Killer == self) && (OldEnemy == None) )
		{
         for (aPawn=level.pawnlist;aPawn!=none;aPawn=aPawn.nextpawn)
		 {
   	      if (( aPawn.bCollideActors  && ( !aPawn.IsA('FlockPawn') ))
            && (VSize(Location - aPawn.Location) < 1000) && CanSee(aPawn) )
				{
					if ( SetEnemy(aPawn) )
					{
						GotoState('Attacking');
						return;
					}
				}
		 }
			Target = Other;
			GotoState('VictoryDance');
		}
		else
			GotoState('Attacking');
	}
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
		if ( !Level.Game.bDeathMatch && AlarmTag == '' && bIsPlayer )
	       bIsPlayer=false;
        Target = None;
        Enemy = None;
        bStasis = false;
        Acceleration = vect(0,0,0);
        SetAlertness(0.0);
	}

	function Landed(vector HitNormal)
	{
		SetPhysics(PHYS_None);
	}

	function Bump(actor Other)
	{
		//log(Other.class$" bumped "$class);
		if (Pawn(Other) != None)
		{
			if (Enemy == Other)
				bReadyToAttack = True; //can melee right away
			SetEnemy(Pawn(Other));
		}
		if ( TimerRate <= 0 )
			setTimer(1.5, false);
		Disable('Bump');
	}

	function Timer()
	{
       local mover m;
       local bool bstartmove;

       if(Level.TimeSeconds > 10 && Level.TimeSeconds-LastPainTime >10)  //dont fast loop if no escape
       {
         LastPainTime = Level.TimeSeconds; // hijack LastPainTime
         bstartmove=false;
         if( bCanFly || bCanWalk || (Region.Zone.bWaterZone && bCanSwim ) )
         {
           foreach visiblecollidingactors(class'mover', m, CollisionRadius + 200)
           {
             if( base!=m && (m.MoverEncroachType==ME_StopWhenEncroach
                || m.MoverEncroachType==ME_ReturnWhenEncroach))
             {
              bstartmove=true;
              break;
             }
           }
           if(bstartmove )
           {
             SetMovementPhysics();
             WhatToDoNext('Roaming','Begin');
           }
         }
      }
      Enable('Bump');
	}

TurnFromWall:
    WaitForLanding();
	if ( NearWall(2 * CollisionRadius + 50) )
	{
		PlayTurning();
		TurnTo(Focus);
	}
	Disable('Bump');
	Timer();

Begin:
    WaitForLanding();
	TweenToWaiting(0.4);
	bReadyToAttack = false;
	DesiredRotation = rot(0,0,0);
	DesiredRotation.Yaw = Rotation.Yaw;
	SetRotation(DesiredRotation);
	if (Physics != PHYS_Falling)
		SetPhysics(PHYS_None);

KeepWaiting:
   NextAnim = '';
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

	
	function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			bSpecialGoal = true;
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Roaming', 'Moving');
			return;
		}
	   Focus = Destination;
       if ( PickWallAdjust() )
       {
		   if ( Physics == PHYS_Falling )
		     SetFall();
           else
             gotoState('Roaming', 'AdjustFromWall');
       }
       else
	     MoveTimer = -1.0;
    }

	function Bump(Actor Other)
	{
	    if ( Health <= 0 || bDeleteme )
		  return;
		if ( FRand() < 0.03)
			GotoState('Wandering');
		else
			Global.Bump(Other);
	}

	function PickDestination()
	{
     local Actor Path;
     local int zzi;
     local Navigationpoint Nav;
     local float dist;
     local vector Dir;

     numHuntPaths++;
     if ( numHuntPaths > 80 )
	 {
  	   gotoState('Wandering');
       return;
	 }
     if (SpecialGoal != None)
     {
      Path = FindPathToward(SpecialGoal);
      if (Path != None)
        {
	     MoveTarget = Path;
         Destination=Path.Location;
         return;
        }
     }
     if ( Orderobject == None )
 	 {
      zzi=0;
      for ( Nav=Level.NavigationPointList; Nav!=None; Nav=Nav.NextNavigationPoint )
      if ( Nav.IsA('pathnode') || Nav.IsA('Ambushpoint') || Nav.IsA('Patrolpoint') )
           {
	 	    Dir = Nav.Location - Location;
	        dist = VSize(Dir);
         	if ( (dist < 1000) && (dist > CollisionRadius+50) )
               {
                zzi++;
                if(Rand(zzi) == Rand(4) && actorReachable(Nav) )
                 {
                  Orderobject = Nav;
                  Break;
                 }
                else if ( ((Orderobject == none) || (Rand(zzi) == 0)) && actorReachable(Nav) )
		               Orderobject = Nav;
	           }
           }
	  if ( Orderobject!=None )
	  {
         GotoState('Roaming', 'pausing');
         Return;
      }
	 }
     if ( Orderobject == None )
	  {
       GotoState('Wandering');
	   return;
      }
     if ( actorReachable(Orderobject) )
      {
         numHuntPaths = 0;
         MoveTarget = Orderobject;
         Orderobject = None;
         Destination=MoveTarget.Location;
       	 if ( VSize(MoveTarget.Location - Location) > 2 * CollisionRadius )
              return;
      }
     else
      {
        Path = FindPathToward(Orderobject);
        if ( Path != None )
         {
           MoveTarget = Path;
           Destination=MoveTarget.Location;
              return;
	     }
        else
          Orderobject = None;
      }

     if ( FRand() < 0.25 )
	        GotoState('Wandering');
	 else
     		GotoState('Roaming', 'pausing');
    }

    function EndState()
	{
     numHuntPaths = 0;
    }

Begin:
	//log(class$" Roaming");
 numHuntPaths = 0;

Roam:
	TweenToWalking(0.15);
	NextAnim = '';
	WaitForLanding();
	PickDestination();
	FinishAnim();
	PlayWalking();

Moving:
	if (SpecialPause > 0.0)
	{
        Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.3);
		Sleep(SpecialPause);
		SpecialPause = 0.0;
		TweenToWalking(0.1);
		FinishAnim();
		PlayWalking();
	}
	MoveToward(MoveTarget, WalkingSpeed);
	if ( bSpecialGoal )
	{
		bSpecialGoal = false;
		Goto('Roam');
	}
	Acceleration = vect(0,0,0);
	TweenToPatrolStop(0.3);
	FinishAnim();
	NextAnim = '';
Pausing:
    Acceleration = vect(0,0,0);
	PlayPatrolStop();
	FinishAnim();
	if ( !bQuiet && (FRand() < 0.3) )
		PlayRoamingSound();
	goto('Roam');

continueRoam:
	FinishAnim();
	PlayWalking();
	goto('Roam');

AdjustFromWall:
    if ( !IsAnimating() )
     PlayWalking();;
    StrafeTo(Destination, Focus);
	Destination = Focus;
    Goto('Moving');
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

    function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Wandering', 'Pausing');
			return;
		}
		Focus = Destination;
		if ( PickWallAdjust() && (FRand() < 0.7) )
		{
			if ( Physics == PHYS_Falling )
				SetFall();
            else
                GotoState('Wandering', 'AdjustFromWall');
		}
		else
			MoveTimer = -1.0;
	}

    function PickDestination()
    {
       local vector pick, pickdir;
       local bool success;

       pickdir.X = 2 * FRand() - 1;
       pickdir.Y = 2 * FRand() - 1;
       pickdir.Z = 0;

       if (Physics != PHYS_Walking)
        pickdir.Z = 2 * FRand() - 1;

       if ( pickdir == Vect(0,0,0) )
         pickdir=Vector(Rotation);

       pickdir = Normal(pickdir);
       if ( pickdir == Vect(0,0,0) )
         pickdir.X = 1;
       success = TestDirection(pickdir, pick);
       if (!success)
        success = TestDirection(-1 * pickdir, pick);

       if (success)
        Destination = pick;
       else
        GotoState('Wandering', 'Turn');
    }

	function EndState()
	{
		if (JumpZ > 0)
			bCanJump = true;
	}
Begin:
	//log(class$" Wandering");

Wander:
	TweenToWalking(0.15);
	WaitForLanding();
	PickDestination();
	FinishAnim();
	PlayWalking();

Moving:
	Enable('HitWall');
	MoveTo(Destination, WalkingSpeed);
Pausing:
	Acceleration = vect(0,0,0);
	if ( NearWall(2 * CollisionRadius + 50) )
	{
		PlayTurning();
		TurnTo(Focus);
	}
	if (FRand() < 0.3)
		PlayRoamingSound();
	Enable('AnimEnd');
	NextAnim = '';
	TweenToPatrolStop(0.2);
	Sleep(1.0);
	Disable('AnimEnd');
	FinishAnim();
	Goto('Wander');

ContinueWander:
	FinishAnim();
	PlayWalking();
	if ( !bQuiet && (FRand() < 0.3) )
		PlayRoamingSound();
	if (FRand() < 0.2)
		Goto('Turn');
	Goto('Wander');

Turn:
	Acceleration = vect(0,0,0);
	PlayTurning();
	TurnTo(Location + 20 * VRand());
	Goto('Pausing');

AdjustFromWall:
    if ( !IsAnimating() )
     PlayWalking();;
	StrafeTo(Destination, Focus);
	Destination = Focus;
	Goto('Moving');
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
	Target = Enemy;
	Disable('AnimEnd');
	bReadyToAttack = false;
	}

	function EndState()
	{
	    super.EndState();
	    bCanDuck = false;
	}

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

state Charging
{
ignores SeePlayer, HearNoise;

    function AnimEnd()
    {
     super.AnimEnd();
     if(bRespond && Level.TimeSeconds - LastTalkTime > 1.0 )
     RespondPhrase();
    }

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
		bFire = 0;
		bAltFire = 0;
		if ( JumpZ > 0 )
			bCanJump = true;
	    bCanDuck = false;
	}

	function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling )
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			bSpecialGoal = true;
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Charging', 'SpecialNavig');
			return;
		}
		Focus = Destination;
        if ( PickWallAdjust() )
		{
			if ( Physics == PHYS_Falling )
				SetFall();
            else
                gotoState('Charging', 'AdjustFromWall');
		}
        else
			MoveTimer = -1.0;
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

State Patroling
{
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
        if ( (Enemy != None) && (Enemy == InstigatedBy) )
		 LastSeenPos = Enemy.Location;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else if ( Enemy != None )
			GotoState('Attacking');
	}

	function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling )
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Patroling', 'SpecialNavig');
			return;
		}
		Focus = Destination;
		if (PickWallAdjust())
        {
		   if ( Physics == PHYS_Falling )
		     SetFall();
           else
		     GotoState('Patroling', 'AdjustFromWall');
	    }
		else
			MoveTimer = -1.0;
	}

    function Trigger( actor Other, pawn EventInstigator )
	{
		if ( EventInstigator!=none && bDelayedPatrol )
		{
			if ( bHateWhenTriggered )
			{
				if ( EventInstigator.bIsPlayer)
					AttitudeToPlayer = ATTITUDE_Hate;
				else
					Hated = EventInstigator;
			}
			GotoState('Patroling', 'Patrol');
		}
		else
			Global.Trigger(Other, EventInstigator);
	}

AdjustFromWall:
    if ( !IsAnimating() )
     PlayWalking();
	StrafeTo(Destination, Focus);
	Destination = Focus;
	MoveTo(Destination);
	Goto('MoveToPatrol');

ResumePatrol:
	if (MoveTarget != None)
	{
		PlayWalking();
		MoveToward(MoveTarget, WalkingSpeed);
		Goto('ReachedPatrol');
	}
	else
		Goto('Patrol');

Begin:
	sleep(0.1);

Patrol: //FIXME -add stasis mode? - also set random start point in roam area
	WaitForLanding();
	FindNextPatrol();
	Disable('AnimEnd');
	if (PatrolPoint(OrderObject) != None)
	{
		////log("Move to next patrol point");
		if ( !bQuiet && (FRand() < 0.4) )
			PlayRoamingSound();
		TweenToWalking(0.3);
		FinishAnim();
		PlayWalking();
		numHuntPaths = 0;

MoveToPatrol:
		if (actorReachable(OrderObject))
			MoveToward(OrderObject, WalkingSpeed);
		else
		{
			PickDestination();
			if (OrderObject != None)
			{
SpecialNavig:
				if (SpecialPause > 0.0)
				{
					Acceleration = vect(0,0,0);
					TweenToPatrolStop(0.3);
					Sleep(SpecialPause);
					SpecialPause = 0.0;
					TweenToWalking(0.1);
					FinishAnim();
					PlayWalking();
				}
				numHuntPaths++;
				MoveToward(MoveTarget, WalkingSpeed);
				if ( numHuntPaths < 30 )
					Goto('MoveToPatrol');
				else
					Goto('GiveUp');
			}
			else
				Goto('GiveUp');
		}

ReachedPatrol:
		////log("Got to patrol point "$OrderTag);
		OrderTag = Patrolpoint(OrderObject).Nextpatrol;
		////log("Next patrol point "$OrderTag);
		if ( Patrolpoint(OrderObject).pausetime > 0.0 )
		{
			////log("Pause patrol");
			Acceleration = vect(0,0,0);
			TweenToFighter(0.2);
			FinishAnim();
			PlayTurning();
			TurnTo(Location + (Patrolpoint(OrderObject)).lookdir);
			if ( Patrolpoint(OrderObject).PatrolAnim != '' && HasAnim(Patrolpoint(OrderObject).PatrolAnim))
			{
				TweenAnim( Patrolpoint(OrderObject).PatrolAnim, 0.3);
				FinishAnim();
				Patrolpoint(OrderObject).AnimCount = Patrolpoint(OrderObject).numAnims;
				While ( Patrolpoint(OrderObject).AnimCount > 0 )
				{
					Patrolpoint(OrderObject).AnimCount--;
					if (Patrolpoint(OrderObject).PatrolSound != None )
						PlaySound( Patrolpoint(OrderObject).PatrolSound );
					PlayAnim(Patrolpoint(OrderObject).PatrolAnim);
					FinishAnim();
				}
			}
			else
			{
				TweenToPatrolStop(0.3);
				FinishAnim();
				Enable('AnimEnd');
				NextAnim = '';
				PlayPatrolStop();
				////log("stop here for "$(Patrolpoint(OrderObject)).pausetime);
				Sleep((Patrolpoint(OrderObject)).pausetime);
				Disable('AnimEnd');
				FinishAnim();
			}
		}
		Goto('Patrol');
	}

GiveUp:
		//log(self$" gave up patrol");
		Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.3);
		FinishAnim();
DelayedPatrol:
		Enable('AnimEnd');
		PlayPatrolStop();
}

state Guarding
{
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
        if ( (Enemy != None) && (Enemy == InstigatedBy) )
	  	 LastSeenPos = Enemy.Location;
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else if ( Enemy != None )
			GotoState('Attacking');
	}

	function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Guarding', 'SpecialNavig');
			return;
		}
		Focus = Destination;
		if (PickWallAdjust())
        {
		   if ( Physics == PHYS_Falling )
		     SetFall();
           else
			 GotoState('Guarding', 'AdjustFromWall');
		}
		else
			MoveTimer = -1.0;
	}

AdjustFromWall:
    if ( !IsAnimating() )
      PlayRunning();
	StrafeTo(Destination, Focus);
	Destination = Focus;
	MoveTo(Destination);
	Goto('GoToGuard');

Begin:
	//log(class$" guarding "$OrderObject);
	Disable('AnimEnd');

GoToGuard:
	if ( VSize(Location - OrderObject.Location) < 2 * CollisionRadius)
		Goto('Turn');
	TweenToRunning(0.2);
	FinishAnim();
	PlayRunning();
	WaitForLanding();
	if (actorReachable(OrderObject))
		MoveToward(OrderObject, FMax(0.75, WalkingSpeed));
	else
	{
		PickDestination();
SpecialNavig:
		if (SpecialPause > 0.0)
		{
			Acceleration = vect(0,0,0);
			TweenToPatrolStop(0.3);
			Sleep(SpecialPause);
			SpecialPause = 0.0;
			TweenToRunning(0.1);
			FinishAnim();
			PlayRunning();
		}
		MoveToward(MoveTarget);
	}
	Goto('GoToGuard');

Turn:
	//log(class$" got to guardpoint");
	Acceleration = vect(0,0,0);
	TweenToFighter(0.3);
	FinishAnim();
	PlayTurning();
	TurnTo( Location + 1000 * vector(OrderObject.Rotation) );

	NextAnim = '';
	bReadyToAttack = false;
	TweenToPatrolStop(0.2);
	FinishAnim();
	Enable('AnimEnd');
	NextAnim = '';
	PlayPatrolStop();
	DesiredRotation = rot(0,0,0);
	DesiredRotation.Yaw = Rotation.Yaw;
	setRotation(DesiredRotation);
	if (Physics != PHYS_Falling)
		SetPhysics(PHYS_None);
}

state Hunting // Hunt code from UPAK marines to make them not forget the player.
{
ignores EnemyNotVisible; 

	/* MayFall() called by engine physics if walking and bCanJump, and
		is about to go off a ledge.  Pawn has opportunity (by setting 
		bCanJump to false) to avoid fall
	*/
	function MayFall()
	{
		bCanJump = ( (MoveTarget != None) || PointReachable(Destination) );
	}

	function Bump(actor Other)
	{
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
	
    function FearThisSpot(Actor aSpot)
	{
		Destination = Location + 120 * Normal(Location - aSpot.Location); 
		GotoState('Wandering', 'Moving');
	}

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation, 
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 )
			return;
		bFrustrated = true;
		if (NextState == 'TakeHit')
		{
			if (AttitudeTo(Enemy) == ATTITUDE_Fear)
			{
				NextState = 'Retreating';
				NextLabel = 'Begin';
			}
			else
			{
				NextState = 'Hunting';
				NextLabel = 'AfterFall';
			}
			GotoState('TakeHit'); 
		}
	}

	function HearNoise(float Loudness, Actor NoiseMaker)
	{
		if ( SetEnemy(NoiseMaker.instigator) )
			LastSeenPos = Enemy.Location; 
	}

	function SetFall()
	{
		NextState = 'Hunting'; 
		NextLabel = 'AfterFall';
		NextAnim = AnimSequence;
		GotoState('FallingState'); 
	}

	function bool SetEnemy(Pawn NewEnemy)
	{
		local float rnd;

		if (Global.SetEnemy(NewEnemy))
		{
			rnd = FRand();
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
		Disable('AnimEnd');
	}
	
	function Timer()
	{
		bReadyToAttack = true;
		Enable('Bump');
		SetTimer(1.0, false);
	}

	function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Hunting', 'SpecialNavig');
			return;
		}
		Focus = Destination;
		if (PickWallAdjust())
			GotoState('Hunting', 'AdjustFromWall');
		else
			MoveTimer = -1.0;
	}

	function PickDestination()
	{
		local actor HitActor;
		local vector HitNormal, HitLocation, nextSpot, ViewSpot;
		local float posZ;
		local bool bCanSeeLastSeen;
	
		// If no enemy, or I should see him but don't, then give up		
		if ( (Enemy == None) || (Enemy.Health <= 0) )
		{
			WhatToDoNext('','');
			return;
		}
	
		bAvoidLedges = false;

		if ( JumpZ > 0 )
			bCanJump = true;
		
		if ( ActorReachable(Enemy) )
		{
			if ((numHuntPaths < 8 + Skill)
				|| ((Normal(Enemy.Location - Location) Dot vector(Rotation)) > -0.5) )
			{
				Destination = Enemy.Location;
				MoveTarget = None;
				numHuntPaths++;
			}
			else
				WhatToDoNext('','');
			return;
		}
		numHuntPaths++;

		ViewSpot = Location + EyeHeight * vect(0,0,1);
		bCanSeeLastSeen = false;
		HitActor = Trace(HitLocation, HitNormal, LastSeenPos, ViewSpot, false);
		bCanSeeLastSeen = (HitActor == None);
		if ( bCanSeeLastSeen )
		{
			HitActor = Trace(HitLocation, HitNormal, LastSeenPos, Enemy.Location, false);
			bHunting = (HitActor != None);
		}
		else
			bHunting = true;

		if ( FindBestPathToward(Enemy) )
			return;
		MoveTarget = None;
		if ( bFromWall )
		{
			bFromWall = false;
			if ( !PickWallAdjust() )
			{
				if ( CanStakeOut() )
					GotoState('StakeOut');
				else
					WhatToDoNext('', '');
			}
			return;
		}
		
		if ( NumHuntPaths > 60 )
		{
			WhatToDoNext('', '');
			return;
		}

		if ( LastSeeingPos != vect(1000000,0,0) )
		{
			Destination = LastSeeingPos;
			LastSeeingPos = vect(1000000,0,0);		
			HitActor = Trace(HitLocation, HitNormal, Enemy.Location, ViewSpot, false);
			if ( HitActor == None )
			{
				If (VSize(Location - Destination) < 20)
				{
					HitActor = Trace(HitLocation, HitNormal, Enemy.Location, ViewSpot, false);
					if (HitActor == None)
					{
						SetEnemy(Enemy);
						return;
					}
				}
				return;
			}
		}

		bAvoidLedges = (CollisionRadius > 42);
		posZ = LastSeenPos.Z + CollisionHeight - Enemy.CollisionHeight;
		nextSpot = LastSeenPos - Normal(Enemy.Location - Enemy.OldLocation) * CollisionRadius;
		nextSpot.Z = posZ;
		HitActor = Trace(HitLocation, HitNormal, nextSpot , ViewSpot, false);
		if ( HitActor == None )
			Destination = nextSpot;
		else if ( bCanSeeLastSeen )
			Destination = LastSeenPos;
		else
		{
			Destination = LastSeenPos;
			HitActor = Trace(HitLocation, HitNormal, LastSeenPos , ViewSpot, false);
			if ( HitActor != None )
			{
				// check if could adjust and see it
				if ( PickWallAdjust() || FindViewSpot() )
					GotoState('Hunting', 'AdjustFromWall');
				else if ( VSize(Enemy.Location - Location) < 1200 )
					GotoState('StakeOut');
				else
				{
					WhatToDoNext('Waiting', 'TurnFromWall');
					return;
				}
			}
		}
		LastSeenPos = Enemy.Location;				
	}	

	function bool FindViewSpot()
	{
		local vector X,Y,Z, HitLocation, HitNormal;
		local actor HitActor;
		local bool bAlwaysTry;
		GetAxes(Rotation,X,Y,Z);

		// try left and right
		// if frustrated, always move if possible
		bAlwaysTry = bFrustrated;
		bFrustrated = false;
		
		HitActor = Trace(HitLocation, HitNormal, Enemy.Location, Location + 2 * Y * CollisionRadius, false);
		if ( HitActor == None )
		{
			Destination = Location + 2.5 * Y * CollisionRadius;
			return true;
		}

		HitActor = Trace(HitLocation, HitNormal, Enemy.Location, Location - 2 * Y * CollisionRadius, false);
		if ( HitActor == None )
		{
			Destination = Location - 2.5 * Y * CollisionRadius;
			return true;
		}
		if ( bAlwaysTry )
		{
			if ( FRand() < 0.5 )
				Destination = Location - 2.5 * Y * CollisionRadius;
			else
				Destination = Location - 2.5 * Y * CollisionRadius;
			return true;
		}

		return false;
	}

	function BeginState()
	{
  		NotifyPeers( 'Hunting', Enemy );
		PickDestination();
		if ( health <= 0 )
			log(self$" hunting while dead");
		SpecialGoal = None;
		SpecialPause = 0.0;
		bFromWall = false;
		SetAlertness(0.5);
		// Changed
//		if( !bHuntingTransmitted )
//		{
//			GotoState( 'TransmitHuntingMessage' );
//		}
	}

	function EndState()
	{
		bAvoidLedges = false;
		bHunting = false;
		if ( JumpZ > 0 )
			bCanJump = true;
	}

AdjustFromWall:
	StrafeTo(Destination, Focus); 
	Destination = Focus; 
	if ( MoveTarget != None )
		Goto('SpecialNavig');
	else
		Goto('Follow');

Begin:
	numHuntPaths = 0;
	HuntStartTime = Level.TimeSeconds;
AfterFall:
	TweenToRunning(0.15);
	bFromWall = false;

Follow:
	WaitForLanding();
	if ( CanSee(Enemy) )
		SetEnemy(Enemy);
	PickDestination();
SpecialNavig:
	if ( SpecialPause > 0.0 )
	{
		Disable('AnimEnd');
		Acceleration = vect(0,0,0);
		PlayChallenge();
		Sleep(SpecialPause);
		SpecialPause = 0.0;
		Enable('AnimEnd');
		Goto('AfterFall');
	}
	if (MoveTarget == None)
		MoveTo(Destination);
	else
		MoveToward(MoveTarget); 

	Goto('Follow');
}

state AlarmPaused
{
ignores HearNoise;

   function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		local bool bWasFriendly;

		bWasFriendly = ( (Enemy != None) && Enemy.bIsPlayer && (AttitudeToPlayer == ATTITUDE_Friendly) );
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			if ( bWasFriendly && (instigatedBy == Enemy) )
				AlarmTag = '';
			if ( AlarmTag == '' )
			{
				NextState = 'Attacking';
				NextLabel = 'Begin';
			}
			else
			{
				NextState = 'TriggerAlarm';
				NextLabel = 'Recover';
			}
			GotoState('TakeHit');
		}
	}

	function Bump(actor Other)
	{
	    if ( Health <= 0 || bDeleteme )
		  return;
		if (Other == Enemy)
			GotoState('MeleeAttack');
		else if ( (Pawn(Other) != None) && SetEnemy(Pawn(Other)) )
			GotoState('MeleeAttack');
		Disable('Bump');
	}

	function FindShootTarget()
	{
		local actor A;

		A = None;
		if ( AlarmPoint(OrderObject).shoottarget != '' )
			ForEach AllActors(class 'Actor', A, AlarmPoint(OrderObject).shoottarget )
				break;

		if ( A == None)
		{
		    if ( Enemy != none && Enemy.health > 0 && !Enemy.bdeleteme && Enemy != self )
			   target = enemy;
		    if ( Target == None )
		    {
               AlarmTag = '';
		       GotoState('Attacking');
		    }
		}
		else
		{
			target = A;
			if ( Pawn(target) != None)
				SetEnemy(pawn(Target));
		}
	}

WaitForEnemy:
	Acceleration = vect(0,0,0);
	FinishAnim();
	TweenToPatrolStop(0.3);
	FinishAnim();
Waiting:
	PlayPatrolStop();
	FinishAnim();
	Goto('Waiting');

Begin:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	{
     AlarmTag = '';
     GotoState('Attacking');
    }
	Acceleration = vect(0,0,0);
	Enable('Timer');
	SetTimer( AlarmPoint(OrderObject).pausetime, false );
	if ( bHasRangedAttack && AlarmPoint(OrderObject).bAttackWhilePaused )
	{
		Enable('EnemyNotVisible');
		if ( AlarmPoint(OrderObject).ShootTarget != '' )
			FindShootTarget();
		else
		{
			if ((Enemy != None) && Enemy.bIsPlayer && ( AttitudeToPlayer > ATTITUDE_Hate) )
			{
			AttitudeToPlayer = ATTITUDE_Hate;
			Target = Enemy;
			}
		}
		if ( AlarmPoint(OrderObject).AlarmAnim != '')
		{
			TweenAnim(AlarmPoint(OrderObject).AlarmAnim, 0.2);
			if (NeedToTurn(Target.Location))
				TurnToward(Target);
			FinishAnim();
			if ( AlarmPoint(OrderObject).AlarmSound != None)
				PlaySound( AlarmPoint(OrderObject).AlarmSound);
			PlayAnim(AlarmPoint(OrderObject).AlarmAnim);
			if ( AlarmPoint(OrderObject).ducktime > 0 )
			{
				if ( Target != Enemy )
					Sleep(AlarmPoint(OrderObject).ducktime);
				else
				{
					if ( TimerRate <= 0 )
						SetTimer( AlarmPoint(OrderObject).ducktime + 1, false);
					MoveTimer = TimerCounter;
					While ( TimerCounter < MoveTimer + AlarmPoint(OrderObject).ducktime )
					{
						TurnToward(Enemy);
						sleep(0.0);
					}
				}
			}
		}
Attack:
    if ( Target == self )
       Target=none;
    if ( Target == None )
	 {
        if ( Enemy != none && Enemy.health > 0 && !Enemy.bdeleteme && Enemy != self )
	    	Target = Enemy;
		if ( Target == None )
		 {
            AlarmTag = '';
			GotoState('Attacking');
		 }
	 }
	if (NeedToTurn(Target.Location))
	{
		PlayTurning();
		TurnToward(Target);
	}
	TweenToFighter(0.15);
	FinishAnim();
	DesiredRotation = Rotator(Target.Location - Location);
	PlayRangedAttack();
	FinishAnim();
	Goto('Attack');
	}

	if ( AlarmPoint(OrderObject).bStopIfNoEnemy)
		Enable('EnemyNotVisible');

	if ( NeedToTurn(Location + AlarmPoint(OrderObject).lookdir) )
	{
		PlayTurning();
		TurnTo(Location + AlarmPoint(OrderObject).lookdir);
	}
	if ( AlarmPoint(OrderObject).AlarmAnim != '')
	{
		TweenAnim(AlarmPoint(OrderObject).AlarmAnim, 0.2);
		FinishAnim();
		PlayAnim(AlarmPoint(OrderObject).AlarmAnim);
	}
	else
	{
		TweenToPatrolStop(0.3);
		FinishAnim();
		PlayPatrolStop();
	}
	sleep( AlarmPoint(OrderObject).pausetime );
	Timer();

WaitForPlayer:
	Disable('AnimEnd');
	NextAnim = '';
	Acceleration = vect(0,0,0);
Wait:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	{
        AlarmTag = '';
        GotoState('Attacking');
    }

	if (NeedToTurn(Enemy.Location))
	{
		PlayTurning();
		TurnToward(Enemy);
	}
	TweenToWaiting(0.2);
	FinishAnim();
	PlayWaiting();
	FinishAnim();
	if ((Enemy!=none ) && (VSize(Location - Enemy.Location) > CollisionRadius + Enemy.CollisionRadius + 220)
		|| ((Enemy!=none ) && !Enemy.LineOfSightTo(Self)) )
		Goto('Wait');
	TweenToRunning(0.15);
	gotoState('TriggerAlarm');

WaitAround:
	Disable('AnimEnd');
	Acceleration = vect(0,0,0);
	if ( (AlarmPoint(OrderObject) != None) && NeedToTurn(Location + AlarmPoint(OrderObject).lookdir) )
	{
		PlayTurning();
		TurnTo(Location + AlarmPoint(OrderObject).lookdir);
	}
	if ( (AlarmPoint(OrderObject) != None) && AlarmPoint(OrderObject).AlarmAnim != '')
	{
		TweenAnim(AlarmPoint(OrderObject).AlarmAnim, 0.2);
		FinishAnim();
		PlayAnim(AlarmPoint(OrderObject).AlarmAnim);
		FinishAnim();
	}
	else
	{
		TweenToPatrolStop(0.2);
		FinishAnim();
		if (Enemy!=none && NeedToTurn(Enemy.Location))
		{
			PlayTurning();
			TurnToward(Enemy);
			TweenToPatrolStop(0.2);
		}
		PlayWaitAround();
		FinishAnim();
		PlayWaitAround();
		FinishAnim();
		PlayWaitAround();
		FinishAnim();
		TweenToPatrolStop(0.1);
		FinishAnim();
	}
	if (AlarmTag == '')
		WhatToDoNext('','');
	else
		GotoState('TriggerAlarm');
}

state TriggerAlarm
{
	ignores HearNoise, SeePlayer;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		local bool bWasFriendly;

		bWasFriendly = ( !bNoWait && Enemy.bIsPlayer && (AttitudeToPlayer == ATTITUDE_Friendly) );
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			if ( bWasFriendly && (AttitudeToPlayer < ATTITUDE_Friendly) )
			{
				AlarmTag = '';
				NextState = 'Attacking';
				NextLabel = 'Begin';
			}
			else
			{
				NextState = 'TriggerAlarm';
				NextLabel = 'Recover';
			}
			GotoState('TakeHit');
		}
	}

	function EnemyNotVisible()
	{
		if (Enemy != none && AttitudeTo(Enemy) >= ATTITUDE_Ignore)
			GotoState('AlarmPaused', 'WaitForPlayer');
	}

	function Bump(actor Other)
	{
	    if ( Health <= 0 || bDeleteme )
		  return;
		if ( (Pawn(Other) != None) && Pawn(Other).bIsPlayer
			&& (AttitudeToPlayer == ATTITUDE_Friendly) )
			return;

		Super.Bump(Other);
	}

	function AlarmDone()
	{
		local pawn OtherPawn;
		local Actor A;
		local AlarmPoint AlarmSpot;

		AlarmSpot = AlarmPoint(OrderObject);
		if ( AlarmSpot != None )
		{
			if( AlarmSpot.Event != '' )
				foreach AllActors( class 'Actor', A, AlarmSpot.Event )
				{
					if ( (ScriptedPawn(A) != None) && AlarmSpot.bKillMe )
						ScriptedPawn(A).Hated = self;
					A.Trigger( self, instigator );
				}
			if ( AlarmSpot.bDestroyAlarmTriggerer )
			{
				OtherPawn = Level.PawnList;
				while ( OtherPawn != None )
				{
					OtherPawn.Killed(self, self, '');
					OtherPawn = OtherPawn.nextPawn;
				}
				level.game.Killed(self, self, '');
				//log(class$" dying");
				if( Event != '' )
					foreach AllActors( class 'Actor', A, Event )
						A.Trigger( Self, Instigator );
				Weapon = None;
				Level.Game.DiscardInventory(self);
				Destroy();
				return;
			}
			AlarmTag = AlarmSpot.NextAlarm;
			if ( AlarmSpot.pausetime > 0.0 )
			{
				Acceleration = vect(0,0,0);
				if ( Enemy != none && AttitudeTo(Enemy) > ATTITUDE_Ignore)
					GotoState('AlarmPaused', 'WaitAround');
				else
					GotoState('AlarmPaused');
			}
			else if ( AlarmTag != '' )
			{
				FindAlarm();
				GotoState('TriggerAlarm', 'Begin');
			}
			else if (Enemy != none && AttitudeTo(Enemy) > ATTITUDE_Ignore)
			{
				Acceleration = vect(0,0,0);
				GotoState('Roaming');
			}
			else
			{
				bReadyToAttack = true;
				GotoState('Attacking');
			}
			return;
		}

		AlarmTag = '';

		if (AttitudeToPlayer > ATTITUDE_Ignore)
			GotoState('AlarmPaused', 'WaitAround');
		else
		{
			bReadyToAttack = true;
			GotoState('Attacking');
		}
	}

	function BeginState()
	{
		bCanFire = false;
		SpecialGoal = None;
		SpecialPause = 0.0;
		bSpecialPausing = false;
		if ( (Enemy!=none) && !Enemy.bIsPlayer
			|| ((AttitudeToPlayer == ATTITUDE_Fear)
				&& !bInitialFear && (Default.AttitudeToPlayer == ATTITUDE_Friendly)) )
		{
			GotoState('Attacking');
			return;
		}

		FindAlarm();

		if ( (TeamLeader != None) && !TeamLeader.bTeamSpeaking )
			TeamLeader.SpeakOrderTo(self);
	}
}


state Ambushing
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
		else if ( Enemy != None )
			GotoState('Attacking');
	}
}

state FallingState
{
ignores Bump, Hitwall, WarnTarget;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (Enemy == None)
		{
			Enemy = instigatedBy;
			NextState = 'Attacking';
			NextLabel = 'Begin';
		}
		if (Enemy != None)
			LastSeenPos = Enemy.Location;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
	}
}

state Greeting
{
	ignores SeePlayer, EnemyNotVisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		local eAttitude AttEn;
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if ( Enemy != None )
		{
			AttEn = AttitudeTo(Enemy);
			if (NextState == 'TakeHit')
			{
				if (AttEn == ATTITUDE_Fear)
				{
					NextState = 'Retreating';
					NextLabel = 'Begin';
				}
				else
				{
					NextState = 'Attacking';
					NextLabel = 'Begin';
				}
				GotoState('TakeHit');
			}
			else
				GotoState('Attacking');
		}
	}
}

state TakeHit
{
ignores seeplayer, hearnoise, bump, hitwall;

	function Timer()
	{
		bReadyToAttack = true;
	}

	singular function PlayHitAnim(vector HitLocation, float Damage)
	{
		if ( LastPainTime - Level.TimeSeconds > 0.1 )
		{
			PlayTakeHit(0.1, hitLocation, Damage);
			BeginState();
			GotoState('TakeHit', 'Begin');
		}
	}

	function BeginState()
	{
		LastPainTime = Level.TimeSeconds;
		LastPainAnim = AnimSequence;
		if(NextState == 'TakeHit')
		   NextState = '';
	}

Begin:
	// Acceleration = Normal(Acceleration);
	FinishAnim();
	if ( skill < 2 )
		Sleep(0.05);
	if ( (Physics == PHYS_Falling) && !Region.Zone.bWaterZone )
	{
		Acceleration = vect(0,0,0);
		NextAnim = '';
		GotoState('FallingState', 'Ducking');
	}
	else if (NextState != '' && NextState != 'TakeHit')
		GotoState(NextState, NextLabel);
	else
		GotoState('Attacking');
}

state Retreating
{
ignores EnemyNotVisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'Retreating';
			NextLabel = 'TakeHit';
			GotoState('TakeHit');
		}
	}

	function SeePlayer(Actor SeenPlayer)
	{
		if ( (SeenPlayer == Enemy) || LineOfSightTo(Enemy) )
		{
			LastSeenTime = Level.TimeSeconds;
			return;
		}
		if ( SetEnemy(Pawn(SeenPlayer)) )
		{
			MakeNoise(1.0);
			GotoState('Attacking');
		}
	}

	singular function HearNoise(float Loudness, Actor NoiseMaker)
	{
	    if ( Health <= 0 || bDeleteme )
		  return;
		if ( ((NoiseMaker.instigator == Enemy) || LineOfSightTo(Enemy))
             && Enemy !=none )
			return;

		if ( SetEnemy(NoiseMaker.instigator) )
		{
			MakeNoise(1.0);
			GotoState('Attacking');
		}
	}

    function HitWall(vector HitNormal, actor Wall)
	{
		bSpecialPausing = false;
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Retreating', 'SpecialNavig');
			return;
		}
		Focus = Destination;
		if (PickWallAdjust())
        {
		   if ( Physics == PHYS_Falling )
		     SetFall();
           else
		  	 GotoState('Retreating', 'AdjustFromWall');
        }
		else
		{
			Home = None;
			MoveTimer = -1.0;
		}
	}

	function Bump(actor Other)
	{
		local vector VelDir, OtherDir;
		local float speed;

		//log(Other.class$" bumped "$class);
	    if ( Health <= 0 || bDeleteme )
		  return;
		if (Pawn(Other) != None)
		{
			if ( (Other == Enemy) || SetEnemy(Pawn(Other)) )
				GotoState('MeleeAttack');
			else if ( (HomeBase(Home) != None)
				&& (VSize(Location - Home.Location) < HomeBase(Home).Extent) )
				ReachedHome();
			return;
		}
		if ( TimerRate <= 0 )
			setTimer(1.0, false);

		speed = VSize(Velocity);
		if ( speed > 1 )
		{
			VelDir = Velocity/speed;
			VelDir.Z = 0;
			OtherDir = Other.Location - Location;
			OtherDir.Z = 0;
			OtherDir = Normal(OtherDir);
			if ( (VelDir Dot OtherDir) > 0.9 )
			{
				Velocity.X = VelDir.Y;
				Velocity.Y = -1 * VelDir.X;
				Velocity *= FMax(speed, 200);
			}
		}
		Disable('Bump');
	}

	function PickDestination()
	{
     local NavigationPoint Nav;
     local int zzi;
     local float dist;
     local vector Dir;

	 if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	 {
		WhatToDoNext('','');
		return;
	 }

	 if( Level.NavigationPointList == None )
	 {
          if ( Enemy != None )
          {
            AttitudeTo(Enemy) == ATTITUDE_Hate;
			Aggressiveness += 0.3;
			GotoState( 'Attacking' );
            return;
          }
          WhatToDoNext('','');
		  return;
	 }

     if (HomeBase(Home) == None)
     {
  	  zzi=0;
      for ( Nav=Level.NavigationPointList; Nav!=None; Nav=Nav.NextNavigationPoint )
	  if ( Nav.IsA('NavigationPoint') && !Nav.IsA('LiftCenter')&& !Nav.IsA('LiftExit') && !Nav.IsA('Teleporter'))
      {
	  	    Dir = Nav.Location - Location;
	        dist = VSize(Dir);
           	if ( (dist < 2000) && (dist > 20) )
            {
             zzi++;
             if ( (home == none) || (Rand(zzi) == 0) )
			     home = Nav;
		    }
      }
      if (Home == none )
      {
        if (bReadyToAttack)
      	 {
      	  setTimer(3.0, false);
          if (Enemy !=none )
       	  	  Target = Enemy;
      	  GotoState('RangedAttack');
		 }
   	     else
   	     {
   	    	Aggressiveness += 0.3;
  	     	GotoState('TacticalMove', 'NoCharge');
   	     }
   	  }
     }
    }

Begin:
	//log(class$" retreating");
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
     GotoState('Attacking');
	if ( bReadyToAttack && (FRand() < 0.6) )
	{
		SetTimer(TimeBetweenAttacks, false);
		bReadyToAttack = false;
	}
	TweenToRunning(0.1);
	WaitForLanding();
	PickDestination();

Landed:
	TweenToRunning(0.1);

RunAway:
	PickNextSpot();
SpecialNavig:
	if (SpecialPause > 0.0)
	{
		if ( Enemy!=none && LineOfSightTo(Enemy))
		{
			bFiringPaused = true;
			NextState = 'Retreating';
			NextLabel = 'Moving';
			GotoState('RangedAttack');
		}
		bSpecialPausing = true;
		Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.25);
		Sleep(SpecialPause);
		SpecialPause = 0.0;
		bSpecialPausing = false;
		TweenToRunning(0.1);
	}
Moving:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
      GotoState('Attacking');
	if ( MoveTarget == None )
	{
		Sleep(0.0);
		Goto('RunAway');
	}
	if ( !bCanStrafe || !LineOfSightTo(Enemy) ||
		(Skill - 2 * FRand() + (Normal(Enemy.Location - Location - vect(0,0,1) * (Enemy.Location.Z - Location.Z))
			Dot Normal(MoveTarget.Location - Location - vect(0,0,1) * (MoveTarget.Location.Z - Location.Z))) < 0) )
	{
		bCanFire = false;
		MoveToward(MoveTarget);
	}
	else
	{
		bCanFire = true;
		StrafeFacing(MoveTarget.Location, Enemy);
	}
	Goto('RunAway');

TakeHit:
	TweenToRunning(0.12);
	Goto('Moving');

AdjustFromWall:
	if ( !IsAnimating() )
 	  PlayRunning();
	StrafeTo(Destination, Focus);
	Destination = Focus;
	MoveTo(Destination);
	Goto('Moving');

TurnAtHome:
	Acceleration = vect(0,0,0);
    if (HomeBase(Home) != None)
	  TurnTo(Homebase(Home).lookdir);
	GotoState('Ambushing', 'FindAmbushSpot');
}

state RangedAttack
{
ignores SeePlayer, HearNoise, Bump;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme)
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'RangedAttack';
			NextLabel = 'Begin';
		}
	}

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

auto state StartUp
{
ignores PeerNotification;
    function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
    {}

	function BeginState()
	{
		if( bBeamingIn )
		{
			Style = STY_Translucent;
			bMeshEnviroMap = True;
			Texture = Texture'UMSMarinesII.FX.mcloak';
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
		if(myWeapon.IsA('CARifle'))
		{
			myWeapon.AltRefireRate=1;
			myWeapon.RefireRate= 0.3;
		}
		if(bBeamingIn)
		{
			myWeapon.PickupSound = None;
			myWeapon.SelectSound = None;
			myWeapon.Misc1Sound = None;
			myWeapon.Misc2Sound = None;
			myWeapon.Misc3Sound = None;
		}
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
		Octagon.SetFade( BeamWaitTime, 0.5, BeamTime );
		Sleep( BeamWaitTime );
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

function Died(pawn Killer, name damageType, vector HitLocation)
{
	local pawn OtherPawn;
	local actor A;

	if ( bDeleteMe )
		return;

	bIsPlayer = false;

	if ( bTeleportWhenHurt )
	{
        bExplodeWhenHurt=false;
	    PlayAnim('Activate');
        bInitz=true;
	    GotoState('Teleporting');
		return;
	}
	else if ( bExplodeWhenHurt )
	{
		PlayAnim('Activate');
		GotoState('Exploding');
		return;
	}
	else if ( Weapon != none )
	{
		Weapon.AmmoType.AmmoAmount = Weapon.AmmoType.Default.AmmoAmount - Rand(3);
	}

	Health = Min(0, Health);
	for ( OtherPawn=Level.PawnList; OtherPawn!=None; OtherPawn=OtherPawn.nextPawn )
		OtherPawn.Killed(Killer, self, damageType);
	if ( CarriedDecoration != None )
		DropDecoration();
    if ( killer != none )
       level.game.Killed(Killer, self, damageType);
	//log(class$" dying");
	if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( Self, Killer );
	Level.Game.DiscardInventory(self);
	Velocity.Z *= 1.3;
	if ( Gibbed(damageType) )
	{
		SpawnGibbedCarcass();
		if ( bIsPlayer )
			HidePlayer();
		else
			Destroy();
	}
	PlayDying(DamageType, HitLocation);
	if ( Level.Game.bGameEnded )
		return;
	if ( RemoteRole == ROLE_AutonomousProxy )
		ClientDying(DamageType, HitLocation);
	GotoState('Dying');

	//super.Died(Killer, damageType, HitLocation);
}

state Exploding
{
ignores Fireweapon, PeerNotification, TakeDamage, SeePlayer, EnemyNotVisible, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget, Died;

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

state StakeOut
{
ignores EnemyNotVisible;

     function PlayChallenge()
     {
         PlayWaiting();
     }

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		bFrustrated = true;
        if ( (Enemy != None) && (Enemy == InstigatedBy) )
		 LastSeenPos = Enemy.Location;
		if (NextState == 'TakeHit')
		{
			if (Enemy != None && AttitudeTo(Enemy) == ATTITUDE_Fear)
			{
				NextState = 'Retreating';
				NextLabel = 'Begin';
			}
			else
			{
				NextState = 'Attacking';
				NextLabel = 'Begin';
			}
			GotoState('TakeHit');
		}
		else
			GotoState('Attacking');
	}

	function rotator AdjustAim(float projSpeed, vector projStart, int aimerror, bool leadTarget, bool warnTarget)
	{
		local rotator FireRotation;
		local vector FireSpot;
		local actor HitActor;
		local vector HitLocation, HitNormal;

		FireSpot = LastSeenPos;
		aimerror = aimerror * (0.5 * (4 - skill - FRand()));

		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
		if( HitActor != None )
		{
			////log("adjust aim up");
			if (Enemy!=none)
 			 FireSpot.Z += 0.9 * Enemy.CollisionHeight;
 			HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
			bClearShot = (HitActor == None);
            if ( !bClearShot )
				FireSpot = LastSeenPos;
		}

		FireRotation = Rotator(FireSpot - ProjStart);

		FireRotation.Yaw = FireRotation.Yaw + 0.5 * (Rand(2 * aimerror) - aimerror);
		viewRotation = FireRotation;
		return FireRotation;
	}

	function BeginState()
	{
		local actor HitActor;
		local vector HitLocation, HitNormal;

        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        {
		  gotoState('Attacking');
          return;
        }
		Acceleration = vect(0,0,0);
		bCanJump = false;
		HitActor = Trace(HitLocation, HitNormal, LastSeenPos + vect(0,0,0.9) * Enemy.CollisionHeight, Location + vect(0,0,0.8) * EyeHeight, false);
		bClearShot = (HitActor == None);
		bReadyToAttack = true;
		SetAlertness(0.5);
	}

Begin:
	Acceleration = vect(0,0,0);
	PlayChallenge();
	TurnTo(LastSeenPos);
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		gotoState('Attacking');
	if ( bHasRangedAttack && bClearShot && (FRand() < 0.5) && (VSize(Enemy.Location - LastSeenPos) < 150) && CanStakeOut() )
		PlayRangedAttack();
	FinishAnim();
	PlayChallenge();
	if ( bCrouching && !Region.Zone.bWaterZone )
		Sleep(1);
	bCrouching = false;
	Sleep(1 + FRand());
	if (Enemy!=none)
	{
	 if ( !bHasRangedAttack || !bClearShot || (VSize(Enemy.Location - Location)
				> 350 + (FRand() * RelativeStrength(Enemy) - CombatStyle) * 350) )
		gotoState('Hunting', 'AfterFall');
	 else if ( CanStakeOut() )
		goto('Begin');
	 else
		gotoState('Hunting', 'AfterFall');
	}
    else
		gotoState('Attacking');
}

state BeamingIn // Code taken from RLCoopE and adjusted THX Rayne!
{
	ignores EnemyAcquired, PeerNotification, TakeDamage, SeePlayer, EnemyNotVisible, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget, Died;
	//ignores SeePlayer, EnemyNotVisible, HearNoise, KilledBy, Trigger, Bump, HitWall, Falling, WarnTarget, Died, LongFall, PlayLanded, TakeDamage, PeerNotification;
	
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
			MyWeapon.bUnlit=True;
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
		//Octagon.Destroy();
		bHidden = False;
		SightRadius=227327;
		myWeapon.PickupSound = myWeapon.Default.PickupSound;
		myWeapon.SelectSound = myWeapon.Default.SelectSound;
		myWeapon.Misc1Sound = myWeapon.Default.Misc1Sound;
		myWeapon.Misc2Sound = myWeapon.Default.Misc2Sound;
		myWeapon.Misc3Sound = myWeapon.Default.Misc3Sound;
		GoToState('Hunting');
	}

	simulated function Tick( float DeltaTime )
	{
		if ( ScaleGlow < 1.5 )
			ScaleGlow += 0.03;
		else
		{
			Style = Default.Style;

			if( ScaleGlow > 0.15 )
				ScaleGlow -= 0.03;
		}

		if ( Fatness < 128)
		{
			Fatness++;
		}

		if ( BeamEffect.Fatness < 165)
		{
			BeamEffect.Fatness++;
		}

		if ( MyWeapon != none && MyWeapon.ScaleGlow < 1.5 )
		{
			MyWeapon.ScaleGlow += 0.01;
		}
		else
		{
			MyWeapon.Style = STY_Normal;
			MyWeapon.bMeshEnviroMap = false;
			MyWeapon.ScaleGlow = Weapon.Default.ScaleGlow;
			MyWeapon.Texture = Weapon.Default.Texture;
			MyWeapon.Fatness = Weapon.Default.Fatness;
			MyWeapon.bUnlit=Weapon.Default.bUnlit;
		}

		if ( bHidden )
		{
			bHidden = false;
			MyWeapon.bHidden = false;
		}
		
		else
		
		if ( FRand() < 0.2 && !bHidden )
		{
			bHidden = true;
			MyWeapon.bHidden = true;
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
	Sleep( BeamTime );
	Style = Default.Style;
	MyWeapon.Texture = MyWeapon.Default.Texture;
	MyWeapon.ScaleGlow = MyWeapon.Default.ScaleGlow;
	MyWeapon.bMeshEnviroMap = false;
	MyWeapon.Style=STY_Normal;
	MyWeapon.bUnlit=Weapon.Default.bUnlit;
	Mass = Default.Mass;
	GotoState( 'Hunting' );
}



state Betraying
{
	ignores NotifyPeers, PeerNotification, Bump, falling, landed; //fixme

//ignores SeePlayer if enemy is a player //but not hear noise
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation, 
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 )
			return;
		if (NextState == 'TakeHit')
		{
			bReadyToAttack = true;
			NextState = 'Attacking'; 
			NextLabel = 'Begin';
			GotoState('TakeHit'); 
		}
		else
		{
			bReadyToAttack = true;
			GotoState('Attacking');
		}
	}

	function Trigger( actor Other, pawn EventInstigator )
	{
		if (EventInstigator.bIsPlayer)
		{
			Enemy = EventInstigator;
			AttitudeToPlayer = ATTITUDE_Hate;
			GotoState('Attacking');
		}
	}

	function EnemyNotVisible()
	{
		////log("enemy not visible");
		GotoState('Ambushing'); 
	}
	
	function EnemyAcquired()
	{
		if (AttitudeTo(Enemy) < ATTITUDE_Threaten)
			GotoState('Attacking');
	}
	
	function PickGuardDestination()
	{
		local vector desiredDest;
		local Actor path;
		
		desiredDest = OrderObject.Location + 
				(OrderObject.CollisionRadius + 2.5 * CollisionRadius) * Normal(Enemy.Location - OrderObject.Location);

		if ( VSize(desiredDest - Location) < 60 )
		{
			Destination = Location;
			return;
		}

		if (pointReachable(desiredDest))
			Destination = desiredDest;
		else
		{
			path = FindPathTo(desiredDest, true);
			if (path != None)
			{
				MoveTarget = path;
				Destination = path.Location;
			}
			else
				Destination = Location;
		}
	}
	
	function PickThreatenDestination()
	{
		local vector desiredDest;
		local Actor path;

		desiredDest = Location + 
				0.4 * (VSize(Enemy.Location - Location) - CollisionRadius - Enemy.CollisionRadius - MeleeRange)
				* Normal(Enemy.Location - Location);

		if (pointReachable(desiredDest))
			Destination = desiredDest;
		else
		{
			path = FindPathTo(desiredDest, true);
			if (path != None)
			{
				MoveTarget = path;
				Destination = path.Location;
			}
			else
				Destination = Location;
		}
	}

	function BeginState()
	{
		bCanJump = false;
	}
	
	function EndState()
	{
		if (JumpZ > 0)
			bCanJump = true;
	}

	Function Timer()
	{
		bLuring=True;
	}

Begin:
	Acceleration = vect(0,0,0);
	bReadyToAttack = true;
	if (Enemy != none && Enemy.bIsPlayer)
		Disable('SeePlayer'); //but not hear noise
	TweenToPatrolStop(0.2);
	FinishAnim();
	NextAnim = '';

FaceEnemy:
	Acceleration = vect(0,0,0);
	if (NeedToTurn(enemy.Location))
	{	
		PlayTurning();
		TurnToward(Enemy);
		TweenToPatrolStop(0.2);
		FinishAnim();
		NextAnim = '';
	}

Threaten:

	if(bLurePlayer)
	{
		if(VSize(Enemy.Location - Location) < 512)
		{
			if(TBU !=3)
			{
				Acceleration = vect(0,0,0);
				TBU++;
				BetrayPhrase();
				if(  Weapon != none )
				BetrayAnims();
				bLuring=False;
				sleep(0.5);
				SetTimer(2.5,False);
				While(!bLuring){
				TurnToward(Enemy);
				TweenToWalking(0.2);
				FinishAnim();
				PlayWalking();
				if(VSize(Enemy.Location - Location) > 128)
				MoveToward(Enemy,WalkingSpeed);
				else
				PlayWaiting();}
				if(bLuring)
				Goto('Threaten');
			}
			else
			{
				bActFriendly=False;
				AcquirePhrase();
				AttitudeToPlayer=ATTITUDE_Hate;
				GotoState('Attacking');
				
				foreach RadiusActors( class'UMSSpacemarine', BetrayBuddy, CommandRadius )
				{
					if (BetrayBuddy != self)
					BetrayBuddy.AttitudeToPlayer=ATTITUDE_Hate;
					BetrayBuddy.AcquirePhrase();
					BetrayBuddy.GotoState('Attacking');
				}
			}
		}
		else
		{
			While(VSize(Enemy.Location - Location) > 512)
			{
				TurnToward(Enemy);
				//TweenToRunning(0.2);
				//FinishAnim();
				PlayRunning();
				MoveToward(Enemy,GroundSpeed);
			}
		}
	}

	if (AttitudeTo(Enemy) < ATTITUDE_Threaten)
		GotoState('Attacking');

	PlayThreatening();
	FinishAnim();

	if (AttitudeTo(Enemy) < ATTITUDE_Threaten)
		GotoState('Attacking');
		
	if (Orders == 'Guarding')
	{ //stay between enemy and guard object
		If (Enemy.bIsPlayer &&
			(VSize(Enemy.Location - OrderObject.Location) < OrderObject.CollisionRadius + 2 * CollisionRadius + MeleeRange))
		{
			AttitudeToPlayer = ATTITUDE_Hate;
			GotoState('Attacking');
		}
	}
	else if (FRand() < 0.9 - Aggressiveness) //mostly just turn
		Goto('FaceEnemy');
	else if (VSize(Enemy.Location - Location) < 2.5 * (CollisionRadius + Enemy.CollisionRadius + MeleeRange))
		Goto('FaceEnemy');

	WaitForLanding();
	if (Orders == 'Guarding') //stay between enemy and guard object
		PickGuardDestination();
	else
		PickThreatenDestination();
		
	if (Destination != Location)
	{
		TweenToWalking(0.2);
		FinishAnim();
		PlayWalking();
		MoveTo(Destination, WalkingSpeed);
		Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.2);
		FinishAnim();
		NextAnim = '';
	}
		
	Goto('FaceEnemy');
}

State Teleporting
{
ignores Fireweapon, PeerNotification, TakeDamage, SeePlayer, EnemyNotVisible, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget, Died;

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
	HumanKillMessage=" was blown away by a UMS Space Marine"
	DispPowerLevel=1
	strafedodge=False
	Aggressiveness=0.9
	RefireRate=0.3
	CarcassType=Class'UMSMarinesII.UMSSpaceMarineCarcass'
	Health=100
	MeleeRange=50.0
	GroundSpeed=380.0
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
	Mesh=LodMesh'UMSMarinesII.UMSMarine'
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
	ExploRange=384
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
	MultiSkins(1)=Texture'UMSMarinesII.Skins.JMarine7'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.JMarine8'
	DrawScale=1.05
	CollisionRadius=21.0
	CollisionHeight=43.0
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
	Skill=1
}