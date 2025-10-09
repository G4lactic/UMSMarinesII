//=============================================================================
// UMSMiniSentry - GFour
// !!!WORK IN PROGRESS!!!
//=============================================================================
class UMSMiniSentry extends ScriptedPawn;
/*
#exec TEXTURE IMPORT NAME=Sentry1 FILE=Models\Sentry1.pcx GROUP="Skins"

#exec MESH IMPORT MESH=SentryM ANIVFILE=Models\sentry_a.3D DATAFILE=Models\sentry_d.3D X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=SentryM X=-90 Y=90 Z=-80 YAW=64
#exec MESH SEQUENCE MESH=SentryM SEQ=All    STARTFRAME=0  NUMFRAMES=46
#exec MESH SEQUENCE MESH=SentryM SEQ=Up     STARTFRAME=0  NUMFRAMES=5
#exec MESH SEQUENCE MESH=SentryM SEQ=Still  STARTFRAME=5  NUMFRAMES=1
#exec MESH SEQUENCE MESH=SentryM SEQ=WarmUp STARTFRAME=6  NUMFRAMES=14
#exec MESH SEQUENCE MESH=SentryM SEQ=Fire   STARTFRAME=20 NUMFRAMES=4
#exec MESH SEQUENCE MESH=SentryM SEQ=Down   STARTFRAME=24  NUMFRAMES=21
#exec MESHMAP SCALE MESHMAP=SentryM X=0.06 Y=0.06 Z=0.12
#exec MESHMAP SETTEXTURE MESHMAP=SentryM NUM=1 TEXTURE=Sentry1
#exec MESHMAP SETTEXTURE MESHMAP=SentryM NUM=0 TEXTURE=FireEffect8

//#exec MESH NOTIFY MESH=SentryM SEQ=Fire TIME=0.3 FUNCTION=GenerateBullet
//#exec MESH NOTIFY MESH=SentryM SEQ=Fire TIME=0.8 FUNCTION=GenerateBullet

#exec AUDIO IMPORT FILE="Sounds\sentrywind.WAV" NAME="SentryWind" GROUP="Sentry"
#exec AUDIO IMPORT FILE="Sounds\sentryunwind.WAV" NAME="SentryUnWind" GROUP="Sentry"
#exec AUDIO IMPORT FILE="Sounds\sentryfire.WAV" NAME="SentryFire" GROUP="Sentry"
*/
//Main Variables
var(SentryGun) int iHitDamage;
var(SentryGun) float fAttackConeRadius;
var(SentryGun) float fSpinupTime;
var(SentryGun) bool bStartOff;
var(SentryGun) bool bIgnoreFriendlies; // Could be used for a malfunctioning turret.

//Override Variables
var(SentryGunOverrides) bool bProjectileOverride;

defaultproperties
{
	iHitDamage=4
	fAttackConeRadius=256.0
	fSpinupTime=0.25
	DrawScale=1.25
	TransientSoundVolume=1.5
	CollisionHeight=23.0
	Mesh=LodMesh'UnrealShare.SentryM'
	AnimSequence="Still"
	DrawType=DT_Mesh
	Fatness=182
	LightBrightness=200
	LightHue=36
	LightSaturation=64
	LightRadius=7
}