//=============================================================================
// UMSFieldSpecialist - GFour
// TODO:
//	-Throw down sentry gun pawn as special ability
//=============================================================================
class UMSFieldSpecialist extends UMSSpecialForces;

#exec texture IMPORT NAME=ATMarine1 FILE=MODELS\ATMarine1.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=ATMarine2 FILE=MODELS\ATMarine2.PCX GROUP=Skins LODSET=2

var Effects Glowy;

Function PostBeginPlay()
{
    Glowy=Spawn(Class'UMSGlowyVisor3',Self,,Location,Rotation);
	Super.PostBeginPlay();
}

defaultproperties
{
	HumanKillMessage=" was blown away by a UMS Field Specialist"
	MenuName="UMS Field Specialist"
	WeaponType=class'UnrealShare.Stinger'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.ATMarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.ATMarine2'
}