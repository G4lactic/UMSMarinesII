//=============================================================================
// UMSMarineWaveTool - GFour
// Requires UMSMarineBeampoints to be placed.
// Beams in SpaceMarines and allows you chain waves together by setting MarineDeathEvent and using a Counter.
// Note to Mappers: I heavily reccomend keeping the ammount of Marines spawned at around 3-4.
//=============================================================================
class UMSMarineWaveTool extends UMSTools;
//=============================================================================
// Variables
var( MarineWaveSetup ) class <umsspacemarine> cMarineList[8];
var( MarineWaveSetup ) class <Weapon> cMarineWeapons[8];
var( MarineWaveSetup ) name WaveEndTag; // Once all marines are dead this tag gets triggered
var( MarineWaveSetup ) name BeampointTag;
var( MarineWaveSetup ) float BeamDelay;
var( MarineWaveSetup ) bool bUseRandomPoints;

var int TotalMarines;
var int MarinesLeft;
var int CurrentMarine;
var bool bActive;

//=============================================================================
// Functions
event Trigger(Actor Other,Pawn EventInstigator)
{
	bActive=True;
	if(BeamDelay > 0)
	SetTimer( BeamDelay, False );
	else
	{
    	if(bUseRandomPoints)
		{
			TotalMarines = CountMarines();
			RandomBeamMarineIn();
		}
    	else
		{
			TotalMarines = CountMarines();
			BeamMarineIn();
		}
	}
}

Function Timer()
{
    if(bUseRandomPoints)
	{
		TotalMarines = CountMarines();
		RandomBeamMarineIn();
	}
    else
	{
		TotalMarines = CountMarines();
		BeamMarineIn();
	}
}

Function RandomBeamMarineIn()
{
    local int i,M,W,/*Rand,*/MarineCount;
    local umsspacemarine NewMarine;
    local UMSMarineBeampoint MSP;
    local UMSMarineBeampoint UMSBP[16];

    foreach allactors (class'UMSMarineBeampoint',MSP)
    {
        if (MSP.Tag != BeampointTag) continue;
        else
		{
			if(bLogStuff)
			log("Attempting to pick point:"@MSP);
        	UMSBP[i++]=MSP;
		}
    }

    i=0;
    while(MarineCount<TotalMarines && i<1000)
    {
      i++;
      MSP=None;
      While(MSP==None && i<1000)
      {MSP=UMSBP[RandRange(0,16)]; i++;}
      if(MSP!=None)
      {
        if(cMarineList[M]==None)
        M=0;
        NewMarine = Spawn(cMarineList[M],self,,MSP.Location,MSP.Rotation);
        if(NewMarine!=None)
        {
           	MarineCount++;
        	NewMarine.WeaponType = cMarineWeapons[W++];
        	NewMarine.bBeamingIn = True;
        	//NewMarine.Event = MarineDeathEvent;
        	NewMarine.SetEnemy(GetPlayerPawn());
           	NewMarine.Target = GetPlayerPawn();
			NewMarine.Orders = 'Hunting';
			NewMarine.OrderTag = 'Enemy';
			M++;
			if(bLogStuff)
			{
				Log(" ");
				Log("[========-Starting-========]");
				log("Attempting to spawn marine:"@NewMarine);
				Log("My Weapon is:"@NewMarine.WeaponType);
				Log("My Health is:"@NewMarine.Health);
				Log("This is Marine:"@M);
				Log("This Marine is at:"@NewMarine.Location);
				Log("interger (i) is at:"@i++);
				if(!NewMarine.bIsFemale)
				Log("Gender is: Male");
				else
				Log("Gender is: Female");
				Log("[========-Finished-========]");
				Log(" ");
			}
        }
      }
	}
}

Function BeamMarineIn()
{
	local int i,M,W;//Rand;
	local umsspacemarine NewMarine;
	local UMSMarineBeampoint MSP;

	foreach allactors (class'UMSMarineBeampoint',MSP)
	{
		if (MSP.Tag != BeampointTag) continue;
		else
		{
			NewMarine = Spawn(cMarineList[M++],Self,,MSP.Location,MSP.Rotation);
			if(NewMarine!=None)
			{
				NewMarine.WeaponType = cMarineWeapons[W++];
				NewMarine.bBeamingIn = True;
				//NewMarine.Event = MarineDeathEvent;
				NewMarine.Enemy = GetPlayerPawn();
				NewMarine.Target = GetPlayerPawn();
				NewMarine.Orders = 'Hunting';
				NewMarine.OrderTag = 'Enemy';
				if(bLogStuff)
				{
					Log(" ");
					Log("[========-Starting-========]");
					log("Attempting to spawn marine:"@NewMarine);
					Log("My Weapon is:"@NewMarine.WeaponType);
					Log("My Health is:"@NewMarine.Health);
					Log("This is Marine:"@M);
					Log("This Marine is at:"@NewMarine.Location);
					Log("interger (i) is at:"@i++);
					if(!NewMarine.bIsFemale)
					Log("Gender is: Male");
					else
					Log("Gender is: Female");
					Log("[========-Finished-========]");
					Log(" ");
				}
			}
		}
	}
}

Function int CountMarines()
{
	local int i;
	
	MarinesLeft = 0;
	
	for( i = 0; i <= 8; i++ )
	{
		if( cMarineList[ i ] != none )
			MarinesLeft++;
		else 
		return MarinesLeft;
	}
	
	return MarinesLeft;
}

function SubtractMarine(UMSSpaceMarine DeadMarine)
{
	if(bActive)
	{
		TotalMarines--;
		if(bLogStuff)
		Log("Marines Left: "@TotalMarines);
		if( TotalMarines <= 0 )
		{
			if(bLogStuff)
			log( "Less than or = to 0 marines remaining." );		
			TriggerEvent(WaveEndTag);
			Destroy();
		}
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

//=============================================================================

defaultproperties
{
	Texture=Texture'Engine.S_Flag'
	DrawScale=2.5
}