//=============================================================================
//  UMSMarineSpawnpoint -- GFour.
//  Useful for ambushes or spawning new marines in the level.
//  NOTE: Not used for making waves of marines to beam in use the UMSMarineWaveTool
//=============================================================================
class UMSMarineSpawnpoint extends UMSTools;

//=============================================================================
// Structs

struct ExtraVars
{
	Var() Name nMarineTag;
	Var() Name nMarineDeathEvent;
	Var() name nOrders;
	Var() name nOrderTag;
};

//=============================================================================
// Variables

Var() Class <umsspacemarine> cMarine;
Var() Class <Weapon> cWeaponType;
//Var() bool bRappeling; // Not Finished!!!
Var() bool bBeamingIn;
Var() bool bTeleportWhenHurt;
Var() bool bExplodeWhenHurt;
Var() bool bAutoHatePlayer;
Var() int DispPowerLevel; // For dispersion pistol level.
Var() ExtraVars Extra;
Var bool HasSpawned; // For some reason i cant use the destroy function so this will have to do :/
Var umsspacemarine NewMarine;

//=============================================================================
// Functions

Event Trigger(Actor Other,Pawn EventInstigator)
{
    SpawnMarine();
}

Function SpawnMarine()
{
	//local actor A;

	if(!HasSpawned){
    NewMarine = Spawn(cMarine,,,Self.Location,Self.Rotation);
    NewMarine.WeaponType = cWeaponType;
    NewMarine.bTeleportWhenHurt = bTeleportWhenHurt;
    NewMarine.bExplodeWhenHurt = bExplodeWhenHurt;
	NewMarine.Orders = Extra.nOrders;
	NewMarine.OrderTag = Extra.nOrderTag;
	NewMarine.DispPowerLevel = DispPowerLevel;
   // NewMarine.bRappeling = bRappeling;
    NewMarine.Tag = Extra.nMarineTag;
    NewMarine.Event = Extra.nMarineDeathEvent;
	NewMarine.bBeamingIn = bBeamingIn;

	if(bAutoHatePlayer)
	{
		NewMarine.Enemy = GetPlayerPawn();
		NewMarine.Target = GetPlayerPawn();
		NewMarine.Orders = 'Hunting';
	}

	HasSpawned=True;}
}

Function Pawn GetPlayerPawn()
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

//=============================================================================

defaultproperties
{
	bDirectional=1
	DispPowerLevel=1
	Texture=Texture'UnrealShare.S_SpawnP'
}