//=============================================================================
// UMSArcticMarine - Asgard
// http://www.angelfire.com/empire/napali/
//=============================================================================
class UMSArcticMarine extends UMSSpaceMarine;

#exec texture IMPORT NAME=Jmarine1 FILE=MODELS\Jmarine1.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=Jmarine2 FILE=MODELS\jmarine2.PCX GROUP=Skins LODSET=2

defaultproperties
{
	HumanKillMessage=" was blown away by a UMS Arctic Marine"
	MenuName="UMS Arctic Marine"
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jmarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jmarine2'
}
