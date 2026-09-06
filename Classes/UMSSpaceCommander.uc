//=============================================================================
// UMSSpaceCommander
//=============================================================================
class UMSSpaceCommander extends UMSSpecialForces;


defaultproperties
{
	WeaponType=class'UnrealShare.Rifle'
	HumanKillMessage=" was assassinated by a UMS Marine Commander"
	MenuName="UMS Marine Commander"
	MultiSkins(1)=Texture'UMSMarinesII.Skins.CMarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.CMarine2'
	Skill=3
	GlowyBits=(EffectMultiSkin1=None,EffectMultiSkin2=None,ExtraEffect=Texture'UMSMarinesII.FX.MarineBlackOpsGlow',ExtraEffectLayer=MultiSkin1)
}