//=============================================================================
// UMSMarineWaveTool - GFour
// Requires UMSMarineWavepoints to be placed.
// Spawns or Beams in SpaceMarines and allows you chain waves together by setting MarineDeathEvent and using a Counter.
// Note to Mappers: I heavily reccomend keeping the ammount of Marines spawned at around 3-4.
//=============================================================================
class UMSMarineWaveTool extends UMSTools;

//Structs
Struct RandomVars
{
	var() int MaxRandomMarines;
	var() bool bUseRandomPoints;
};

Struct BeamOption
{
	var() bool bBeamingIn;
	var() float BeamDelay;
};

//=============================================================================
// Variables

var( MarineWaveSetup ) class <umsspacemarine> cMarineList[8];
var( MarineWaveSetup ) class <Weapon> cMarineWeapons[8];
var( MarineWaveSetup ) name MarineDeathEvent; // Main use is for counters to start the next wave.
var( MarineWaveSetup ) name WavepointTag;
var( MarineWaveSetup ) RandomVars RandomSpawning;
var( MarineWaveSetup ) BeamOption Beaming;
//var( MarineWaveSetup ) bool bUseRandomPoints; // Picks random beam points with the same tags as nBeampointTag.
//var( MarineWaveSetup ) int iMaxRandomMarines;

//var(DEBUGGING) bool bLogStuff;

//=============================================================================
// Functions

event Trigger(Actor Other,Pawn EventInstigator)
{
	if(Beaming.bBeamingIn && Beaming.BeamDelay > 0)
	SetTimer( Beaming.BeamDelay, False );
	else
	{
    	if(RandomSpawning.bUseRandomPoints)
    	RandomSpawnMarine();
    	else if (Beaming.bBeamingIn)
		BeamMarineIn();
    	else if (Beaming.bBeamingIn && RandomSpawning.bUseRandomPoints)
		RandomBeamMarineIn();
		else
    	SpawnMarine();
	}
}

Function Timer()
{
	if (Beaming.bBeamingIn && RandomSpawning.bUseRandomPoints)
    RandomBeamMarineIn();
    else if (Beaming.bBeamingIn)
    BeamMarineIn();
}

Function BeamMarineIn()
{
	local int i,M,W;//Rand;
	local umsspacemarine NewMarine;
	local UMSMarineWavepoint MSP;

	foreach allactors (class'UMSMarineWavepoint',MSP)
	{
		if (MSP.Tag != WavepointTag) continue;
		else
		{
			NewMarine = Spawn(cMarineList[M++],,,MSP.Location,MSP.Rotation);
			if(NewMarine!=None)
			{
				NewMarine.WeaponType = cMarineWeapons[W++];
				NewMarine.bBeamingIn = True;
				NewMarine.Event = MarineDeathEvent;
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

Function RandomBeamMarineIn()
{
    local int i,M,W,/*Rand,*/MarineCount;
    local umsspacemarine NewMarine;
    local UMSMarineWavepoint MSP;
    local UMSMarineWavepoint UMSBP[16];

    foreach allactors (class'UMSMarineWavepoint',MSP)
    {
        if (MSP.Tag != WavepointTag) continue;
        else
		{
			if(bLogStuff)
			log("Attempting to pick point:"@MSP);
        	UMSBP[i++]=MSP;
		}
    }

    i=0;
    while(MarineCount<RandomSpawning.MaxRandomMarines && i<1000)
    {
      i++;
      MSP=None;
      While(MSP==None && i<1000)
      {MSP=UMSBP[RandRange(0,16)]; i++;}
      if(MSP!=None)
      {
        if(cMarineList[M]==None)
        M=0;
        NewMarine = Spawn(cMarineList[M],,,MSP.Location,MSP.Rotation);
        if(NewMarine!=None)
        {
           	MarineCount++;
        	NewMarine.WeaponType = cMarineWeapons[W++];
        	NewMarine.bBeamingIn = True;
        	NewMarine.Event = MarineDeathEvent;
        	NewMarine.Enemy = GetPlayerPawn();
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

Function SpawnMarine()
{
	local int i,M,W;//Rand;
	local umsspacemarine NewMarine;
	local UMSMarineWavepoint MSP;

	foreach allactors (class'UMSMarineWavepoint',MSP)
	{
		if (MSP.Tag != WavepointTag) continue;
		else
		{
			NewMarine = Spawn(cMarineList[M++],,,MSP.Location,MSP.Rotation);
			if(NewMarine!=None)
			{
				NewMarine.WeaponType = cMarineWeapons[W++];
				NewMarine.Event = MarineDeathEvent;
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

Function RandomSpawnMarine()
{
    local int i,M,W,/*Rand,*/MarineCount;
    local umsspacemarine NewMarine;
    local UMSMarineWavepoint MSP;
    local UMSMarineWavepoint UMSBP[16];

    foreach allactors (class'UMSMarineWavepoint',MSP)
    {
        if (MSP.Tag != WavepointTag) continue;
        else
		{
			if(bLogStuff)
			log("Attempting to pick point:"@MSP);
        	UMSBP[i++]=MSP;
		}
    }

    i=0;
    while(MarineCount<RandomSpawning.MaxRandomMarines && i<1000)
    {
      i++;
      MSP=None;
      While(MSP==None && i<1000)
      {MSP=UMSBP[RandRange(0,16)]; i++;}
      if(MSP!=None)
      {
        if(cMarineList[M]==None)
        M=0;
        NewMarine = Spawn(cMarineList[M],,,MSP.Location,MSP.Rotation);
        if(NewMarine!=None)
        {
           	MarineCount++;
        	NewMarine.WeaponType = cMarineWeapons[W++];
        	NewMarine.Event = MarineDeathEvent;
        	NewMarine.Enemy = GetPlayerPawn();
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