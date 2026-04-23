//=============================================================================
// UMSJarheadMarine - GFour
// Voiced by the man the myth the legend AlphaScout.
//=============================================================================

#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage1.WAV" NAME="JRage1" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage2.WAV" NAME="JRage2" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage3.WAV" NAME="JRage3" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage4.WAV" NAME="JRage4" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage5.WAV" NAME="JRage5" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage6.WAV" NAME="JRage6" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage7.WAV" NAME="JRage7" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage8.WAV" NAME="JRage8" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage9.WAV" NAME="JRage9" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadRage10.WAV" NAME="JRage10" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadSwing1.WAV" NAME="JSwing1" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadSwing2.WAV" NAME="JSwing2" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadSwing3.WAV" NAME="JSwing3" GROUP="Voice"
#exec AUDIO IMPORT FILE="Sounds\Voice\JarheadSwing4.WAV" NAME="JSwing4" GROUP="Voice"

class UMSJarheadMarine extends UMSSpecialForces;

var effects GhostT;
var bool bEnraged;
var Inventory SB;
var bool bShieldOn;

Function FireWeapon()
{
	if( !bEnraged && Health < 0.45 * Default.Health )
	GotoState('SuperFuckingAngryMode');
	Super.FireWeapon();
}

Function AddArmor()
{
	SB=Spawn(class'UMSJHeadBelt');
	bIsPlayer = True;
	SB.Touch(self);
	bIsPlayer = False;
	bShieldOn=True;
}

Function Tick(float DeltaTime)
{
	if(bEnraged)
	{
		if(VSize(Velocity) > 100)
		GhostT=Spawn(Class'UMSGhostTrail',Self,,Location,Rotation);
		if(GhostT != None)
		{
			GhostT.Texture=Texture'UnrealShare.Redshield';
			GhostT.bUnlit=True;
			GhostT.scaleglow=0.85;
		}
	}
}

State SuperFuckingAngryMode
{
Begin:
Velocity*=0;
Acceleration*=0;
AddArmor();
PlayAnim('Victory',1.4,0.2);
PlaySound( sound'JRage4', SLOT_None,2.0*0.9 );
PlaySound(Sound'Activates.Beeps.Mactiv63', SLOT_Interact);
FinishAnim();
Weapon.Destroy();
bEnraged=True;
GroundSpeed=420;
PunchDamage=15;
SlamDamage=20;
GotoState('Charging');
}

defaultproperties
{
	Health=150
	bExplodeWhenHurt=True
	WeaponType=Weapon'UnrealShare.Eightball'
	AcquirePhrases=(MaleSounds=((Male=Sound'UMSMarinesII.Voice.JRage10')),FemaleSounds=())
	HelpPhrases=(MaleSounds=(),FemaleSounds=())
	ChargePhrases=(MaleSounds=((Male=Sound'UMSMarinesII.Voice.JRage4',bAllowResponse=False),(Male=Sound'UMSMarinesII.Voice.JRage3',bAllowResponse=False),(Male=Sound'UMSMarinesII.Voice.JRage5',bAllowResponse=False)),FemaleSounds=())
	KillPhrases=(MaleSounds=((Male=Sound'UMSMarinesII.Voice.JRage7'),(Male=Sound'UMSMarinesII.Voice.JRage6'),(Male=Sound'UMSMarinesII.Voice.JRage8'),(Male=Sound'UMSMarinesII.Voice.JRage9')),FemaleSounds=())
	RespondPhrases=(MaleSounds=(),FemaleSounds=())
	Gender=GENDER_Male
	bSkinOverride=False
	MarineSkin=SKIN_Jungle
	Skill=6.0
	CombatStyle=1.0
}