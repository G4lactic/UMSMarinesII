//=============================================================================
//  UMSMarineSpawnpoint -- GFour.
//=============================================================================
class UMSMarineSpawnPoint extends UMSTools;

//Structs
Struct ExtraSetup
{
	var() int DispPowerLevel;
	var() bool bTeleportWhenHurt;
	var() bool bExplodeWhenHurt;
};

Struct ExtraVars
{
	var() name Orders;
	var() name OrderTag;
	var() name MarineDeathEvent;
};

// Setup Vars
var(UMSMarineSpawnPoint) class <umsspacemarine> cMarineType;
var(UMSMarineSpawnPoint) class <Weapon> cMarineWeaponType;
var(UMSMarineSpawnPoint) bool bBeamingIn;
var(UMSMarineSpawnPoint) bool bAutoHatePlayer;
var(UMSMarineSpawnPoint) ExtraSetup MarineExtras;
var(UMSMarineSpawnPoint) ExtraVars Other; // Dont bother if bAutoHatePlayer is True;

// Global Vars
var bool bIS; // to make sure the marine is not spawned.

//Functions
Event Trigger(Actor Other,Pawn EventInstigator)
{
    SpawnMarine();
}

Function SpawnMarine()
{
	local umsspacemarine MySelf;

	if(!bIS)
	{
		MySelf=Spawn(cMarineType,,,Self.Location,Self.Rotation);
		MySelf.WeaponType=cMarineWeaponType;
		MySelf.bBeamingIn=bBeamingIn;
		MySelf.DispPowerLevel=MarineExtras.DispPowerLevel;
		MySelf.bTeleportWhenHurt=MarineExtras.bTeleportWhenHurt;
		MySelf.bExplodeWhenHurt=MarineExtras.bExplodeWhenHurt;
		if(!bAutoHatePlayer)
		{
			MySelf.Orders=Other.Orders;
			MySelf.OrderTag=other.OrderTag;
		}
		else
		{
			MySelf.Enemy = HuntPlayer();
			MySelf.Target = HuntPlayer();
			MySelf.Orders = 'Hunting';
		}
	}
}

Function Pawn HuntPlayer()
{
	local Pawn P,EList[32];
	local byte c;

	For( P=Level.PawnList; P!=None; P=P.NextPawn )
	{
		if( P!=none && P.bIsPlayer )
		{
			EList[c] = P;
			c++;
			if( c==32 )
				Break;
		}
	}
	Return EList[Rand(c)];
}

defaultproperties
{
	bDirectional=1
	Texture=Texture'UnrealShare.S_SpawnP'
}