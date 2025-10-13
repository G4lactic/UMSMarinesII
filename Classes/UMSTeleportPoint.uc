//=============================================================================
// UMSTeleportPoint - GFour
// TestActor
//=============================================================================
class UMSTeleportPoint extends UMSTools;

var() class <umsspacemarine> cMarine;
Var() Class <Weapon> cWeaponType;
var() bool bTriggerOnceOnly;
var() float TPDelay;

var bool bSpawned;
var SMTeleport SMEfx;
var umsspacemarine TPMarine;

Function Trigger(Actor Other,Pawn EventInstigator)
{
    if(!bSpawned)
    SpawnMarine();
    else
    self.Destroy();

}

Function SpawnMarine()
{
    if(TPDelay <= 0)
    TPMarine=Spawn(cMarine,,,Self.Location,Self.Rotation);
    if(TPMarine != None)
    {
        TPMarine.WeaponType = cWeaponType;
        SMEfx=Spawn(class'SMteleport',,,TPMarine.Location,);
        TPMarine.Enemy=GetPlayerPawn();
        TPMarine.Target=GetPlayerPawn();
        TPMarine.Orders = 'Hunting';
        PlaySound(sound'MarineTP');
        if(bTriggerOnceOnly)
        bSpawned=True;
    }
    else if(TPDelay > 0)
    SetTimer(TPDelay,False);

    Log("!!!ERROR NO MARINE FOUND!!!");
}

Function Timer()
{
    TPMarine=Spawn(cMarine,,,Self.Location,Self.Rotation);
    if(TPMarine != None)
    {
        TPMarine.WeaponType = cWeaponType;
        SMEfx=Spawn(class'SMteleport',,,TPMarine.Location,);
        TPMarine.Enemy=GetPlayerPawn();
        TPMarine.Target=GetPlayerPawn();
        TPMarine.Orders = 'Hunting';
        PlaySound(sound'MarineTP');
        if(bTriggerOnceOnly)
        bSpawned=True;
    }
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