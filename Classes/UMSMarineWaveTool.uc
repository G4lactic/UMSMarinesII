//=============================================================================
// UMSMarineWaveTool - GFour
// Event gets casted out once triggered.
// Requires UMSMarineBeampoints to be placed.
// When the wave starts the tag in Event is cast out.
// Beams in SpaceMarines and allows you chain waves together or cast an event by setting WaveEndTag.
// Note to Mappers: I heavily reccomend keeping the ammount of Marines spawned at around 3-4.
//=============================================================================
class UMSMarineWaveTool extends UMSTools;

//Structs
Struct MSetup
{
	var() class <umsspacemarine> MarineType;
	var() class <Weapon> WeaponType;
	var() UMSSpaceMarine.MSkin MarineSkin; // Use this if you want a specific skin. otherwise set DefaultMarineSkin.
	var() int MarineCount; //How many of this marine to spawn
};

// Variables
var( MarineWaveSetup ) array <MSetup> MarineList;
var( MarineWaveSetup ) name WaveEndEvent; // Once all marines are dead this tag gets triggered
var( MarineWaveSetup ) name BeampointTag; // Tag of the beampoint marines from this actor will get beamed to.
var( MarineWaveSetup ) name MarineTag; // Tag used for marines beamed from this specific tool.
var( MarineWaveSetup ) float BeamDelay; // how long before the beaming sequence starts.
var( MarineWaveSetup ) UMSSpaceMarine.MSkin DefaultMarineSkin; // Set to random by default. Gets overidden when you set the marine skin in MarineList.

var int TotalMarines;
var int MarinesLeft;
var int CurrentMarine;
var array <UMSSpaceMarine> WaveMarine;

// Functions
event Trigger(Actor Other,Pawn EventInstigator)
{
	TriggerEvent(Event);
	if(BeamDelay > 0)
	{	
		SetTimer( BeamDelay, False );
	}
	else
	Startup();
}

Function Timer()
{
	Startup();
}

Function HateTimer()
{
	local pawn PP;
    local int i,Failsafe;

	for(i = 0; i < array_size(MarineList); i++)
	{	while((WaveMarine[i].Enemy==None || !WaveMarine[i].Enemy.bIsPlayer) && CheckPlayers()>0 && Failsafe<100)
		{
			foreach AllActors(class'Pawn', PP)
			{
				if(Failsafe<=20 && !WaveMarine[i].CanSee(PP) && !WaveMarine[i].actorReachable(PP))
				continue; //Unless we failed to find anyone for a few times, ignore players who are not visible and unreachable

				if(PP.bIsPlayer && PP.Health>0 && !PP.bHidden && PP.Style!=STY_Translucent && !PP.IsInState('PlayerSpectating') && FRand()<(1.0/CheckPlayers()))
				{WaveMarine[i].DamageAttitudeTo(PP); WaveMarine[i].Enemy=PP; WaveMarine[i].LastSeenPos=PP.Location; WaveMarine[i].LastSeenTime=Level.TimeSeconds; WaveMarine[i].LastSeeingPos=PP.Location;}
			}
			Failsafe++;
		}
	}
}

Function Startup()
{
	TotalMarines = CountMarines();

	if(bLogStuff)
	log( "MARINES IN THIS WAVE: "$self$" are "$TotalMarines );
	BeamMarine();
	SetTimer(1, True, 'HateTimer'); // Remember to go kill the player(s)
}

Function BeamMarine()
{
    local int i,M,MarineCount;
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
        if(MarineList[M].MarineType==None)
        M=0;
		while(MarineList[M].MarineCount>0)
		{
        	NewMarine = Spawn(MarineList[M].MarineType,self,,MSP.Location,MSP.Rotation);
        	if(NewMarine!=None)
        	{
				WaveMarine[MarineCount]=NewMarine;
        	   	MarineCount++;
				MarineList[M].MarineCount--;
        		NewMarine.WeaponType = MarineList[M].WeaponType;
        		NewMarine.bBeamingIn = True;
				NewMarine.MarineSkin = MarineList[M].MarineSkin;
				if(NewMarine.MarineSkin == SKIN_Default)
				NewMarine.MarineSkin = DefaultMarineSkin;
				NewMarine.SetMarineSkin();
				NewMarine.Tag = MarineTag;
				if(bLogStuff)
				log("Skin:"@NewMarine.LogSkinName@"on marine"@M);
        	}
		}
		M++;
      }
	}
}

Function int CountMarines()
{
	local int i;
	
	MarinesLeft = 0;
	
	for( i = 0; i <= array_size(MarineList); i++ )
	{
		if( MarineList[ i ].MarineType != none )
		{
			if(MarineList[i].MarineCount<=0)
			MarineList[i].MarineCount=1;
			MarinesLeft+=MarineList[i].MarineCount;
		}
		else 
		return MarinesLeft;
	}
	
	return MarinesLeft;
}

function SubtractMarine(UMSSpaceMarine DeadMarine)
{
	TotalMarines--;
	if(bLogStuff)
	Log("Marines Left: "@TotalMarines);
	if( TotalMarines <= 0 )
	{
		if(bLogStuff)
		log( "Less than or = to 0 marines remaining." );		
		TriggerEvent(WaveEndEvent);
		Destroy();
	}
}

function int CheckPlayers()
{
    local PlayerReplicationInfo PRI;
    local int PlayerCount;

    foreach AllActors(class'PlayerReplicationInfo', PRI)
    {
        if(Pawn(PRI.Owner).bIsPlayer && Pawn(PRI.Owner).Health>0 && !PRI.bIsSpectator)
        PlayerCount++;
    }
    return PlayerCount;
}

defaultproperties
{
	Texture=Texture'Engine.S_Flag'
	MarineTag="WaveMarine"
	DrawScale=2.0
	ActorRenderColor=(R=255,G=128,B=64)
	DefaultMarineSkin=SKIN_Random
}