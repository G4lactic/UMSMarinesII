//=============================================================================
// UMSDesertMarine - Asgard
//=============================================================================
class UMSDesertMarine extends UMSSpaceMarine;

#exec texture IMPORT NAME=Jmarine5 FILE=MODELS\Jmarine5.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=Jmarine6 FILE=MODELS\jmarine6.PCX GROUP=Skins LODSET=2

defaultproperties
{
	HumanKillMessage=" was blown away by a UMS Desert Marine"
	MenuName="UMS Desert Marine"
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jmarine5'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jmarine6'
}
