//=============================================================================
// UMSMarineWaveTool - GFour
// Requires UMSMarineBeampoints to be placed.
// When the wave starts the tag in Event is cast out.
// Beams in SpaceMarines and allows you chain waves together or cast an event by setting WaveEndTag.
// Note to Mappers: I heavily reccomend keeping the ammount of Marines spawned at around 3-4.
//=============================================================================
class UMSMarineWaveTool extends Triggers;

//Structs
Struct MSetup
{
	var() class <umsspacemarine> MarineType;
	var() class <Weapon> WeaponType;
	var() UMSSpaceMarine.MSkin MarineSkin; // Use this if you want a specific skin. otherwise set DefaultMarineSkin.
};

// Variables
var( MarineWaveSetup ) array <MSetup> MarineList;
var( MarineWaveSetup ) name WaveEndTag; // Once all marines are dead this tag gets triggered
var( MarineWaveSetup ) name BeampointTag;
var( MarineWaveSetup ) float BeamDelay;
var( MarineWaveSetup ) UMSSpaceMarine.MSkin DefaultMarineSkin; // Set to random by default. Gets overidden when you set the marine skin in MarineList.
var( Misc ) bool bLogStuff;

var int TotalMarines;
var int MarinesLeft;
var int CurrentMarine;
var bool bActive;

// Functions
event Trigger(Actor Other,Pawn EventInstigator)
{
	bActive=True;
	if(BeamDelay > 0)
	SetTimer( BeamDelay, False );
	else
	{
		TotalMarines = CountMarines();
		if(bLogStuff)
		log( "MARINES IN THIS WAVE: "$self$" are "$TotalMarines );
		BeamMarine();
		TriggerEvent(Event);
	}
}

Function Timer()
{
	TotalMarines = CountMarines();
	if(bLogStuff)
	log( "MARINES IN THIS WAVE: "$self$" are "$TotalMarines );
	BeamMarine();
	TriggerEvent(Event);
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
        NewMarine = Spawn(MarineList[M].MarineType,self,,MSP.Location,MSP.Rotation);
        if(NewMarine!=None)
        {
           	MarineCount++;
        	NewMarine.WeaponType = MarineList[M].WeaponType;
        	NewMarine.bBeamingIn = True;
			NewMarine.MarineSkin = MarineList[M].MarineSkin;
			if(NewMarine.MarineSkin == SKIN_Default)
			NewMarine.MarineSkin = DefaultMarineSkin;
        	NewMarine.SetEnemy(GetPlayerPawn());
           	NewMarine.Target = GetPlayerPawn();
			NewMarine.Orders = 'Hunting';
			NewMarine.OrderTag = 'Enemy';
			NewMarine.SetMarineSkin();
			if(bLogStuff)
			log("Skin:"@NewMarine.LogSkinName@"on marine"@M);
			M++;
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
		if( MarineList[ i ].MarineType != none )
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
	Texture=Texture'Engine.S_Flag'
	DrawScale=2.5
	ActorRenderColor=(R=255,G=128,B=64)
	DefaultMarineSkin=SKIN_Random
}