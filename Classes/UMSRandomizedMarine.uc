//=============================================================================
// UMSRandomizedMarine - Asgard/Xaleros/GFour
//=============================================================================
class UMSRandomizedMarine extends UMSSpaceMarine;

var(UMSSpaceMarine) Array<String> RandWeaponsList;

Function PostBeginPlay()
{
	if(WeaponType == None)
	PickRWeapon();
	Super.PostBeginPlay();
	if( FRand() < 0.5 )
	bPerfersRanged=True;
}

Function PickRWeapon()
{
	local int i,failsafe;

	while(WeaponType==None && failsafe<1000)
	{
		I=Rand(Array_Size(RandWeaponsList));
		WeaponType=Class<Weapon>(DynamicLoadObject(RandWeaponsList[i],Class'Class',True));
		failsafe++;
	}
}

defaultproperties
{
	RandWeaponsList(0)="UPak.Carifle"
	RandWeaponsList(1)="UPak.GrenadeLauncher"
	RandWeaponsList(2)="UPak.RocketLauncher"
	RandWeaponsList(3)="UnrealShare.Automag"
	RandWeaponsList(4)="UnrealShare.Stinger"
	WeaponType=None
}