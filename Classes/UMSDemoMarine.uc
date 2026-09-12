//=============================================================================
// UMSDemoMarine
//=============================================================================
class UMSDemoMarine extends UMSSpecialForces;

#exec texture IMPORT NAME=JProxSkin FILE=Textures\Skins\Jdetn1.PCX GROUP=Skins LODSET=2

var(UMSDemolitionsMarine) bool bTurret,bCastMines;
var(UMSDemolitionsMarine) int MaxMines,MaxActiveMines;
var(UMSDemolitionsMarine) float MineCastCooldown;

defaultproperties
{
	MultiSkins(1)=Texture'UMSMarinesII.Skins.DMarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.DMarine2'
	GlowyBits=(EffectMultiSkin1=None,EffectMultiSkin2=None,ExtraEffect=Texture'UMSMarinesII.FX.DemoMarineGlow',ExtraEffectLayer=MultiSkin1)
	WeaponType='UnrealShare.Eightball'
}