//=============================================================================
// UMSJungleMarine - Asgard
//   Source code rights:
//   Copyright 2005 Asgard. All right reserved.
//   asgard@iprimus.com.au
//   http://www.angelfire.com/empire/napali/
//
//=============================================================================
class UMSJungleMarine extends UMSSpaceMarine;

#exec texture IMPORT NAME=Jmarine3 FILE=MODELS\Jmarine3.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=Jmarine4 FILE=MODELS\jmarine4.PCX GROUP=Skins LODSET=2

defaultproperties
{
	HumanKillMessage=" was blown away by a UMS Jungle Marine"
	DispPowerLevel=4
	CombatStyle=0.5
	MenuName="UMS Jungle Marine"
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jmarine3'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jmarine4'
}
