//=============================================================================
// UMSTeleportPoint - GFour
// TestActor
//=============================================================================
class UMSTeleportPoint extends UMSTools;

var() class <umsspacemarine> cMarine;
var() class <weapon> cMarineWeapon;

var bool bSpawned;

Function Trigger(Actor Other,Pawn EventInstigator)
{
    if(!bSpawned)
    SpawnMarine();
    else
    self.Destroy();

}

Function SpawnMarine()
{
    local SMTeleport SMEfx;
    local umsspacemarine TPMarine;

    TPMarine=Spawn(cMarine,,,Self.Location,Self.Rotation);
    if(TPmarine != None)
    {
        SMEfx=Spawn(class'SMteleport');
        TPMarine.WeaponType=cMarineWeapon;
        TPMarine.Enemy=GetPlayerPawn();
        TPMarine.Target=GetPlayerPawn();
        TPMarine.GotoState('Hunting');
    }
    else
    Log("!!!ERROR NO MARINE FOUND!!!");
}

function Pawn GetPlayerPawn() // Stolen from the MarineWaveInfo, just lets marines auto hate the player.
{
	local Pawn P,EList[32];
	local byte c;

	For( P=Level.PawnList; P!=None; P=P.NextPawn )
	{
		if( P!=none && P.bIsPlayer )// && umsspacemarine(P)==None )
		{
			EList[c] = P;
			c++;
			if( c==32 )
				Break;
		}
	}
	Return EList[Rand(c)];
}