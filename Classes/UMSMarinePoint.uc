//=============================================================================
// UMSMarinePoint - GFour.
// Used by UMS Marine Factories for spawning Marines
//=============================================================================
class UMSMarinePoint extends SpawnPoint;

var() class<weapon> MarineWeapon;
var() enum MSkin
{
	SKIN_Default,
	SKIN_Random,
	SKIN_Space,
	SKIN_Arctic,
	SKIN_Desert,
	SKIN_Jungle
}
MarineSkin;

function bool Create()
{
	local pawn newcreature;
	local UMSMarineFactory pawnFactory;
	local actor temp, A;
	local rotator newRot;

	if ( factory.bCovert && PlayerCanSeeMe() ) //make sure no player can see this
 	return false;

	temp = Spawn(factory.prototype);

	if (temp == None)
		return false;

	newRot = rot(0,0,0);
	newRot.yaw = rotation.yaw;
	temp.SetRotation(newRot);
	temp.event = factory.tag;
	temp.tag = factory.itemtag;
	newcreature = pawn(temp);

	if( event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( Self, Instigator );
	if ( factory.bFalling )
		temp.SetPhysics(PHYS_Falling);
	if (newcreature == None)
		return true;

	pawnFactory = UMSMarineFactory(factory);
	if (pawnFactory == None)
	{
		log("Error - use marine factory to spawn marines using marinepoints!!!!!!");
		return true;
	}

   if (newcreature.IsA('umsspacemarine')&& umsspacemarine(newcreature)!=none)
    {
		if(pawnFactory.bAutoHatePlayer)
		{
			umsspacemarine(newcreature).SetEnemy(HuntPlayer());
			umsspacemarine(newcreature).Target=HuntPlayer();
			umsspacemarine(newcreature).Orders='Hunting';
			umsspacemarine(newcreature).OrderTag = 'Enemy';
		}
     if (MarineWeapon!=none)
      umsspacemarine(newcreature).weapontype = MarineWeapon;
	if(MarineSkin == SKIN_Default)
	      umsspacemarine(newcreature).MarineSkin = SKIN_Default;
	else if(MarineSkin == SKIN_Random)
      umsspacemarine(newcreature).MarineSkin = SKIN_Random;
	else if(MarineSkin == SKIN_Space)
	      umsspacemarine(newcreature).MarineSkin = SKIN_Space;
	else if(MarineSkin == SKIN_Arctic)
      umsspacemarine(newcreature).MarineSkin = SKIN_Arctic;
	else if(MarineSkin == SKIN_Desert)
	      umsspacemarine(newcreature).MarineSkin = SKIN_Desert;
	else if(MarineSkin == SKIN_Jungle)
      umsspacemarine(newcreature).MarineSkin = SKIN_Jungle;
      umsspacemarine(newcreature).SetMarineSkin();
    }
	if(!pawnFactory.bAutoHatePlayer)
	{
		if (ScriptedPawn(newcreature) != None)
			{
				ScriptedPawn(newcreature).Orders = pawnFactory.Orders;
				ScriptedPawn(newcreature).OrderTag = pawnFactory.OrderTag;
				ScriptedPawn(newcreature).SetEnemy(pawnFactory.enemy);
				ScriptedPawn(newcreature).Alarmtag = pawnFactory.AlarmTag;
			}
		else
			newcreature.enemy = pawnFactory.enemy;
	}
	if (newcreature.enemy != None)
		newcreature.lastseenpos = newcreature.enemy.location;
	newcreature.SetMovementPhysics();
	if ( newcreature.Physics == PHYS_Walking)
		newcreature.SetPhysics(PHYS_Falling);
	return true;
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
	MarineWeapon=None
	MarineSkin=SKIN_Random
}
