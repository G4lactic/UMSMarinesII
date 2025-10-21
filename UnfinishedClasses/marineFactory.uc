//=============================================================================
// marineFactory.
// OBSOLETE!: Phasing this out once the UMSMarineSpawnpoint is fully complete.
//=============================================================================
class marineFactory extends CreatureFactory;

var marinepoint spawnspots[16]; //possible start locations

function PostBeginPlay()
{
	local marinepoint newspot;
	
//	Super.PostBeginPlay();
	numspots = 0;
	numitems = 0;
	foreach AllActors( class 'marinepoint', newspot, tag )
	{
		if (numspots < 16)
		{
			spawnspots[numspots] = newspot;
			newspot.factory = self;
			numspots += 1;
		}
	}
	if (itemtag == '')
		itemtag = 'MadeInAustralia';

	if ( (Level.Game != None) && Level.Game.IsA('CoopGame') )
		capacity += AddedCoopCapacity;
}	

Auto State Waiting
{
	function Trigger( actor Other, pawn EventInstigator )
	{
		local Actor A;

		if ( Event != '' )
			ForEach AllActors( class 'Actor', A, Event)
				A.Trigger(self, EventInstigator);
		GotoState('Spawning');
	}
		
	function Touch(Actor Other)
	{
		local pawn otherpawn;
	
		otherpawn = Pawn(Other);
		if ( (otherpawn != None) && (!bOnlyPlayerTouched || otherpawn.bIsPlayer) )
			Trigger(other, otherPawn);
	}
}

State Spawning
{
	function UnTouch(Actor Other)
	{
		local int i;
		if (bStoppable)
		{
			//check if some other pawn still touching
			for (i=0;i<4;i++)
				if ( (pawn(Touching[i]) != None) && (!bOnlyPlayerTouched || pawn(Touching[i]).bIsPlayer) )
					return;
			GotoState('Waiting');
		}
	}

	function Trigger(actor Other, pawn EventInstigator)
	{
		//only if Other is from this factory
		if ( Other.class != prototype )
			return;
			
		numitems--;
		if (numitems < maxitems)
			StartBuilding();
	}

	function bool trySpawn(int start, int end)
	{
		local int i;
		local bool done;

		done = false;
		i = start;
		while (i < end)
		{
			if (spawnspots[i].Create())
			{
				done = true;
				i = end;
				capacity--;
				numitems++;
				if (capacity == 0)
					GotoState('Finished');
			}
			i++;
		}
		
		return done;
	}
		
	function Timer()
	{
		local int start;
		
		if (numitems < maxitems)
		{
			//pick a spawn point
			start = Rand(numspots);
			if ( !trySpawn(start, numspots) )
				trySpawn(0, start);
		}
			
		if (numitems < maxitems)
			StartBuilding();
	}

	Function StartBuilding()
	{
		local float nextTime;
		if (timeDistribution == DIST_Constant)
			nextTime = interval;
		else if (timeDistribution == DIST_Uniform)
			nextTime = 2 * FRand() * interval;
		else //timeDistribution is gaussian
			nextTime = 0.5 * (FRand() + FRand() + FRand() + FRand()) * interval;
			
		if (capacity > 0)
			SetTimer(nextTime, false);
	}

	function BeginState()
	{
		if ( !bStoppable )
			Disable('UnTouch');
	}

}

state Finished
{
}  
							

defaultproperties
{
	spawnspots(0)=None
	spawnspots(1)=None
	spawnspots(2)=None
	spawnspots(3)=None
	spawnspots(4)=None
	spawnspots(5)=None
	spawnspots(6)=None
	spawnspots(7)=None
	spawnspots(8)=None
	spawnspots(9)=None
	spawnspots(10)=None
	spawnspots(11)=None
	spawnspots(12)=None
	spawnspots(13)=None
	spawnspots(14)=None
	spawnspots(15)=None
}
