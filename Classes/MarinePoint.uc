//=============================================================================
// MarinePoint.
// Used by Marine Factories for spawning Marines
// OBSOLETE!: Phasing this out once the UMSMarineSpawnpoint is fully complete.
//=============================================================================
class MarinePoint extends SpawnPoint;


var() class<weapon>  MarineWeapon;
var() bool	bTeleportWhenHurt;
var() bool bExplodeWhenHurt;
var() bool bBeamingIn; // Note: Speed of beaming in on difficulty 3 or higher is faster.

function bool Create()
{
	local pawn newcreature;
	local marineFactory pawnFactory;
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

	pawnFactory = marineFactory(factory);
	if (pawnFactory == None)
	{
		log("Error - use marine factory to spawn marines using marinepoints!!!!!!");
		return true;
	}

   if (newcreature.IsA('umsspacemarine')&& umsspacemarine(newcreature)!=none)
    {
     if( bTeleportWhenHurt)
       bExplodeWhenHurt=false;
     umsspacemarine(newcreature).bTeleportWhenHurt=bTeleportWhenHurt;
     umsspacemarine(newcreature).bExplodeWhenHurt=bExplodeWhenHurt;
     if (MarineWeapon!=none)
      umsspacemarine(newcreature).weapontype = MarineWeapon;
      umsspacemarine(newcreature).bBeamingIn = bBeamingIn;
    }

   if (ScriptedPawn(newcreature) != None)
 	{
		ScriptedPawn(newcreature).Orders = pawnFactory.Orders;
		ScriptedPawn(newcreature).OrderTag = pawnFactory.OrderTag;
		ScriptedPawn(newcreature).SetEnemy(pawnFactory.enemy);
		ScriptedPawn(newcreature).Alarmtag = pawnFactory.AlarmTag;
	}
	else
		newcreature.enemy = pawnFactory.enemy;
	if (newcreature.enemy != None)
		newcreature.lastseenpos = newcreature.enemy.location;
	newcreature.SetMovementPhysics();
	if ( newcreature.Physics == PHYS_Walking)
		newcreature.SetPhysics(PHYS_Falling);
	return true;
}

defaultproperties
{
	MarineWeapon=None
	bTeleportWhenHurt=False
	bExplodeWhenHurt=False
	bBeamingIn=False
}
