//=============================================================================
// UMSsp  -- Asgard
//   Source code rights:
//   Copyright 2005 Asgard. All right reserved.
//   asgard15000@iprimus.com.au
//   http://www.angelfire.com/empire/napali/
//
// Fixes and additions by GFour.
//=============================================================================
class UMSSM extends ScriptedPawn
	abstract;

function PreBeginPlay()
{
    local int newskill;

    super(Pawn).PreBeginPlay();

	if ( Level.Game.bVeryLowGore )
		bGreenBlood = true;

	if ( Skill > 2 )
		bLeadTarget = true;
	else if ( (Skill == 0) && (Health < 500) )
	{
		bLeadTarget = false;
		ReFireRate = 0.75 * ReFireRate;
	}

	if ( bIsBoss )
		Health = Health + 0.15 * Skill * Health;

	bInitialFear = (AttitudeToPlayer == ATTITUDE_Fear);

    if(Level.Game.difficulty > 3)
    {
      newskill = FClamp(Level.Game.difficulty-3, 1, 3);

      if (health > 9 ) // give weaker pawns a small boost
        health += (100 *newskill) / health;
      health *= 1+(0.15*newskill);
      SightRadius+= 100*newskill;
      projectileSpeed += 100*newskill;
      RotationRate.Yaw *= 1+(0.15*newskill);
      AccelRate += 100*newskill;
      groundspeed += 10*newskill;
      waterspeed += 10*newskill;
      airspeed += 10*newskill;
      DamageScaling=default.DamageScaling+(0.5*newskill);
    }
}

simulated event Destroyed()
{
	local Inventory Inv;
	local Pawn OtherPawn;

	if ( Role < ROLE_Authority )
		return;

	RemovePawn();

	for( Inv=Inventory; Inv!=None; Inv=Inv.Inventory )
		Inv.Destroy();
	Weapon = None;
	Inventory = None;
	if ( bIsPlayer && (Level.Game != None) )
		Level.Game.logout(self);
	if ( PlayerReplicationInfo != None )
		PlayerReplicationInfo.Destroy();
	for ( OtherPawn=Level.PawnList; OtherPawn!=None; OtherPawn=OtherPawn.nextPawn )
		OtherPawn.Killed(None, self, '');
	super(actor).Destroyed();
}

function JumpOffPawn()
{
	Velocity += (60 + CollisionRadius) * VRand();
	Velocity.Z = 180 + CollisionHeight;
	SetPhysics(PHYS_Falling);
	bJumpOffPawn = true;
    if (health > 0 && !bDeleteme)
 	 SetFall();
}

singular function Falling()
{
	if (bCanFly)
	{
		SetPhysics(PHYS_Flying);
		return;
	}
	//log(class$" Falling");
	// SetPhysics(PHYS_Falling); //note - done by default in physics
 	if (health > 0 && !bDeleteme)
		SetFall();
}

function LongFall()
{
   if (health > 0 && !bDeleteme)
   {
	SetFall();
	GotoState('FallingState', 'LongFall');
   }
}

function Bump(actor Other)
{
	local vector VelDir, OtherDir;
	local float speed;

	if ( Health <= 0 || bDeleteme)
		return;
	if ( Enemy != None )
	{
		if (Other == Enemy)
		{
			GotoState('MeleeAttack');
			return;
		}
		else if ( (Pawn(Other) != None) && SetEnemy(Pawn(Other)) )
		{
			GotoState('MeleeAttack');
			return;
		}
	}
	else
	{
		if (Pawn(Other) != None)
		{
			AnnoyedBy(Pawn(Other));
			if ( SetEnemy(Pawn(Other)) )
			{
				bReadyToAttack = True; //can melee right away
				PlayAcquisitionSound();
				GotoState('Attacking');
				return;
			}
		}
		if ( TimerRate <= 0 )
			setTimer(1.0, false);
		if ( bCanSpeak && (ScriptedPawn(Other) != None) && ((TeamLeader == None) || !TeamLeader.bTeamSpeaking) )
			SpeakTo(ScriptedPawn(Other));
	}

	speed = VSize(Velocity);
	if ( speed > 1 )
	{
		VelDir = Velocity/speed;
		VelDir.Z = 0;
		OtherDir = Other.Location - Location;
		OtherDir.Z = 0;
		OtherDir = Normal(OtherDir);
		if ( (VelDir dot OtherDir) > 0.8 )
		{
			/*if ( Pawn(Other) == None )
			{
				MoveTimer = -1.0;
				HitWall(-1 * OtherDir, Other);
			} */
			Velocity.X = VelDir.Y;
			Velocity.Y = -1 * VelDir.X;
			Velocity *= FMax(speed, 280);
		}
	}
	Disable('Bump');
}

singular event BaseChange()
{
	local float decorMass;

    if(bDeleteme)
       return;
	if ( (base == None) && (Physics == PHYS_None) )
		SetPhysics(PHYS_Falling);
	else if (Pawn(Base) != None)
	{
	    if(!Pawn(Base).bDeleteme && Pawn(base).Health > 0)
		Pawn(Base).TakeDamage( (1-Velocity.Z/400)* Mass/Base.Mass, Self,Location,0.5 * Velocity , 'stomped');
		JumpOffPawn();
	}
	else if ( Decoration(Base) != None && !Decoration(Base).bStatic)
    {
     if (  Velocity.Z < -400 || (mass> 200 && Physics != PHYS_None && Decoration(Base).bPushable) )
      {
		decorMass = FMax(Decoration(Base).Mass, 1);
		if(!Decoration(Base).bDeleteme)
		Decoration(Base).TakeDamage((-2* Mass/decorMass * Velocity.Z/400), Self, Location, 0.5 * Velocity, 'stomped');
      }
   }
}

function AddVelocity( vector NewVelocity)
{
    if(Health <=0 || bDeleteme)
    {
     Disable('Hitwall');
     Disable('Bump');
    }
	if (Physics == PHYS_Walking)
		SetPhysics(PHYS_Falling);
	if ( (Velocity.Z > 380) && (NewVelocity.Z > 0) )
		NewVelocity.Z *= 0.5;
	Velocity += NewVelocity;
}

event FootZoneChange(ZoneInfo newFootZone)
{
	local actor HitActor;
	local vector HitNormal, HitLocation;
	local float splashSize;
	local actor splash;

	if ( Level.NetMode == NM_Client )
		return;
	if ( Level.TimeSeconds - SplashTime > 0.25 )
	{
		SplashTime = Level.TimeSeconds;
		if (Physics == PHYS_Falling)
			MakeNoise(1.0);
		else
			MakeNoise(0.3);
		if ( FootRegion.Zone.bWaterZone )
		{
			if ( !newFootZone.bWaterZone && (Role==ROLE_Authority) )
			{
				if ( FootRegion.Zone.ExitSound != None )
					PlaySound(FootRegion.Zone.ExitSound, SLOT_Interact, 1);
				if ( FootRegion.Zone.ExitActor != None )
					Spawn(FootRegion.Zone.ExitActor,,,Location - CollisionHeight * vect(0,0,1));
			}
		}
		else if ( newFootZone.bWaterZone && (Role==ROLE_Authority) )
		{
			splashSize = FClamp(0.000025 * Mass * (300 - 0.5 * FMax(-500, Velocity.Z)), 1.0, 4.0 );
			if ( newFootZone.EntrySound != None )
			{
				HitActor = Trace(HitLocation, HitNormal,
						Location - (CollisionHeight + 40) * vect(0,0,0.8), Location - CollisionHeight * vect(0,0,0.8), false);
				if ( HitActor == None )
					PlaySound(newFootZone.EntrySound, SLOT_Misc, 2 * splashSize);
				else
					PlaySound(WaterStep, SLOT_Misc, 1.5 + 0.5 * splashSize);
			}
			if( newFootZone.EntryActor != None )
			{
				splash = Spawn(newFootZone.EntryActor,,,Location - CollisionHeight * vect(0,0,1));
				if ( splash != None )
					splash.DrawScale = splashSize;
			}
			//log("Feet entering water");
		}
	}

	if (FootRegion.Zone.bPainZone)
	{
		if ( !newFootZone.bPainZone && !HeadRegion.Zone.bWaterZone )
			PainTime = -1.0;
	}
	else if (newFootZone.bPainZone)
    {
      if ( (ReducedDamageType == 'All') ||
		((ReducedDamageType != '') && (ReducedDamageType == newFootZone.damageType)
         && ReducedDamagePct > 0 ) )
		PainTime = -1.0;
      else
		PainTime = 0.01;
    }
}

function SetFall()
{
	if (Enemy != None)
	{
		NextState = 'Attacking'; //default
		NextLabel = 'Begin';
        NextAnim = AnimSequence;
		GotoState('FallingState');
	}
}

singular function SpawnGibbedCarcass()
{
	local carcass carc;

	carc = Spawn(CarcassType);
	if ( carc != None )
	{
		carc.Initfor(self);
		carc.ChunkUp(-1 * Health);
	}
}

singular function Carcass SpawnCarcass()
{
	local carcass carc;

	carc = Spawn(CarcassType);
	if ( carc != None )
		carc.Initfor(self);

	return carc;
}

function gibbedBy(actor Other)
{
	local pawn instigatedBy;

	if ( Role < ROLE_Authority )
		return;
	instigatedBy = pawn(Other);
	if (instigatedBy == None)
		instigatedBy = Other.instigator;
	health = -1000; //make sure gibs
	Died(instigatedBy, 'Gibbed', Location);
}

function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
{
 if(bDeleteme)
    return;
 if ( Role == ROLE_Authority )
	super.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
}

function eAttitude AttitudeTo(Pawn Other)
{
	if (Other.bIsPlayer && Other!=none && !Other.IsA('ScriptedPawn'))
	{
		if (bIsPlayer && Level.Game.IsA('TeamGame') && (Other.PlayerReplicationInfo != none) && (Team == Other.PlayerReplicationInfo.Team) )
			return ATTITUDE_Friendly;
		else if ( (Intelligence > BRAINS_None) &&
			((AttitudeToPlayer == ATTITUDE_Hate) || (AttitudeToPlayer == ATTITUDE_Threaten)
				|| (AttitudeToPlayer == ATTITUDE_Fear)) ) //check if afraid
		{
			if (RelativeStrength(Other) > Aggressiveness)
				AttitudeToPlayer = AttitudeWithFear();
            else if (AttitudeToPlayer == ATTITUDE_Fear)
                AttitudeToPlayer = ATTITUDE_Hate;
		}
		return AttitudeToPlayer;
	}
	if (Hated == Other && Other!=none)
	{
		if (RelativeStrength(Other) >= Aggressiveness)
			return AttitudeWithFear();
		else
			return ATTITUDE_Hate;
	}
    else if (Other.IsA('ScriptedPawn') && Other!=none )
	{
	 if ( (TeamTag != '') && (TeamTag == ScriptedPawn(Other).TeamTag) )
		return ATTITUDE_Friendly;
	 else if ( bIsPlayer && Level.Game.IsA('TeamGame') )
     {
       if(ScriptedPawn(Other).Team == Team )
			return ATTITUDE_Friendly;
       else
       {
		 if (RelativeStrength(Other) >= Aggressiveness)
			 return AttitudeWithFear();
		 else
		     return ATTITUDE_Hate;
       }
    }
	else
		return AttitudeToCreature(Other);
    }
    else
      return ATTITUDE_Ignore;
}

function Killed(pawn Killer, pawn Other, name damageType)
{
	local Pawn aPawn;
	local ScriptedPawn ScriptedOther;
	local bool bFoundTeam;

	if ( Health <= 0 || bDeleteme )
		return;
	if (Other.bIsPlayer)
		bCanBePissed = true;

	ScriptedOther = ScriptedPawn(Other);
	if ( (TeamTag != '') && (ScriptedOther != None)
		&& (ScriptedOther.TeamTag == TeamTag) )
	{
		if ( ScriptedOther.bTeamLeader )
			TeamTag = '';
		else if ( ScriptedOther.TeamID < TeamID )
			TeamID--;
		else if ( bTeamLeader )
		{
			aPawn = Level.PawnList;
			while ( aPawn != None )
			{
				if ( (ScriptedPawn(aPawn) != None) && (ScriptedPawn(aPawn) != self) &&
					(ScriptedPawn(aPawn).TeamTag == TeamTag) )
				{
					bFoundTeam = true;
					break;
				}
				aPawn = aPawn.nextPawn;
			}
			if ( !bFoundTeam )
			{
				bTeamLeader = false;
				TeamTag = '';
			}
		}
	}

	if ( OldEnemy == Other )
		OldEnemy = None;

	if ( Enemy == Other )
	{
		Enemy = None;
		if ( (Killer != none) && (Killer == self) && (OldEnemy == None) )
		{
         for (aPawn=level.pawnlist;aPawn!=none;aPawn=aPawn.nextpawn)
		 {
   	      if (( aPawn.bCollideActors  && ( !aPawn.IsA('FlockPawn') ))
            && (VSize(Location - aPawn.Location) < 1000) && CanSee(aPawn) )
				{
					if ( SetEnemy(aPawn) )
					{
						GotoState('Attacking');
						return;
					}
				}
		 }
			Target = Other;
			GotoState('VictoryDance');
		}
		else
			GotoState('Attacking');
	}
}

function Trigger( actor Other, pawn EventInstigator )
{
	local Pawn currentEnemy;

	if ( (Other == Self) || (Health <= 0) || (bDeleteme) )
		return;
	if ( bHateWhenTriggered )
	{
		if ( EventInstigator.bIsPlayer)
			AttitudeToPlayer = ATTITUDE_Hate;
		else
			Hated = EventInstigator;
	}
	currentEnemy = Enemy;
	SetEnemy(EventInstigator);
	if (Enemy != currentEnemy)
	{
		PlayAcquisitionSound();
		GotoState('Attacking');
	}
}

function rotator AdjustAim(float projSpeed, vector projStart, int aimerror, bool leadTarget, bool warnTarget)
{
	local rotator FireRotation;
	local vector FireSpot;
	local actor HitActor;
	local vector HitLocation, HitNormal;
    local int modifier;

	if ( Target == None )
	  {
	   if ( enemy != none && enemy.health >0  && !enemy.bDeleteme && enemy!=self )
		Target = Enemy;
      }
	if ( Target == None)
		return Rotation;
	if ( !Target.IsA('Pawn') )
		return rotator(Target.Location - Location);

	FireSpot = Target.Location;

	aimerror = aimerror * (1 - 10 *
		((Normal(Target.Location - Location)
			Dot Normal((Target.Location + 0.5 * Target.Velocity) - (Location + 0.5 * Velocity))) - 1));

	aimerror = aimerror * (2.4 - 0.5 * (skill + FRand()));
    modifier = FClamp(Level.Game.difficulty-3, 1, 3);
    if(Level.Game.difficulty > 3)
      aimerror *= 1-(0.3*modifier);

	if (leadTarget && (projSpeed > 0))
	{
		FireSpot += FMin(1, 0.7 + 0.6 * FRand()) * (Target.Velocity * VSize(Target.Location - ProjStart)/projSpeed);
		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
		if (HitActor != None)
			FireSpot = 0.5 * (FireSpot + Target.Location);
	}

	HitActor = self; //so will fail first check unless shooting at feet
	if ( bIsPlayer && (Location.Z + 19 >= Target.Location.Z) && Target.IsA('Pawn')
		&& (Weapon != None) && Weapon.bSplashDamage && (0.5 * (skill - 1) > FRand()) )
	{
		// Try to aim at feet
 		HitActor = Trace(HitLocation, HitNormal, FireSpot - vect(0,0,80), FireSpot, false);
		if ( HitActor != None )
		{
			FireSpot = HitLocation + vect(0,0,3);
			HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
		}
		else
			HitActor = self;
	}
	if ( HitActor != None )
	{
		//try middle
		FireSpot.Z = Target.Location.Z;
 		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
	}
	if( HitActor != None )
	{
		////try head
 		FireSpot.Z = Target.Location.Z + 0.9 * Target.CollisionHeight;
 		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
	}
	if ( (HitActor != None) && (Target == Enemy) )
	{
		FireSpot = LastSeenPos;
		if ( Location.Z >= LastSeenPos.Z )
			FireSpot.Z -= 0.5 * Enemy.CollisionHeight;
		if ( Weapon != None )
		{
	 		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
			if ( HitActor != None )
			{
				bFire = 0;
				bAltFire = 0;
				SetTimer(TimeBetweenAttacks, false);
			}
		}
	}

	FireRotation = Rotator(FireSpot - ProjStart);

	FireRotation.Yaw = FireRotation.Yaw + 0.5 * (Rand(2 * aimerror) - aimerror);
	if (warnTarget && Pawn(Target) != None)
		Pawn(Target).WarnTarget(self, projSpeed, vector(FireRotation));

	FireRotation.Yaw = FireRotation.Yaw & 65535;
	if ( (Abs(FireRotation.Yaw - (Rotation.Yaw & 65535)) > 8192)
		&& (Abs(FireRotation.Yaw - (Rotation.Yaw & 65535)) < 57343) )
	{
		if ( (FireRotation.Yaw > Rotation.Yaw + 32768) ||
			((FireRotation.Yaw < Rotation.Yaw) && (FireRotation.Yaw > Rotation.Yaw - 32768)) )
			FireRotation.Yaw = Rotation.Yaw - 8192;
		else
			FireRotation.Yaw = Rotation.Yaw + 8192;
	}
	viewRotation = FireRotation;
	return FireRotation;
}

function bool CanFireAtEnemy()
{
	local vector HitLocation, HitNormal, EnemyDir, EnemyUp;
	local actor HitActor;
	local float EnemyDist;

	if ( Enemy == none || enemy.health <= 0 || enemy.bdeleteme || Enemy == self )
     return false;
	EnemyDir = Enemy.Location - Location;
	EnemyDist = VSize(EnemyDir);
	EnemyUp = Enemy.CollisionHeight * vect(0,0,0.9);
	if ( EnemyDist > 300 )
	{
		EnemyDir = 300 * EnemyDir/EnemyDist;
		EnemyUp = 300 * EnemyUp/EnemyDist;
	}

	HitActor = Trace(HitLocation, HitNormal, Location + EnemyDir + EnemyUp, Location, true);

	if ( (HitActor == None) || (HitActor == Enemy)
		|| ((Pawn(HitActor) != None) && (AttitudeTo(Pawn(HitActor)) <= ATTITUDE_Ignore)) )
		return true;

	HitActor = Trace(HitLocation, HitNormal, Location + EnemyDir, Location, true);

	return ( (HitActor == None) || (HitActor == Enemy)
			|| ((Pawn(HitActor) != None) && (AttitudeTo(Pawn(HitActor)) <= ATTITUDE_Ignore)) );
}

function bool ChooseTeamAttackFor(ScriptedPawn TeamMember)
{
	if ( (Enemy == None) && TeamMember != none && (TeamMember.Enemy != None) && LineOfSightTo(TeamMember) )
	{
		if (SetEnemy(TeamMember.Enemy))
			MakeNoise(1.0);
	}
	if ( TeamMember != none && TeamMember.health > 0 && !TeamMember.bDeleteme && !bTeamSpeaking )
		SpeakOrderTo(TeamMember);
	if ( TeamMember == self )
	{
		ChooseLeaderAttack();
		return true;
	}

	if ( TeamMember != none && TeamMember.Enemy != none && TeamMember.bReadyToAttack )
	{
		TeamMember.Target = TeamMember.Enemy;
		Enemy=TeamMember.Enemy;
		if ( TeamMember.health > 0 && !TeamMember.bDeleteme && VSize(Enemy.Location - Location) <= (TeamMember.MeleeRange + TeamMember.Enemy.CollisionRadius + TeamMember.CollisionRadius))
		{
			TeamMember.GotoState('MeleeAttack');
			return true;
		}
		else if (TeamMember.bMovingRangedAttack || (TeamMember.TeamID == 1) )
			TeamMember.SetTimer(TimeBetweenAttacks, False);
		else if ( TeamMember.bHasRangedAttack && (TeamMember.bIsPlayer || TeamMember.Enemy.bIsPlayer) && TeamMember.CanFireAtEnemy() )
		{
			if ( TeamMember.health > 0 && !TeamMember.bDeleteme && (!TeamMember.bIsPlayer || (3 * FRand() > Skill)) )
			{
				TeamMember.GotoState('RangedAttack');
				return true;
			}
		}
	}
    if  ( Enemy == none && TeamMember.Enemy != none )
       SetEnemy(TeamMember.Enemy);
	if ( TeamMember != none && TeamMember.health > 0 && !TeamMember.bDeleteme && (!TeamMember.bHasRangedAttack || (TeamMember.TeamID == 1))  )
		TeamMember.GotoState('Charging');
	else if ( TeamMember != none  && TeamMember.health > 0 && !TeamMember.bDeleteme && TeamMember.TeamID == 2 )
	{
		TeamMember.bStrafeDir = true;
		TeamMember.GotoState('TacticalMove', 'NoCharge');
	}
	else if ( TeamMember != none && TeamMember.health > 0 && !TeamMember.bDeleteme && TeamMember.TeamID == 3 )
	{
		TeamMember.bStrafeDir = false;
		TeamMember.GotoState('TacticalMove', 'NoCharge');
	}
	else
	{
     if ( TeamMember != none && TeamMember.health > 0 && !TeamMember.bDeleteme )
  		TeamMember.GotoState('TacticalMove');
	}
	return true;
}

function bool CanStakeOut()
{
	local vector HitLocation, HitNormal;
	local actor HitActor;

	if ( (Physics == PHYS_Flying) && !bCanStrafe )
		return false;
    if (Enemy == none || Enemy.bDeleteme || Enemy.Health<=0 || Enemy==self )
		return false;
	if ( VSize(Enemy.Location - LastSeenPos) > 800 )
		return false;

	HitActor = Trace(HitLocation, HitNormal, LastSeenPos, Location + EyeHeight * vect(0,0,1), false);
	if ( HitActor == None )
	{
		HitActor = Trace(HitLocation, HitNormal, LastSeenPos , Enemy.Location + Enemy.BaseEyeHeight * vect(0,0,1), false);
		return (HitActor == None);
	}
	return false;
}

function Died(pawn Killer, name damageType, vector HitLocation)
{
	local pawn OtherPawn;
	local actor A;

	if ( bDeleteMe )
		return; //already destroyed
	Health = Min(0, Health);
	for ( OtherPawn=Level.PawnList; OtherPawn!=None; OtherPawn=OtherPawn.nextPawn )
		OtherPawn.Killed(Killer, self, damageType);
	if ( CarriedDecoration != None )
		DropDecoration();
    if ( killer != none )
       level.game.Killed(Killer, self, damageType);
	//log(class$" dying");
	if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( Self, Killer );
	Level.Game.DiscardInventory(self);
	Velocity.Z *= 1.3;
	if ( Gibbed(damageType) )
	{
		SpawnGibbedCarcass();
		if ( bIsPlayer )
			HidePlayer();
		else
			Destroy();
	}
	PlayDying(DamageType, HitLocation);
	if ( Level.Game.bGameEnded )
		return;
	if ( RemoteRole == ROLE_AutonomousProxy )
		ClientDying(DamageType, HitLocation);
	GotoState('Dying');
}

function bool MeleeDamageTarget(int hitdamage, vector pushdir)
{
	local vector HitLocation, HitNormal;
	local actor HitActor;

	if( Target==self )
        Target = none;
    if (Target == none )   // allow non pawn targets
    {
     if ( enemy != none && enemy.health >0 && !enemy.bDeleteme && enemy!=self )
      Target = Enemy;
    }
    if (Target == none || (Target != none && (Target.bDeleteme
       || (Target.IsA('Pawn') && Pawn(Target).Health <=0))) )
       return false;

    if ( (VSize(Target.Location - Location) <= MeleeRange * 1.4 + Target.CollisionRadius + CollisionRadius)
	     	&& ((Physics == PHYS_Flying) || (Physics == PHYS_Swimming) || (Abs(Location.Z - Target.Location.Z)
		     <= FMax(CollisionHeight, Target.CollisionHeight) + 0.5 * FMin(CollisionHeight, Target.CollisionHeight))) )
      	{
       	      HitActor = Trace(HitLocation, HitNormal, Target.Location, Location, false);
		      if ( HitActor != None )
	        		return false;
		       Target.TakeDamage(hitdamage, Self,HitLocation, pushdir, 'hacked');
		       return true;
	    }
	return false;
}

function bool SetEnemy( Pawn NewEnemy )
{
	local bool resultz;
	local eAttitude newAttitude, oldAttitude;
	local bool noOldEnemyz;
	local float newStrengthz;

	if ( (NewEnemy == Self) || (NewEnemy == None) || (NewEnemy.Health <= 0)
     || NewEnemy.bDeleteme || NewEnemy.IsA('FlockPawn') || NewEnemy.IsA('FlockMasterPawn')
     || Health <= 0 || NewEnemy.IsA('Spectator') )
        return false;
	if ( !bCanWalk && !bCanFly && !NewEnemy.FootRegion.Zone.bWaterZone )
		return false;

    noOldEnemyz = (Enemy == None);
	resultz = false;
	newAttitude = AttitudeTo(NewEnemy);
//	log ("Attitude to potential enemy is "$newAttitude);

	if ( !noOldEnemyz )
	{
		if (Enemy == NewEnemy)
			return true;
		else if ( NewEnemy.IsA('PlayerPawn') && (AlarmTag != '') )
		{
			OldEnemy = Enemy;
			Enemy = NewEnemy;
			resultz = true;
		}
		else if ( newAttitude == ATTITUDE_Friendly )
		{
			if ( bIgnoreFriends )
				return false;
		    if (NewEnemy.bIsPlayer && NewEnemy.Enemy == NewEnemy)
                return false;
			if ( NewEnemy.Enemy != self && NewEnemy.Enemy != None && NewEnemy.Enemy.Health > 0 && !NewEnemy.Enemy.bDeleteme )
			{
				if (!NewEnemy.IsA('ScriptedPawn') && NewEnemy.Enemy.bIsPlayer && (NewEnemy.AttitudeToPlayer < AttitudeToPlayer) )
					AttitudeToPlayer = NewEnemy.AttitudeToPlayer;
				if ( AttitudeTo(NewEnemy.Enemy) < AttitudeTo(Enemy) )
				{
					OldEnemy = Enemy;
					Enemy = NewEnemy.Enemy;
					resultz = true;
				}
			}
		}
		else
		{
			oldAttitude = AttitudeTo(Enemy);
			if ( (newAttitude < oldAttitude) ||
				( (newAttitude == oldAttitude)
					&& ((VSize(NewEnemy.Location - Location) < VSize(Enemy.Location - Location))
						|| !LineOfSightTo(Enemy)) ) )
			{
				if ( bIsPlayer && Enemy.IsA('PlayerPawn') && !NewEnemy.IsA('PlayerPawn') )
				{
					newStrengthz = relativeStrength(NewEnemy);
					if ( (newStrengthz < 0.2) && (relativeStrength(Enemy) < FMin(0, newStrengthz))
						&& (IsInState('Hunting')) && (Level.TimeSeconds - HuntStartTime < 5) )
						resultz = false;
					else
					{
						resultz = true;
						OldEnemy = Enemy;
						Enemy = NewEnemy;
					}
				}
				else
				{
					resultz = true;
					OldEnemy = Enemy;
					Enemy = NewEnemy;
				}
			}
		}
	}
	else if ( newAttitude < ATTITUDE_Ignore )
	{
		resultz = true;
		Enemy = NewEnemy;
	}
	else if ( newAttitude == ATTITUDE_Friendly ) //your enemy is my enemy
	{
//	    log("noticed a friend" $newenemy);
        if ( NewEnemy.IsA('PlayerPawn') && (AlarmTag != '') )
		{
			Enemy = NewEnemy;
			resultz = true;
		}
		if (bIgnoreFriends)
			return false;
 	    if (NewEnemy.bIsPlayer && NewEnemy.Enemy == NewEnemy)
            return false;
        if ( NewEnemy.Enemy != self && NewEnemy.Enemy != None && NewEnemy.Enemy.Health > 0 && !NewEnemy.Enemy.bDeleteme )
		{
			resultz = true;
// 		log("his enemy is my enemy");
			Enemy = NewEnemy.Enemy;
            if (!NewEnemy.IsA('ScriptedPawn') && NewEnemy.Enemy.bIsPlayer && (NewEnemy.AttitudeToPlayer < AttitudeToPlayer) )
					AttitudeToPlayer = NewEnemy.AttitudeToPlayer;
            else if ( NewEnemy.IsA('ScriptedPawn') && (ScriptedPawn(NewEnemy) != None) && (ScriptedPawn(NewEnemy).Hated == Enemy) )
			 	Hated = Enemy;
		}
	}

	if ( resultz )
	{
		//log(class$" has new enemy - "$enemy.class);
 	    LastSeenPos = Enemy.Location;
		LastSeeingPos = Location;
		EnemyAcquired();
		if ( !bFirstHatePlayer && Enemy.bIsPlayer && (FirstHatePlayerEvent != '') )
			TriggerFirstHate();
	}
	else if ( !NewEnemy.IsA('ScriptedPawn') && NewEnemy.bIsPlayer && (NewAttitude < ATTITUDE_Threaten) )
		OldEnemy = NewEnemy;

	return resultz;
}

function PlayCombatMove()
{
    if ( Enemy == none || enemy.health <= 0 || enemy.bdeleteme || Enemy == self )
    {
        PlayRunning();
		return;
    }
	if ( bMovingRangedAttack && bReadyToAttack && bCanFire && !NeedToTurn(Enemy.Location) )
	{
		Target = Enemy;
		PlayMovingAttack();
		if ( FRand() > 0.5 * (0.5 + skill * 0.25 + ReFireRate) )
		{
			bReadyToAttack = false;
			SetTimer(TimeBetweenAttacks  * (1.0 + FRand()),false);
		}
	}
	else
	{
		if ( !bReadyToAttack && (TimerRate == 0.0) )
			SetTimer(0.7, false);
		PlayRunning();
	}
}

function WhatToDoNext(name LikelyState, name LikelyLabel)
{
	if ( !Level.Game.bDeathMatch && AlarmTag == '' && bIsPlayer )
	   bIsPlayer=false;
	bQuiet = false;
	Enemy = None;
	if ( OldEnemy != None && (OldEnemy.bDeleteme
       || OldEnemy.Health <= 0 || OldEnemy==self ) )// be sure
	  OldEnemy = None;
	if ( OldEnemy != None )
	{
		Enemy = OldEnemy;
		OldEnemy = None;
		GotoState('Attacking');
	}
	else if (Orders == 'Patroling')
		GotoState('Patroling');
	else if (Orders == 'Guarding')
		GotoState('Guarding');
	else if ( Orders == 'Ambushing' )
		GotoState('Ambushing','FindAmbushSpot');
	else if ( (LikelyState != '') && (FRand() < 0.35) )
		GotoState(LikelyState, LikelyLabel);
	else
		StartRoaming();
}

state VictoryDance
{
 ignores EnemyNotVisible;

    function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
    {
       	Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
    	if ( health <= 0 || bDeleteme )
    		return;
    	Enemy = instigatedBy;
    	if ( NextState == 'TakeHit' )
    	{
    		NextState = 'Attacking'; //default
    		NextLabel = 'Begin';
    		GotoState('TakeHit');
    	}
    	else
    		GotoState('Attacking');
    }

    function Bump(Actor Other)
    {
	 if ( Health <= 0 || bDeleteme )
		  return;
     if (Other.IsA('Carcass') && !Other.IsA('CreatureChunks') )
      {
       gotoState('VictoryDance', 'Taunt');
       Disable('Bump');
      }
     else
      super.Bump(Other);
    }

	function PickDestination()
	{
		local Actor path;

    	if (Target == none || (target.IsA('Pawn') && Pawn(target).health >0) )
	    {
            target=none;
			WhatToDoNext('Waiting', 'TurnFromWall');
			return;
	    }
	    MoveTarget = none;
		if ( ActorReachable(Target) )
		{
			MoveTarget = Target;
			Destination = Target.Location;
		}
		else
		{
			if (SpecialGoal != None)
				path = FindPathToward(SpecialGoal);
			else
				path = FindPathToward(Target);
			if (path != None)
			{
				MoveTarget = path;
				Destination = path.Location;
			}
			else
				WhatToDoNext('Waiting', 'TurnFromWall');
		}
	}

	function HitWall(vector HitNormal, actor Wall)
	{
	   if (Physics == PHYS_Falling )
			return;
         gotoState('VictoryDance','Taunt');
    }

Begin:
	if ( (Target == None) || (VSize(Location - Target.Location) <
	  (1.3 * CollisionRadius + Target.CollisionRadius + CollisionHeight - Target.CollisionHeight)) )
		Goto('Taunt');
    WaitForLanding();
	TweenToWalking(0.3);
	FinishAnim();
	PlayWalking();
	Enable('Bump');

MoveToEnemy:
	if ( !IsAnimating() )
		PlayWalking();
	PickDestination();
    Sleep(0.0);
	if (SpecialPause > 0.0)
	{
		Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.3);
		Sleep(SpecialPause);
		SpecialPause = 0.0;
		TweenToWalking(0.1);
		FinishAnim();
		PlayWalking();
	}
    if ( MoveTarget == none )
    	Goto('Taunt');
	MoveToward(MoveTarget, WalkingSpeed);
	Enable('Bump');
	if ((Target == None) || ( Target.IsA('pawn') && Pawn(Target).health >0 ) || (VSize(Location - Target.Location) <
		(1.3 * CollisionRadius + Target.CollisionRadius + Abs(CollisionHeight - Target.CollisionHeight))))
		Goto('Taunt');
	Goto('MoveToEnemy');

Taunt:
	Acceleration = vect(0,0,0);
    Disable('HitWall');
	TweenToFighter(0.2);
	FinishAnim();
    if (Target!=none)
    {
     PlayTurning();
	 TurnToward(Target);
     TweenToFighter(0.2);
  	 FinishAnim();
    }
    DesiredRotation = rot(0,0,0);
	DesiredRotation.Yaw = Rotation.Yaw;
	setRotation(DesiredRotation);
	PlayVictoryDance();
	FinishAnim();
    LastPainTime -= 15.0; //set for state waiting
	WhatToDoNext('Waiting','TurnFromWall');
}

state Roaming
{
	ignores EnemyNotVisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;

		if ( Enemy != None )
	 	   LastSeenPos = Enemy.Location;
		if ( NextState == 'TakeHit' )
		{
			NextState = 'Attacking'; //default
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else
			GotoState('Attacking');
	}

	function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			bSpecialGoal = true;
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Roaming', 'Moving');
			return;
		}
	   Focus = Destination;
       if ( PickWallAdjust() )
       {
		   if ( Physics == PHYS_Falling )
		     SetFall();
           else
             gotoState('Roaming', 'AdjustFromWall');
       }
       else
	     MoveTimer = -1.0;
    }

	function Bump(Actor Other)
	{
	    if ( Health <= 0 || bDeleteme )
		  return;
		if ( FRand() < 0.03)
			GotoState('Wandering');
		else
			Global.Bump(Other);
	}

	function PickDestination()
	{
     local Actor Path;
     local int zzi;
     local Navigationpoint Nav;
     local float dist;
     local vector Dir;

     numHuntPaths++;
     if ( numHuntPaths > 80 )
	 {
  	   gotoState('Wandering');
       return;
	 }
     if (SpecialGoal != None)
     {
      Path = FindPathToward(SpecialGoal);
      if (Path != None)
        {
	     MoveTarget = Path;
         Destination=Path.Location;
         return;
        }
     }
     if ( Orderobject == None )
 	 {
      zzi=0;
      for ( Nav=Level.NavigationPointList; Nav!=None; Nav=Nav.NextNavigationPoint )
      if ( Nav.IsA('pathnode') || Nav.IsA('Ambushpoint') || Nav.IsA('Patrolpoint') )
           {
	 	    Dir = Nav.Location - Location;
	        dist = VSize(Dir);
         	if ( (dist < 1000) && (dist > CollisionRadius+50) )
               {
                zzi++;
                if(Rand(zzi) == Rand(4) && actorReachable(Nav) )
                 {
                  Orderobject = Nav;
                  Break;
                 }
                else if ( ((Orderobject == none) || (Rand(zzi) == 0)) && actorReachable(Nav) )
		               Orderobject = Nav;
	           }
           }
	  if ( Orderobject!=None )
	  {
         GotoState('Roaming', 'pausing');
         Return;
      }
	 }
     if ( Orderobject == None )
	  {
       GotoState('Wandering');
	   return;
      }
     if ( actorReachable(Orderobject) )
      {
         numHuntPaths = 0;
         MoveTarget = Orderobject;
         Orderobject = None;
         Destination=MoveTarget.Location;
       	 if ( VSize(MoveTarget.Location - Location) > 2 * CollisionRadius )
              return;
      }
     else
      {
        Path = FindPathToward(Orderobject);
        if ( Path != None )
         {
           MoveTarget = Path;
           Destination=MoveTarget.Location;
              return;
	     }
        else
          Orderobject = None;
      }

     if ( FRand() < 0.25 )
	        GotoState('Wandering');
	 else
     		GotoState('Roaming', 'pausing');
    }

    function EndState()
	{
     numHuntPaths = 0;
    }

Begin:
	//log(class$" Roaming");
 numHuntPaths = 0;

Roam:
	TweenToWalking(0.15);
	NextAnim = '';
	WaitForLanding();
	PickDestination();
	FinishAnim();
	PlayWalking();

Moving:
	if (SpecialPause > 0.0)
	{
        Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.3);
		Sleep(SpecialPause);
		SpecialPause = 0.0;
		TweenToWalking(0.1);
		FinishAnim();
		PlayWalking();
	}
	MoveToward(MoveTarget, WalkingSpeed);
	if ( bSpecialGoal )
	{
		bSpecialGoal = false;
		Goto('Roam');
	}
	Acceleration = vect(0,0,0);
	TweenToPatrolStop(0.3);
	FinishAnim();
	NextAnim = '';
Pausing:
    Acceleration = vect(0,0,0);
	PlayPatrolStop();
	FinishAnim();
	if ( !bQuiet && (FRand() < 0.3) )
		PlayRoamingSound();
	goto('Roam');

continueRoam:
	FinishAnim();
	PlayWalking();
	goto('Roam');

AdjustFromWall:
    if ( !IsAnimating() )
     PlayWalking();;
    StrafeTo(Destination, Focus);
	Destination = Focus;
    Goto('Moving');
}

state Attacking
{
ignores SeePlayer, HearNoise, Bump, HitWall;

	function ChooseAttackMode()
	{
		local eAttitude AttitudeToEnemy;
		local pawn changeEn;

		if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		{
			if (Orders == 'Attacking')
				Orders = '';
			WhatToDoNext('','');
			return;
		}

		if ( (AlarmTag != '') && Enemy.bIsPlayer )
		{
			if (AttitudeToPlayer > ATTITUDE_Ignore)
			{
				GotoState('AlarmPaused', 'WaitForPlayer');
				return;
			}
			else if ( (AttitudeToPlayer != ATTITUDE_Fear) || bInitialFear )
			{
				GotoState('TriggerAlarm');
				return;
			}
		}

	    if ( !Level.Game.bDeathMatch && AlarmTag == '' && bIsPlayer )
	       bIsPlayer=false;

		AttitudeToEnemy = AttitudeTo(Enemy);

		if (AttitudeToEnemy == ATTITUDE_Fear)
		{
			GotoState('Retreating');
			return;
		}

		else if (AttitudeToEnemy == ATTITUDE_Threaten)
		{
			GotoState('Threatening');
			return;
		}

		else if (AttitudeToEnemy == ATTITUDE_Friendly)
		{
			if (Enemy.bIsPlayer)
				GotoState('Greeting');
			else
				WhatToDoNext('','');
			return;
		}

        else if (!LineOfSightTo(Enemy))
	    {
			if ( (OldEnemy != none  )
				&& (AttitudeTo(OldEnemy) == ATTITUDE_Hate) && LineOfSightTo(OldEnemy) && !OldEnemy.bDeleteme)
			{
				changeEn = enemy;
				enemy = oldenemy;
				oldenemy = changeEn;
			}
			else
			{
            if ( (Orders == 'Guarding') && !LineOfSightTo(OrderObject) )
					GotoState('Guarding');
			else if ( !bHasRangedAttack || VSize(Enemy.Location - Location)
							> 600 + (FRand() * RelativeStrength(Enemy) - CombatStyle) * 600 )
					GotoState('Hunting');
			else if ( bIsBoss || (Intelligence > BRAINS_None) )
			{
					HuntStartTime = Level.TimeSeconds;
					NumHuntPaths = 0;
					GotoState('StakeOut');
			}
			else
					WhatToDoNext('Waiting', 'TurnFromWall');
			    	return;
			}
		}

		else if ( (TeamLeader != None) && TeamLeader.ChooseTeamAttackFor(self) )
			return;

		if (bReadyToAttack )
		{
			////log("Attack!");
			Target = Enemy;
			If (VSize(Enemy.Location - Location) <= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			{
				GotoState('MeleeAttack');
				return;
			}
			else if (bMovingRangedAttack)
				SetTimer(TimeBetweenAttacks, False);
			else if (bHasRangedAttack && (bIsPlayer || enemy.bIsPlayer) && CanFireAtEnemy() )
			{
				if (!bIsPlayer || (2.5 * FRand() > Skill) )
				{
					GotoState('RangedAttack');
					return;
				}
			}
		}

		//decide whether to charge or make a tactical move
		if ( !bHasRangedAttack )
			GotoState('Charging');
		else
			GotoState('TacticalMove');
		//log("Next state is "$state);
	}
}

state Acquisition
{
ignores falling, landed;

	function WarnTarget(Pawn shooter, float projSpeed, vector FireDir)
	{
		local eAttitude att;

		att = AttitudeTo(shooter);
		if ( ((att == ATTITUDE_Ignore) || (att == ATTITUDE_Threaten)) )
			damageAttitudeTo(shooter);
	}

    function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
        if ( (Enemy != None) && (Enemy == InstigatedBy) )
		  LastSeenPos = Enemy.Location;
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else
			GotoState('Attacking');
	}

	singular function HearNoise(float Loudness, Actor NoiseMaker)
	{
		local vector OldLastSeenPos;

		if ( SetEnemy(NoiseMaker.instigator) )
		{
			OldLastSeenPos = LastSeenPos;
			if ( Enemy ==  NoiseMaker.instigator  )
				LastSeenPos = 0.5 * (NoiseMaker.Location + VSize(NoiseMaker.Location - Location) * vector(Rotation));
			else if ( (Pawn(NoiseMaker) != None) && (Enemy == Pawn(NoiseMaker).Enemy) )
				LastSeenPos = 0.5 * (Pawn(NoiseMaker).Enemy.Location + VSize(Pawn(NoiseMaker).Enemy.Location - Location) * vector(Rotation));
			if ( VSize(OldLastSeenPos - Enemy.Location) < VSize(LastSeenPos - Enemy.Location) )
				LastSeenPos = OldLastSeenPos;
		}
	}

PlayOut:
	Acceleration = vect(0,0,0);
	if ( (AnimFrame < 0.6) && IsAnimating() )
	{
		Sleep(0.05);
		Goto('PlayOut');
	}

Begin:
 SetMovementPhysics();

AcquTurn:
	Acceleration = vect(0,0,0);
	if (NeedToTurn(LastSeenPos))
	{
		PlayTurning();
		TurnTo(LastSeenPos);
	}
	DesiredRotation = Rotator(LastSeenPos - Location);
	TweenToFighter(0.2);
	FinishAnim();
    if ( Enemy == self )
        Enemy = none;  //be sure
    if ( Enemy == None )
		WhatToDoNext('','');
	////log("Stimulus = "$Stimulus);
	if ( AttitudeTo(Enemy) == ATTITUDE_Fear )  //will run away from noise
	{
		LastSeenPos = Enemy.Location;
		MakeNoise(1.0);
		NextAnim = '';
		GotoState('Attacking');
	}
	else
	{     // dont start start monster wars but help if player
       MoveTarget = FindPathToward(Enemy);
       if((Enemy.bIsPlayer || Level.Game.IsA('TeamGame'))&&(Intelligence > BRAINS_Reptile || Skill>2 )
        && ( LineOfSightTo(Enemy) || ActorReachable(Enemy) || MoveTarget!=none ))
         {
	  	  LastSeenPos = Enemy.Location;
	      MakeNoise(1.0);
		  NextAnim = '';
		  GotoState('Attacking');
         }
       else   //investigate noise
       {
		////log("investigate noise");
		if ( pointReachable((Location + LastSeenPos) * 0.5) )
		{
			TweenToWalking(0.3);
			FinishAnim();
			PlayWalking();
			MoveTo((Location + LastSeenPos) * 0.5, WalkingSpeed);
			Acceleration = vect(0,0,0);
		}
		WhatToDoNext('','');
       }
	}
}

state Wandering
{
	ignores EnemyNotVisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bdeleteme )
			return;
		if ( Enemy != None )
			LastSeenPos = Enemy.Location;

		if ( NextState == 'TakeHit' )
			{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
			}
		else
			GotoState('Attacking');
	}

    function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Wandering', 'Pausing');
			return;
		}
		Focus = Destination;
		if ( PickWallAdjust() && (FRand() < 0.7) )
		{
			if ( Physics == PHYS_Falling )
				SetFall();
            else
                GotoState('Wandering', 'AdjustFromWall');
		}
		else
			MoveTimer = -1.0;
	}

    function PickDestination()
    {
       local vector pick, pickdir;
       local bool success;

       pickdir.X = 2 * FRand() - 1;
       pickdir.Y = 2 * FRand() - 1;
       pickdir.Z = 0;

       if (Physics != PHYS_Walking)
        pickdir.Z = 2 * FRand() - 1;

       if ( pickdir == Vect(0,0,0) )
         pickdir=Vector(Rotation);

       pickdir = Normal(pickdir);
       if ( pickdir == Vect(0,0,0) )
         pickdir.X = 1;
       success = TestDirection(pickdir, pick);
       if (!success)
        success = TestDirection(-1 * pickdir, pick);

       if (success)
        Destination = pick;
       else
        GotoState('Wandering', 'Turn');
    }

	function EndState()
	{
		if (JumpZ > 0)
			bCanJump = true;
	}

Begin:
	//log(class$" Wandering");

Wander:
	TweenToWalking(0.15);
	WaitForLanding();
	PickDestination();
	FinishAnim();
	PlayWalking();

Moving:
	Enable('HitWall');
	MoveTo(Destination, WalkingSpeed);
Pausing:
	Acceleration = vect(0,0,0);
	if ( NearWall(2 * CollisionRadius + 50) )
	{
		PlayTurning();
		TurnTo(Focus);
	}
	if (FRand() < 0.3)
		PlayRoamingSound();
	Enable('AnimEnd');
	NextAnim = '';
	TweenToPatrolStop(0.2);
	Sleep(1.0);
	Disable('AnimEnd');
	FinishAnim();
	Goto('Wander');

ContinueWander:
	FinishAnim();
	PlayWalking();
	if ( !bQuiet && (FRand() < 0.3) )
		PlayRoamingSound();
	if (FRand() < 0.2)
		Goto('Turn');
	Goto('Wander');

Turn:
	Acceleration = vect(0,0,0);
	PlayTurning();
	TurnTo(Location + 20 * VRand());
	Goto('Pausing');

AdjustFromWall:
    if ( !IsAnimating() )
     PlayWalking();;
	StrafeTo(Destination, Focus);
	Destination = Focus;
	Goto('Moving');
}

state StakeOut
{
ignores EnemyNotVisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		bFrustrated = true;
        if ( (Enemy != None) && (Enemy == InstigatedBy) )
		 LastSeenPos = Enemy.Location;
		if (NextState == 'TakeHit')
		{
			if (Enemy != None && AttitudeTo(Enemy) == ATTITUDE_Fear)
			{
				NextState = 'Retreating';
				NextLabel = 'Begin';
			}
			else
			{
				NextState = 'Attacking';
				NextLabel = 'Begin';
			}
			GotoState('TakeHit');
		}
		else
			GotoState('Attacking');
	}

	function rotator AdjustAim(float projSpeed, vector projStart, int aimerror, bool leadTarget, bool warnTarget)
	{
		local rotator FireRotation;
		local vector FireSpot;
		local actor HitActor;
		local vector HitLocation, HitNormal;

		FireSpot = LastSeenPos;
		aimerror = aimerror * (0.5 * (4 - skill - FRand()));

		HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
		if( HitActor != None )
		{
			////log("adjust aim up");
			if (Enemy!=none)
 			 FireSpot.Z += 0.9 * Enemy.CollisionHeight;
 			HitActor = Trace(HitLocation, HitNormal, FireSpot, ProjStart, false);
			bClearShot = (HitActor == None);
            if ( !bClearShot )
				FireSpot = LastSeenPos;
		}

		FireRotation = Rotator(FireSpot - ProjStart);

		FireRotation.Yaw = FireRotation.Yaw + 0.5 * (Rand(2 * aimerror) - aimerror);
		viewRotation = FireRotation;
		return FireRotation;
	}

	function BeginState()
	{
		local actor HitActor;
		local vector HitLocation, HitNormal;

        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        {
		  gotoState('Attacking');
          return;
        }
		Acceleration = vect(0,0,0);
		bCanJump = false;
		HitActor = Trace(HitLocation, HitNormal, LastSeenPos + vect(0,0,0.9) * Enemy.CollisionHeight, Location + vect(0,0,0.8) * EyeHeight, false);
		bClearShot = (HitActor == None);
		bReadyToAttack = true;
		SetAlertness(0.5);
	}

Begin:
	Acceleration = vect(0,0,0);
	PlayChallenge();
	TurnTo(LastSeenPos);
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		gotoState('Attacking');
	if ( bHasRangedAttack && bClearShot && (FRand() < 0.5) && (VSize(Enemy.Location - LastSeenPos) < 150) && CanStakeOut() )
		PlayRangedAttack();
	FinishAnim();
	PlayChallenge();
	if ( bCrouching && !Region.Zone.bWaterZone )
		Sleep(1);
	bCrouching = false;
	Sleep(1 + FRand());
	if (Enemy!=none)
	{
	 if ( !bHasRangedAttack || !bClearShot || (VSize(Enemy.Location - Location)
				> 350 + (FRand() * RelativeStrength(Enemy) - CombatStyle) * 350) )
		gotoState('Hunting', 'AfterFall');
	 else if ( CanStakeOut() )
		goto('Begin');
	 else
		gotoState('Hunting', 'AfterFall');
	}
    else
		gotoState('Attacking');
}

state TacticalMove
{
ignores SeePlayer, HearNoise;

	function SetFall()
	{
		Acceleration = vect(0,0,0);
		Destination = Location;
		NextState = 'Attacking';
		NextLabel = 'Begin';
		NextAnim = AnimSequence;
		GotoState('FallingState');
	}

    function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
    {
    	Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
    	if ( health <= 0 || bDeleteme )
    		return;
    	if ( NextState == 'TakeHit' )
    	{
    		NextState = 'TacticalMove';
    		NextLabel = 'TakeHit';
    		GotoState('TakeHit');
    	}
    }

	function Timer()
	{
		bReadyToAttack = True;
		Enable('Bump');
   	    if ( Health <=0 || bDeleteme )
	      return;
	    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    {
        	GotoState('Attacking');
        	return;
        }
		Target = Enemy;
		if (VSize(Enemy.Location - Location)
				<= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			GotoState('MeleeAttack');
		else if ( bHasRangedAttack && ((!bMovingRangedAttack && (FRand() < 0.8)) || (FRand() > 0.5 + 0.17 * skill)) )
			GotoState('RangedAttack');
	}

	function EnemyNotVisible()
	{
	    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    {
        	GotoState('Attacking');
        	return;
        }
		else if ( aggressiveness > relativestrength(enemy) )
		{
			if (ValidRecovery())
				GotoState('TacticalMove','RecoverEnemy');
			else
				GotoState('Attacking');
		}
		Disable('EnemyNotVisible');
	}

	function bool ValidRecovery()
	{
		local actor HitActor;
		local vector HitLocation, HitNormal;

        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
         return false;
		HitActor = Trace(HitLocation, HitNormal, Enemy.Location, LastSeeingPos, false);
		return (HitActor == None);
	}

    function PickDestination(bool bNoCharge)
    {
	    local vector pickdir, enemydir, enemyPart, Y, minDest;
	    local actor HitActor;
	    local vector HitLocation, HitNormal, collSpec;
	    local float Aggression, enemydist, minDist, strafeSize, optDist;
	    local bool success, bNoReach;

        if ( !bReadyToAttack && (TimerRate == 0.0) )
			SetTimer(0.7, false);

        bChangeDir = false;
        if (Region.Zone.bWaterZone && !bCanSwim && bCanFly)
        {
	     Destination = Location + 75 * (VRand() + vect(0,0,1));
	     Destination.Z += 100;
	     return;
        }
        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    {
	 	 WhatToDoNext('Waiting', 'TurnFromWall');
		 return;
        }
        if ( Enemy.Region.Zone.bWaterZone )
		    bNoCharge = bNoCharge || !bCanSwim;
        else
 	        bNoCharge = bNoCharge || (!bCanFly && !bCanWalk);

        success = false;
        enemydist = VSize(Location - Enemy.Location);
        Aggression = 2 * (CombatStyle + FRand()) - 1.1;
        if ( intelligence == BRAINS_Human )
        {
 	        if ( Enemy.bIsPlayer && (AttitudeToPlayer == ATTITUDE_Fear) && (CombatStyle > 0) )
		        Aggression = Aggression - 2 - 2 * CombatStyle;
	        if ( Weapon != None )
		        Aggression += 2 * Weapon.SuggestAttackStyle();
	        if ( Enemy.Weapon != None )
		        Aggression += 2 * Enemy.Weapon.SuggestDefenseStyle();
        }

        if ( enemydist > 1000 )
	     	Aggression += 1;
        if ( bIsPlayer && !bNoCharge )
	    	bNoCharge = ( Aggression < FRand() );

        if ( (Physics == PHYS_Walking) || (Physics == PHYS_Falling) )
        {
      	    if (Location.Z > Enemy.Location.Z + 140) //tactical height advantage
		    	Aggression = FMax(0.0, Aggression - 1.0 + CombatStyle);
	        else if (Location.Z < Enemy.Location.Z - CollisionHeight) // below enemy
	        {
		        if ( !bNoCharge && (Intelligence > BRAINS_Reptile)
		     	    && (Aggression > 0) && (FRand() < 0.6) )
		        {
		        	GotoState('Charging');
		        	return;
	            }
	            else if ( (enemydist < 1.1 * (Enemy.Location.Z - Location.Z))
			        	&& !actorReachable(Enemy) )
	            {
		        	bNoReach = (Intelligence > BRAINS_None);
	        		aggression = -1.5 * FRand();
	            }
            }
        }

        if (!bNoCharge && (Aggression > 2 * FRand()))
        {
	        if ( bNoReach && (Physics != PHYS_Falling) )
	        {
	         	TweenToRunning(0.15);
        		gotoState('Charging', 'NoReach');
            }
        	else
		        GotoState('Charging');
		    return;
	    }

        if (enemydist > FMax(VSize(OldLocation - Enemy.OldLocation), 240))
	    	Aggression += 0.4 * FRand();

        enemydir = (Enemy.Location - Location)/enemydist;
        minDist = FMin(160.0, 3*CollisionRadius);
        if ( bIsPlayer )
        	optDist = 80 + FMin(enemydist, 250 * (FRand() + FRand()));
        else
    	    optDist = 50 + FMin(enemydist, 500 * FRand());
    	Y = (enemydir Cross vect(0,0,1));
        if ( Physics == PHYS_Walking )
        {
        	Y.Z = 0;
        	enemydir.Z = 0;
        }
        else
        	enemydir.Z = FMax(0,enemydir.Z);

        strafeSize = FMax(-0.7, FMin(0.85, (2 * Aggression * FRand() - 0.3)));
        enemyPart = enemydir * strafeSize;
        strafeSize = FMax(0.0, 1 - Abs(strafeSize));
        pickdir = strafeSize * Y;
        if ( bStrafeDir )
    		pickdir *= -1;
        bStrafeDir = !bStrafeDir;
        collSpec.X = CollisionRadius;
        collSpec.Y = CollisionRadius;
        collSpec.Z = FMax(6, CollisionHeight - 18);

        minDest = Location + minDist * (pickdir + enemyPart);
        HitActor = Trace(HitLocation, HitNormal, minDest, Location, false, collSpec);
        if (HitActor == None)
        {
        	success = (Physics != PHYS_Walking);
        	if ( !success )
        	{
            	collSpec.X = FMin(14, 0.5 * CollisionRadius);
        		collSpec.Y = collSpec.X;
	         	HitActor = Trace(HitLocation, HitNormal, minDest - (18 + MaxStepHeight) * vect(0,0,1), minDest, false, collSpec);
        		success = (HitActor != None);
	        }
	        if (success)
	        	Destination = minDest + (pickdir + enemyPart) * optDist;
        }

        if ( !success )
        {
    		collSpec.X = CollisionRadius;
	    	collSpec.Y = CollisionRadius;
	    	minDest = Location + minDist * (enemyPart - pickdir);
	    	HitActor = Trace(HitLocation, HitNormal, minDest, Location, false, collSpec);
            if (HitActor == None)
            {
	        	success = (Physics != PHYS_Walking);
        		if ( !success )
	        	{
        			collSpec.X = FMin(14, 0.5 * CollisionRadius);
		         	collSpec.Y = collSpec.X;
         			HitActor = Trace(HitLocation, HitNormal, minDest - (18 + MaxStepHeight) * vect(0,0,1), minDest, false, collSpec);
		        	success = (HitActor != None);
		        }
	        	if (success)
		        	Destination = minDest + (enemyPart - pickdir) * optDist;
            }
            else
            {
        		if ( (CombatStyle <= 0) || (Enemy.bIsPlayer && (AttitudeToPlayer == ATTITUDE_Fear)) )
		        	enemyPart = vect(0,0,0);
		        else if ( (enemydir Dot enemyPart) < 0 )
		           	enemyPart = -1 * enemyPart;
	            pickdir = Normal(enemyPart - pickdir + HitNormal);
		    	minDest = Location + minDist * pickdir;
		    	collSpec.X = CollisionRadius;
		    	collSpec.Y = CollisionRadius;
	    		HitActor = Trace(HitLocation, HitNormal, minDest, Location, false, collSpec);
        		if (HitActor == None)
	        	{
		        	success = (Physics != PHYS_Walking);
		        	if ( !success )
	        		{
		        		collSpec.X = FMin(14, 0.5 * CollisionRadius);
		        		collSpec.Y = collSpec.X;
			        	HitActor = Trace(HitLocation, HitNormal, minDest - (18 + MaxStepHeight) * vect(0,0,1), minDest, false, collSpec);
			        	success = (HitActor != None);
			        }
		        	if (success)
			        	Destination = minDest + pickdir * optDist;
	        	}
            }
        }

        if ( !success )
    		GiveUpTactical(bNoCharge);
        else
    	{
    		pickdir = (Destination - Location);
    		enemydist = VSize(pickdir);
    		if ( enemydist > minDist + 2 * CollisionRadius )
	        {
	  	    	pickdir = pickdir/enemydist;
	    		HitActor = Trace(HitLocation, HitNormal, Destination + 2 * CollisionRadius * pickdir, Location, false);
	    		if ( (HitActor != None) && ((HitNormal Dot pickdir) < -0.6) )
		    		Destination = HitLocation - 2 * CollisionRadius * pickdir;
		    }
	    }
    }

    function HitWall(vector HitNormal, actor Wall)
    {
	   if (Physics == PHYS_Falling)
	    	return;
	   Focus = Destination;
	   if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	   {
	    	GotoState('Attacking');
		    return;
	   }
	   if ( bChangeDir || (FRand() < 0.5)
	    	|| (((Enemy.Location - Location) Dot HitNormal) < 0) )
	   {
	    	DesiredRotation = Rotator(Enemy.Location - location);
	        GiveUpTactical(false);
	   }
	   else
	   {
	    	bChangeDir = true;
		    Destination = Location - HitNormal * FRand() * 500;
	   }
    }
TacticalTick:
	Sleep(0.02);
Begin:
	TweenToRunning(0.15);
	Enable('AnimEnd');
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        	GotoState('Attacking');
	if (Physics == PHYS_Falling)
	{
		DesiredRotation = Rotator(Enemy.Location - Location);
		Focus = Enemy.Location;
		Destination = Enemy.Location;
		WaitForLanding();
	}
	PickDestination(false);

DoMove:
	if ( !bCanStrafe )
	{
DoDirectMove:
		Enable('AnimEnd');
		if ( GetAnimGroup(AnimSequence) == 'MovingAttack' )
		{
			AnimSequence = '';
			TweenToRunning(0.12);
		}
		bCanFire = false;
		MoveTo(Destination);
	}
	else
	{
DoStrafeMove:
		Enable('AnimEnd');
		bCanFire = true;
		StrafeFacing(Destination, Enemy);
	}
	if (FRand() < 0.5)
		PlayThreateningSound();

	if ( (Enemy != None) && !LineOfSightTo(Enemy) && ValidRecovery() )
		Goto('RecoverEnemy');
	else
	{
		bReadyToAttack = true;
		GotoState('Attacking');
	}

NoCharge:
	TweenToRunning(0.15);
	Enable('AnimEnd');
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        	GotoState('Attacking');
	if (Physics == PHYS_Falling)
	{
		DesiredRotation = Rotator(Enemy.Location - Location);
		Focus = Enemy.Location;
		Destination = Enemy.Location;
		WaitForLanding();
	}
	PickDestination(true);
	Goto('DoMove');

AdjustFromWall:
	Enable('AnimEnd');
	StrafeTo(Destination, Focus);
	Destination = Focus;
	Goto('DoMove');

TakeHit:
	TweenToRunning(0.12);
	Goto('DoMove');

RecoverEnemy:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        	GotoState('Attacking');
	Enable('AnimEnd');
	bReadyToAttack = true;
	HidingSpot = Location;
	bCanFire = false;
	Destination = LastSeeingPos + 3 * CollisionRadius * Normal(LastSeeingPos - Location);
	if ( bCanStrafe || (VSize(LastSeeingPos - Location) < 3 * CollisionRadius) )
		StrafeFacing(Destination, Enemy);
	else
		MoveTo(Destination);
	if ( Weapon == None )
		Acceleration = vect(0,0,0);
	if ( NeedToTurn(Enemy.Location) )
	{
		PlayTurning();
		TurnToward(Enemy);
	}
	if ( bHasRangedAttack && CanFireAtEnemy() )
	{
		Disable('AnimEnd');
		DesiredRotation = Rotator(Enemy.Location - Location);
		if ( Weapon == None )
		{
			PlayRangedAttack();
			FinishAnim();
			TweenToRunning(0.1);
			bReadyToAttack = false;
			SetTimer(TimeBetweenAttacks, false);
		}
		else
		{
			FireWeapon();
			if ( Weapon.bSplashDamage )
			{
				bFire = 0;
				bAltFire = 0;
			}
		}

		if ( bCanStrafe && (FRand() + 0.1 > CombatStyle) )
		{
			Enable('EnemyNotVisible');
			Enable('AnimEnd');
			Destination = HidingSpot + 4 * CollisionRadius * Normal(HidingSpot - Location);
			Goto('DoMove');
		}
	}
	if ( !bMovingRangedAttack )
		bReadyToAttack = false;

	GotoState('Attacking');
}

state Charging
{
ignores SeePlayer, HearNoise;

	function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling )
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			bSpecialGoal = true;
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Charging', 'SpecialNavig');
			return;
		}
		Focus = Destination;
        if ( PickWallAdjust() )
		{
			if ( Physics == PHYS_Falling )
				SetFall();
            else
                gotoState('Charging', 'AdjustFromWall');
		}
        else
			MoveTimer = -1.0;
	}

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		local float pick;
		local vector sideDir;
		local bool bWasOnGround;

		bWasOnGround = (Physics == PHYS_Walking);
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			if (AttitudeTo(Enemy) == ATTITUDE_Fear)
			{
				NextState = 'Retreating';
				NextLabel = 'Begin';
			}
			else if ( (Intelligence > BRAINS_Mammal) && bHasRangedAttack && bCanStrafe
				&& StrafeFromDamage(momentum, Damage, damageType, false) )
			{
				NextState = 'TacticalMove';
				NextLabel = 'NoCharge';
			}
			else
			{
				NextState = 'Charging';
				NextLabel = 'TakeHit';
			}
			GotoState('TakeHit');
		}
		else if ( (Intelligence > BRAINS_Mammal) && bHasRangedAttack && bCanStrafe
			&& StrafeFromDamage(momentum, Damage, damageType, true) )
			return;
		else if ( bWasOnGround && (MoveTarget == Enemy) &&
					(Physics == PHYS_Falling) && (Intelligence == BRAINS_Human) ) //weave
		{
			pick = 1.0;
			if ( bStrafeDir )
				pick = -1.0;
			sideDir = Normal( Normal(Enemy.Location - Location) Cross vect(0,0,1) );
			sideDir.Z = 0;
			Velocity += pick * GroundSpeed * 0.7 * sideDir;
			if ( FRand() < 0.2 )
				bStrafeDir = !bStrafeDir;
		}
	}

	function Timer()
	{
		bReadyToAttack = True;
        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		{
			GotoState('Attacking');
			return;
		}
        Target = Enemy;
		if (VSize(Enemy.Location - Location)
				<= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			GotoState('MeleeAttack');
		else if ( bHasRangedAttack && (FRand() > 0.7 + 0.1 * skill) )
			GotoState('RangedAttack');
		else if ( bHasRangedAttack && !bMovingRangedAttack)
		{
			if ( FRand() < CombatStyle * 0.8 ) //then keep charging
				SetTimer(1.0,false);
			else
				GotoState('Attacking');
		}
	}

	function EndState()
	{
		if ( JumpZ > 0 )
			bCanJump = true;
	}

AdjustFromWall:
	if ( !IsAnimating() )
	  PlayRunning();
	StrafeTo(Destination, Focus);
	Goto('CloseIn');

ResumeCharge:
	PlayRunning();
	Goto('Charge');

Begin:
	TweenToRunning(0.15);

Charge:
	bFromWall = false;

CloseIn:
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');

	if ( Enemy.Region.Zone.bWaterZone )
	{
		if (!bCanSwim)
			GotoState('TacticalMove', 'NoCharge');
	}
	else if (!bCanFly && !bCanWalk)
		GotoState('TacticalMove', 'NoCharge');

	if (Physics == PHYS_Falling)
	{
		DesiredRotation = Rotator(Enemy.Location - Location);
		Focus = Enemy.Location;
		Destination = Enemy.Location;
		WaitForLanding();
	}
	if( (Intelligence <= BRAINS_Reptile) || actorReachable(Enemy) )
	{
		bCanFire = true;
		if ( FRand() < 0.3 )
			PlayThreateningSound();
		MoveToward(Enemy);
		if (bFromWall)
		{
			bFromWall = false;
			if (PickWallAdjust())
			{
				if ( Physics == PHYS_Falling )
					SetFall();
				else
					StrafeFacing(Destination, Enemy);
			}
			else
				GotoState('TacticalMove', 'NoCharge');
		}
	}
	else
	{
NoReach:
        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    	GotoState('Attacking');
		bCanFire = false;
		bFromWall = false;
		//log("route to enemy "$Enemy);
		if (!FindBestPathToward(Enemy))
		{
			Sleep(0.0);
			GotoState('TacticalMove', 'NoCharge');
		}
SpecialNavig:
		if ( SpecialPause > 0.0 )
		{
            Target = Enemy;
			bFiringPaused = true;
			NextState = 'Charging';
			NextLabel = 'Moving';
			GotoState('RangedAttack');
		}
Moving:
        if ( !IsAnimating() )
	    	AnimEnd();
        if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    	gotoState('Attacking');
		if (MoveTarget!=none)
		{
		  if (VSize(MoveTarget.Location - Location) < 2.5 * CollisionRadius)
		  {
			bCanFire = true;
			StrafeFacing(MoveTarget.Location, Enemy);
		  }
		  else
		  {
			if ( !bCanStrafe || !LineOfSightTo(Enemy) ||
				(Skill - 2 * FRand() + (Normal(Enemy.Location - Location - vect(0,0,1) * (Enemy.Location.Z - Location.Z))
					Dot Normal(MoveTarget.Location - Location - vect(0,0,1) * (MoveTarget.Location.Z - Location.Z))) < 0) )
			{
				if ( GetAnimGroup(AnimSequence) == 'MovingAttack' )
				{
					AnimSequence = '';
					TweenToRunning(0.12);
				}
				MoveToward(MoveTarget);
			}
			else
			{
				bCanFire = true;
				StrafeFacing(MoveTarget.Location, Enemy);
			}
			if ( !bFromWall && (FRand() < 0.5) )
				PlayThreateningSound();
		  }
		}
	}
	//log("finished move");
	if (Enemy!=none && VSize(Location - Enemy.Location) < CollisionRadius + Enemy.CollisionRadius + MeleeRange)
		goto('GotThere');
	if ( bIsPlayer || (!bFromWall && bHasRangedAttack && (FRand() > CombatStyle + 0.1)) )
		gotoState('Attacking');
	MoveTimer = 0.0;
	bFromWall = false;
	Goto('CloseIn');

GotThere:
	////log("Got to enemy");
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		gotoState('Attacking');
	Target = Enemy;
	GotoState('MeleeAttack');

TakeHit:
	TweenToRunning(0.12);
	if (MoveTarget == Enemy)
	{
		bCanFire = true;
		MoveToward(MoveTarget);
	}

	Goto('Charge');
}

state RangedAttack
{
ignores SeePlayer, HearNoise, Bump;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme)
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'RangedAttack';
			NextLabel = 'Begin';
		}
	}

	function KeepAttacking()
	{
		if ( !bFiringPaused && ((FRand() > ReFireRate) || (Enemy == None) || (Enemy == self)
           || (Enemy.Health <= 0) || (Enemy.bDeleteMe) || !CanFireAtEnemy()) )
			GotoState('Attacking');
	}

	function BeginState()
	{
		Disable('AnimEnd');
		bReadyToAttack = false;
		if ( bFiringPaused )
		{
			SetTimer(SpecialPause, false);
			SpecialPause = 0;
		}
		else
		{
          if ( Enemy != none && Enemy.health > 0 && !Enemy.bdeleteme && Enemy != self )
            Target = Enemy;
          else
            GotoState('Attacking');
        }
	}

Challenge:
	Disable('AnimEnd');
	Sleep(0.0);
	FinishAnim();
	Acceleration = vect(0,0,0); //stop
	if ( Enemy != none)
	 DesiredRotation = Rotator(Enemy.Location - Location);
	PlayChallenge();
	FinishAnim();
	if ( bCrouching && !Region.Zone.bWaterZone )
		Sleep(0.8 + FRand());
	bCrouching = false;
	TweenToFighter(0.1);
	Goto('FaceTarget');

Begin:
    FinishAnim();
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
        GotoState('Attacking');
	Acceleration = vect(0,0,0); //stop
	DesiredRotation = Rotator(Enemy.Location - Location);
	TweenToFighter(0.15);

FaceTarget:
	Disable('AnimEnd');
	Sleep(0.0);
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');
	Target = Enemy;
	if (NeedToTurn(Enemy.Location))
	{
		PlayTurning();
		TurnToward(Enemy);
	//	TweenToFighter(0.1);
	}
	FinishAnim();

	if (Enemy != none && VSize(Location - Enemy.Location) < 0.9 * MeleeRange + CollisionRadius + Enemy.CollisionRadius)
		GotoState('MeleeAttack', 'ReadyToAttack');

ReadyToAttack:
	if (!bHasRangedAttack || Enemy == none || Enemy.health <= 0 || Enemy.bDeleteme || Enemy == self)
		GotoState('Attacking');
	DesiredRotation = Rotator(Enemy.Location - Location);
	PlayRangedAttack();
	Enable('AnimEnd');
	Sleep(0.0);

Firing:
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');
	TurnToward(Enemy);
	Goto('Firing');

DoneFiring:
	Disable('AnimEnd');
	Sleep(0.0);
	KeepAttacking();
	Goto('FaceTarget');
}

state MeleeAttack
{
ignores SeePlayer, HearNoise, Bump;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'MeleeAttack';
			NextLabel = 'Begin';
		}
	}

	function KeepAttacking()
	{
	 if ( (Enemy == None) || (Enemy == self )|| (Enemy.Health <= 0) || (Enemy.bDeleteme)
        || (VSize(Enemy.Location - Location) >
        (MeleeRange + Enemy.CollisionRadius + CollisionRadius)) )
			GotoState('Attacking');
	}

	function BeginState()
	{
		if ( Enemy != none && Enemy.health > 0 && !Enemy.bdeleteme && Enemy != self )
        Target = Enemy;
		Disable('AnimEnd');
		bReadyToAttack = false;
	}

Begin:
	if ( Enemy != None )
	DesiredRotation = Rotator(Enemy.Location - Location);
	if ( skill < 3 )
		TweenToFighter(0.15);
	else
		TweenToFighter(0.11);

FaceTarget:
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
			GotoState('Attacking');
    Target = Enemy;
	Disable('AnimEnd');
    Sleep(0.0);
	Acceleration = vect(0,0,0); //stop
	if (NeedToTurn(Enemy.Location))
	{
		PlayTurning();
		TurnToward(Enemy);
		TweenToFighter(0.1);
	}
	FinishAnim();
	OldAnimRate = 0;	// force no tween

	if ( (Physics == PHYS_Swimming) || (Physics == PHYS_Flying) )
	{
		 if ( VSize(Location - Enemy.Location) > MeleeRange + CollisionRadius + Enemy.CollisionRadius )
			GotoState('RangedAttack', 'ReadyToAttack');
	}
	else if ( (Abs(Location.Z - Enemy.Location.Z)
			> FMax(CollisionHeight, Enemy.CollisionHeight) + 0.5 * FMin(CollisionHeight, Enemy.CollisionHeight)) ||
		(VSize(Location - Enemy.Location) > MeleeRange + CollisionRadius + Enemy.CollisionRadius) )
		GotoState('RangedAttack', 'ReadyToAttack');

ReadyToAttack:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');
    Target = Enemy;
	DesiredRotation = Rotator(Enemy.Location - Location);
	PlayMeleeAttack();
	Enable('AnimEnd');
	Sleep(0.0);
Attacking:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
		GotoState('Attacking');
	if (NeedToTurn(Enemy.Location))
	{
		TurnToward(Enemy);
		Goto('Attacking');
	}
DoneAttacking:
	Disable('AnimEnd');
	Sleep(0.0);
	KeepAttacking();
	if ( FRand() < 0.3 - 0.1 * skill )
	{
		Acceleration = vect(0,0,0); //stop
		DesiredRotation = Rotator(Enemy.Location - Location);
		PlayChallenge();
		FinishAnim();
		TweenToFighter(0.1);
	}
	Goto('FaceTarget');
}

State Patroling
{
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
        if ( (Enemy != None) && (Enemy == InstigatedBy) )
		 LastSeenPos = Enemy.Location;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else if ( Enemy != None )
			GotoState('Attacking');
	}

	function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling )
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Patroling', 'SpecialNavig');
			return;
		}
		Focus = Destination;
		if (PickWallAdjust())
        {
		   if ( Physics == PHYS_Falling )
		     SetFall();
           else
		     GotoState('Patroling', 'AdjustFromWall');
	    }
		else
			MoveTimer = -1.0;
	}

    function Trigger( actor Other, pawn EventInstigator )
	{
		if ( EventInstigator!=none && bDelayedPatrol )
		{
			if ( bHateWhenTriggered )
			{
				if ( EventInstigator.bIsPlayer)
					AttitudeToPlayer = ATTITUDE_Hate;
				else
					Hated = EventInstigator;
			}
			GotoState('Patroling', 'Patrol');
		}
		else
			Global.Trigger(Other, EventInstigator);
	}

AdjustFromWall:
    if ( !IsAnimating() )
     PlayWalking();
	StrafeTo(Destination, Focus);
	Destination = Focus;
	MoveTo(Destination);
	Goto('MoveToPatrol');

ResumePatrol:
	if (MoveTarget != None)
	{
		PlayWalking();
		MoveToward(MoveTarget, WalkingSpeed);
		Goto('ReachedPatrol');
	}
	else
		Goto('Patrol');

Begin:
	sleep(0.1);

Patrol: //FIXME -add stasis mode? - also set random start point in roam area
	WaitForLanding();
	FindNextPatrol();
	Disable('AnimEnd');
	if (PatrolPoint(OrderObject) != None)
	{
		////log("Move to next patrol point");
		if ( !bQuiet && (FRand() < 0.4) )
			PlayRoamingSound();
		TweenToWalking(0.3);
		FinishAnim();
		PlayWalking();
		numHuntPaths = 0;

MoveToPatrol:
		if (actorReachable(OrderObject))
			MoveToward(OrderObject, WalkingSpeed);
		else
		{
			PickDestination();
			if (OrderObject != None)
			{
SpecialNavig:
				if (SpecialPause > 0.0)
				{
					Acceleration = vect(0,0,0);
					TweenToPatrolStop(0.3);
					Sleep(SpecialPause);
					SpecialPause = 0.0;
					TweenToWalking(0.1);
					FinishAnim();
					PlayWalking();
				}
				numHuntPaths++;
				MoveToward(MoveTarget, WalkingSpeed);
				if ( numHuntPaths < 30 )
					Goto('MoveToPatrol');
				else
					Goto('GiveUp');
			}
			else
				Goto('GiveUp');
		}

ReachedPatrol:
		////log("Got to patrol point "$OrderTag);
		OrderTag = Patrolpoint(OrderObject).Nextpatrol;
		////log("Next patrol point "$OrderTag);
		if ( Patrolpoint(OrderObject).pausetime > 0.0 )
		{
			////log("Pause patrol");
			Acceleration = vect(0,0,0);
			TweenToFighter(0.2);
			FinishAnim();
			PlayTurning();
			TurnTo(Location + (Patrolpoint(OrderObject)).lookdir);
			if ( Patrolpoint(OrderObject).PatrolAnim != '' && HasAnim(Patrolpoint(OrderObject).PatrolAnim))
			{
				TweenAnim( Patrolpoint(OrderObject).PatrolAnim, 0.3);
				FinishAnim();
				Patrolpoint(OrderObject).AnimCount = Patrolpoint(OrderObject).numAnims;
				While ( Patrolpoint(OrderObject).AnimCount > 0 )
				{
					Patrolpoint(OrderObject).AnimCount--;
					if (Patrolpoint(OrderObject).PatrolSound != None )
						PlaySound( Patrolpoint(OrderObject).PatrolSound );
					PlayAnim(Patrolpoint(OrderObject).PatrolAnim);
					FinishAnim();
				}
			}
			else
			{
				TweenToPatrolStop(0.3);
				FinishAnim();
				Enable('AnimEnd');
				NextAnim = '';
				PlayPatrolStop();
				////log("stop here for "$(Patrolpoint(OrderObject)).pausetime);
				Sleep((Patrolpoint(OrderObject)).pausetime);
				Disable('AnimEnd');
				FinishAnim();
			}
		}
		Goto('Patrol');
	}

GiveUp:
		//log(self$" gave up patrol");
		Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.3);
		FinishAnim();
DelayedPatrol:
		Enable('AnimEnd');
		PlayPatrolStop();
}

state Threatening
{
ignores falling, landed;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme)
			return;
		if (NextState == 'TakeHit')
		{
			bReadyToAttack = true;
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else
		{
			bReadyToAttack = true;
			GotoState('Attacking');
		}
	}

	function Trigger( actor Other, pawn EventInstigator )
	{
		if (EventInstigator != none && EventInstigator.bIsPlayer)
		{
			Enemy = EventInstigator;
			AttitudeToPlayer = ATTITUDE_Hate;
			GotoState('Attacking');
		}
	}
Begin:
	Acceleration = vect(0,0,0);
	bReadyToAttack = true;
	if (Enemy != none && Enemy.bIsPlayer)
		Disable('SeePlayer'); //but not hear noise
	TweenToPatrolStop(0.2);
	FinishAnim();
	NextAnim = '';

FaceEnemy:
   if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
    GotoState('Attacking');
   Acceleration = vect(0,0,0);
   if (NeedToTurn(enemy.Location))
	{
		PlayTurning();
		TurnToward(Enemy);
		TweenToPatrolStop(0.2);
		FinishAnim();
		NextAnim = '';
	}

Threaten:
	if ( (Enemy == none) ||  (Enemy.Health <=0) || (Enemy.bDeleteme) || (Enemy == self)
       || (AttitudeTo(Enemy) < ATTITUDE_Threaten) )
		GotoState('Attacking');

	PlayThreatening();
	FinishAnim();

	if ( (Enemy == none) ||  (Enemy.Health <=0) || (Enemy.bDeleteme) || (Enemy == self)
       || (AttitudeTo(Enemy) < ATTITUDE_Threaten) )
		GotoState('Attacking');

	if (Orders == 'Guarding')
	{ //stay between enemy and guard object
		If (Enemy.bIsPlayer &&
			(VSize(Enemy.Location - OrderObject.Location) < OrderObject.CollisionRadius + 2 * CollisionRadius + MeleeRange))
		{
			AttitudeToPlayer = ATTITUDE_Hate;
			GotoState('Attacking');
		}
	}
	else if (FRand() < 0.9 - Aggressiveness) //mostly just turn
		Goto('FaceEnemy');
	else if (VSize(Enemy.Location - Location) < 2.5 * (CollisionRadius + Enemy.CollisionRadius + MeleeRange))
		Goto('FaceEnemy');

	WaitForLanding();
	if (Orders == 'Guarding') //stay between enemy and guard object
		PickGuardDestination();
	else
		PickThreatenDestination();

	if (Destination != Location)
	{
		TweenToWalking(0.2);
		FinishAnim();
		PlayWalking();
		MoveTo(Destination, WalkingSpeed);
		Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.2);
		FinishAnim();
		NextAnim = '';
	}

	Goto('FaceEnemy');
}

state Guarding
{
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
        if ( (Enemy != None) && (Enemy == InstigatedBy) )
	  	 LastSeenPos = Enemy.Location;
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else if ( Enemy != None )
			GotoState('Attacking');
	}

	function HitWall(vector HitNormal, actor Wall)
	{
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Guarding', 'SpecialNavig');
			return;
		}
		Focus = Destination;
		if (PickWallAdjust())
        {
		   if ( Physics == PHYS_Falling )
		     SetFall();
           else
			 GotoState('Guarding', 'AdjustFromWall');
		}
		else
			MoveTimer = -1.0;
	}

AdjustFromWall:
    if ( !IsAnimating() )
      PlayRunning();
	StrafeTo(Destination, Focus);
	Destination = Focus;
	MoveTo(Destination);
	Goto('GoToGuard');

Begin:
	//log(class$" guarding "$OrderObject);
	Disable('AnimEnd');

GoToGuard:
	if ( VSize(Location - OrderObject.Location) < 2 * CollisionRadius)
		Goto('Turn');
	TweenToRunning(0.2);
	FinishAnim();
	PlayRunning();
	WaitForLanding();
	if (actorReachable(OrderObject))
		MoveToward(OrderObject, FMax(0.75, WalkingSpeed));
	else
	{
		PickDestination();
SpecialNavig:
		if (SpecialPause > 0.0)
		{
			Acceleration = vect(0,0,0);
			TweenToPatrolStop(0.3);
			Sleep(SpecialPause);
			SpecialPause = 0.0;
			TweenToRunning(0.1);
			FinishAnim();
			PlayRunning();
		}
		MoveToward(MoveTarget);
	}
	Goto('GoToGuard');

Turn:
	//log(class$" got to guardpoint");
	Acceleration = vect(0,0,0);
	TweenToFighter(0.3);
	FinishAnim();
	PlayTurning();
	TurnTo( Location + 1000 * vector(OrderObject.Rotation) );

	NextAnim = '';
	bReadyToAttack = false;
	TweenToPatrolStop(0.2);
	FinishAnim();
	Enable('AnimEnd');
	NextAnim = '';
	PlayPatrolStop();
	DesiredRotation = rot(0,0,0);
	DesiredRotation.Yaw = Rotation.Yaw;
	setRotation(DesiredRotation);
	if (Physics != PHYS_Falling)
		SetPhysics(PHYS_None);
}


state Retreating
{
ignores EnemyNotVisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			NextState = 'Retreating';
			NextLabel = 'TakeHit';
			GotoState('TakeHit');
		}
	}

	function SeePlayer(Actor SeenPlayer)
	{
		if ( (SeenPlayer == Enemy) || LineOfSightTo(Enemy) )
		{
			LastSeenTime = Level.TimeSeconds;
			return;
		}
		if ( SetEnemy(Pawn(SeenPlayer)) )
		{
			MakeNoise(1.0);
			GotoState('Attacking');
		}
	}

	singular function HearNoise(float Loudness, Actor NoiseMaker)
	{
	    if ( Health <= 0 || bDeleteme )
		  return;
		if ( ((NoiseMaker.instigator == Enemy) || LineOfSightTo(Enemy))
             && Enemy !=none )
			return;

		if ( SetEnemy(NoiseMaker.instigator) )
		{
			MakeNoise(1.0);
			GotoState('Attacking');
		}
	}

    function HitWall(vector HitNormal, actor Wall)
	{
		bSpecialPausing = false;
		if (Physics == PHYS_Falling)
			return;
		if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
		{
			if ( SpecialPause > 0 )
				Acceleration = vect(0,0,0);
			GotoState('Retreating', 'SpecialNavig');
			return;
		}
		Focus = Destination;
		if (PickWallAdjust())
        {
		   if ( Physics == PHYS_Falling )
		     SetFall();
           else
		  	 GotoState('Retreating', 'AdjustFromWall');
        }
		else
		{
			Home = None;
			MoveTimer = -1.0;
		}
	}

	function Bump(actor Other)
	{
		local vector VelDir, OtherDir;
		local float speed;

		//log(Other.class$" bumped "$class);
	    if ( Health <= 0 || bDeleteme )
		  return;
		if (Pawn(Other) != None)
		{
			if ( (Other == Enemy) || SetEnemy(Pawn(Other)) )
				GotoState('MeleeAttack');
			else if ( (HomeBase(Home) != None)
				&& (VSize(Location - Home.Location) < HomeBase(Home).Extent) )
				ReachedHome();
			return;
		}
		if ( TimerRate <= 0 )
			setTimer(1.0, false);

		speed = VSize(Velocity);
		if ( speed > 1 )
		{
			VelDir = Velocity/speed;
			VelDir.Z = 0;
			OtherDir = Other.Location - Location;
			OtherDir.Z = 0;
			OtherDir = Normal(OtherDir);
			if ( (VelDir Dot OtherDir) > 0.9 )
			{
				Velocity.X = VelDir.Y;
				Velocity.Y = -1 * VelDir.X;
				Velocity *= FMax(speed, 200);
			}
		}
		Disable('Bump');
	}

	function PickDestination()
	{
     local NavigationPoint Nav;
     local int zzi;
     local float dist;
     local vector Dir;

	 if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	 {
		WhatToDoNext('','');
		return;
	 }

	 if( Level.NavigationPointList == None )
	 {
          if ( Enemy != None )
          {
            AttitudeTo(Enemy) == ATTITUDE_Hate;
			Aggressiveness += 0.3;
			GotoState( 'Attacking' );
            return;
          }
          WhatToDoNext('','');
		  return;
	 }

     if (HomeBase(Home) == None)
     {
  	  zzi=0;
      for ( Nav=Level.NavigationPointList; Nav!=None; Nav=Nav.NextNavigationPoint )
	  if ( Nav.IsA('NavigationPoint') && !Nav.IsA('LiftCenter')&& !Nav.IsA('LiftExit') && !Nav.IsA('Teleporter'))
      {
	  	    Dir = Nav.Location - Location;
	        dist = VSize(Dir);
           	if ( (dist < 2000) && (dist > 20) )
            {
             zzi++;
             if ( (home == none) || (Rand(zzi) == 0) )
			     home = Nav;
		    }
      }
      if (Home == none )
      {
        if (bReadyToAttack)
      	 {
      	  setTimer(3.0, false);
          if (Enemy !=none )
       	  	  Target = Enemy;
      	  GotoState('RangedAttack');
		 }
   	     else
   	     {
   	    	Aggressiveness += 0.3;
  	     	GotoState('TacticalMove', 'NoCharge');
   	     }
   	  }
     }
    }

Begin:
	//log(class$" retreating");
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
     GotoState('Attacking');
	if ( bReadyToAttack && (FRand() < 0.6) )
	{
		SetTimer(TimeBetweenAttacks, false);
		bReadyToAttack = false;
	}
	TweenToRunning(0.1);
	WaitForLanding();
	PickDestination();

Landed:
	TweenToRunning(0.1);

RunAway:
	PickNextSpot();
SpecialNavig:
	if (SpecialPause > 0.0)
	{
		if ( Enemy!=none && LineOfSightTo(Enemy))
		{
			bFiringPaused = true;
			NextState = 'Retreating';
			NextLabel = 'Moving';
			GotoState('RangedAttack');
		}
		bSpecialPausing = true;
		Acceleration = vect(0,0,0);
		TweenToPatrolStop(0.25);
		Sleep(SpecialPause);
		SpecialPause = 0.0;
		bSpecialPausing = false;
		TweenToRunning(0.1);
	}
Moving:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
      GotoState('Attacking');
	if ( MoveTarget == None )
	{
		Sleep(0.0);
		Goto('RunAway');
	}
	if ( !bCanStrafe || !LineOfSightTo(Enemy) ||
		(Skill - 2 * FRand() + (Normal(Enemy.Location - Location - vect(0,0,1) * (Enemy.Location.Z - Location.Z))
			Dot Normal(MoveTarget.Location - Location - vect(0,0,1) * (MoveTarget.Location.Z - Location.Z))) < 0) )
	{
		bCanFire = false;
		MoveToward(MoveTarget);
	}
	else
	{
		bCanFire = true;
		StrafeFacing(MoveTarget.Location, Enemy);
	}
	Goto('RunAway');

TakeHit:
	TweenToRunning(0.12);
	Goto('Moving');

AdjustFromWall:
	if ( !IsAnimating() )
 	  PlayRunning();
	StrafeTo(Destination, Focus);
	Destination = Focus;
	MoveTo(Destination);
	Goto('Moving');

TurnAtHome:
	Acceleration = vect(0,0,0);
    if (HomeBase(Home) != None)
	  TurnTo(Homebase(Home).lookdir);
	GotoState('Ambushing', 'FindAmbushSpot');
}

state Hunting
{
ignores EnemyNotVisible;

    function HitWall(vector HitNormal, actor Wall)
    {
     if (Physics == PHYS_Falling)
    	return;
     if ( Wall.IsA('Mover') && Mover(Wall).HandleDoor(self) )
	 {
 	  if ( SpecialPause > 0 )
		Acceleration = vect(0,0,0);
	  GotoState('Hunting', 'SpecialNavig');
	  return;
     }
     Focus = Destination;
     if (PickWallAdjust())
     {
	   if ( Physics == PHYS_Falling )
		  SetFall();
       else
	      GotoState('Hunting', 'AdjustFromWall');
     }
     else
	 MoveTimer = -1.0;
    }

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		bFrustrated = true;
		if (NextState == 'TakeHit')
		{
			if (Enemy != None && AttitudeTo(Enemy) == ATTITUDE_Fear)
			{
				NextState = 'Retreating';
				NextLabel = 'Begin';
			}
			else
			{
				NextState = 'Hunting';
				NextLabel = 'AfterFall';
			}
			GotoState('TakeHit');
		}
	}


    function PickDestination()
    {
     if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
      {
       Enemy = none;
  	   WhatToDoNext('','');
	   return;
      }
     super.PickDestination();
    }

	function bool FindViewSpot()
	{
		if ( Enemy == None || Enemy.bDeleteme)
		   return false;
		super.FindViewSpot();
   }

   function BeginState()
   {
      SpecialGoal = None;
	  SpecialPause = 0.0;
	  bFromWall = false;
	  SetAlertness(0.5);
	  if (Enemy!=none && !Enemy.bDeleteme)
        LastSeenPos = Enemy.Location;
   }

   function EndState()
	{
		bAvoidLedges = false;
		bHunting = false;
		if ( JumpZ > 0 )
			bCanJump = true;
	}

AdjustFromWall:
    Enable('AnimEnd');
	StrafeTo(Destination, Focus);
	Destination = Focus;
	if ( MoveTarget != None )
		Goto('SpecialNavig');
	else
		Goto('Follow');

Begin:
	numHuntPaths = 0;
	HuntStartTime = Level.TimeSeconds;

AfterFall:
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
      GotoState('Attacking');
	TweenToRunning(0.15);
	bFromWall = false;

Follow:
	WaitForLanding();
	if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
      GotoState('Attacking');
	if ( CanSee(Enemy) )
     {
		SetEnemy(Enemy);
        LastSeenPos = Enemy.Location;
     }
	PickDestination();

SpecialNavig:
	if ( SpecialPause > 0.0 )
	{
		Disable('AnimEnd');
		Acceleration = vect(0,0,0);
		PlayChallenge();
		Sleep(SpecialPause);
		SpecialPause = 0.0;
		Enable('AnimEnd');
	}
	if (MoveTarget == None)
		MoveTo(Destination);
	else
		MoveToward(MoveTarget);
	if ( Intelligence < BRAINS_Human )
	{
		if ( FRand() > 0.3 )
			PlayRoamingSound();
		else if ( FRand() > 0.3 )
			PlayThreateningSound();
	}
	if ( (Orders == 'Guarding') && !LineOfSightTo(OrderObject) )
		GotoState('Guarding');
	Goto('Follow');
}

state AlarmPaused
{
ignores HearNoise;

   function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		local bool bWasFriendly;

		bWasFriendly = ( (Enemy != None) && Enemy.bIsPlayer && (AttitudeToPlayer == ATTITUDE_Friendly) );
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			if ( bWasFriendly && (instigatedBy == Enemy) )
				AlarmTag = '';
			if ( AlarmTag == '' )
			{
				NextState = 'Attacking';
				NextLabel = 'Begin';
			}
			else
			{
				NextState = 'TriggerAlarm';
				NextLabel = 'Recover';
			}
			GotoState('TakeHit');
		}
	}

	function Bump(actor Other)
	{
	    if ( Health <= 0 || bDeleteme )
		  return;
		if (Other == Enemy)
			GotoState('MeleeAttack');
		else if ( (Pawn(Other) != None) && SetEnemy(Pawn(Other)) )
			GotoState('MeleeAttack');
		Disable('Bump');
	}

	function FindShootTarget()
	{
		local actor A;

		A = None;
		if ( AlarmPoint(OrderObject).shoottarget != '' )
			ForEach AllActors(class 'Actor', A, AlarmPoint(OrderObject).shoottarget )
				break;

		if ( A == None)
		{
		    if ( Enemy != none && Enemy.health > 0 && !Enemy.bdeleteme && Enemy != self )
			   target = enemy;
		    if ( Target == None )
		    {
               AlarmTag = '';
		       GotoState('Attacking');
		    }
		}
		else
		{
			target = A;
			if ( Pawn(target) != None)
				SetEnemy(pawn(Target));
		}
	}

WaitForEnemy:
	Acceleration = vect(0,0,0);
	FinishAnim();
	TweenToPatrolStop(0.3);
	FinishAnim();
Waiting:
	PlayPatrolStop();
	FinishAnim();
	Goto('Waiting');

Begin:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	{
     AlarmTag = '';
     GotoState('Attacking');
    }
	Acceleration = vect(0,0,0);
	Enable('Timer');
	SetTimer( AlarmPoint(OrderObject).pausetime, false );
	if ( bHasRangedAttack && AlarmPoint(OrderObject).bAttackWhilePaused )
	{
		Enable('EnemyNotVisible');
		if ( AlarmPoint(OrderObject).ShootTarget != '' )
			FindShootTarget();
		else
		{
			if ((Enemy != None) && Enemy.bIsPlayer && ( AttitudeToPlayer > ATTITUDE_Hate) )
			{
			AttitudeToPlayer = ATTITUDE_Hate;
			Target = Enemy;
			}
		}
		if ( AlarmPoint(OrderObject).AlarmAnim != '')
		{
			TweenAnim(AlarmPoint(OrderObject).AlarmAnim, 0.2);
			if (NeedToTurn(Target.Location))
				TurnToward(Target);
			FinishAnim();
			if ( AlarmPoint(OrderObject).AlarmSound != None)
				PlaySound( AlarmPoint(OrderObject).AlarmSound);
			PlayAnim(AlarmPoint(OrderObject).AlarmAnim);
			if ( AlarmPoint(OrderObject).ducktime > 0 )
			{
				if ( Target != Enemy )
					Sleep(AlarmPoint(OrderObject).ducktime);
				else
				{
					if ( TimerRate <= 0 )
						SetTimer( AlarmPoint(OrderObject).ducktime + 1, false);
					MoveTimer = TimerCounter;
					While ( TimerCounter < MoveTimer + AlarmPoint(OrderObject).ducktime )
					{
						TurnToward(Enemy);
						sleep(0.0);
					}
				}
			}
		}
Attack:
    if ( Target == self )
       Target=none;
    if ( Target == None )
	 {
        if ( Enemy != none && Enemy.health > 0 && !Enemy.bdeleteme && Enemy != self )
	    	Target = Enemy;
		if ( Target == None )
		 {
            AlarmTag = '';
			GotoState('Attacking');
		 }
	 }
	if (NeedToTurn(Target.Location))
	{
		PlayTurning();
		TurnToward(Target);
	}
	TweenToFighter(0.15);
	FinishAnim();
	DesiredRotation = Rotator(Target.Location - Location);
	PlayRangedAttack();
	FinishAnim();
	Goto('Attack');
	}

	if ( AlarmPoint(OrderObject).bStopIfNoEnemy)
		Enable('EnemyNotVisible');

	if ( NeedToTurn(Location + AlarmPoint(OrderObject).lookdir) )
	{
		PlayTurning();
		TurnTo(Location + AlarmPoint(OrderObject).lookdir);
	}
	if ( AlarmPoint(OrderObject).AlarmAnim != '')
	{
		TweenAnim(AlarmPoint(OrderObject).AlarmAnim, 0.2);
		FinishAnim();
		PlayAnim(AlarmPoint(OrderObject).AlarmAnim);
	}
	else
	{
		TweenToPatrolStop(0.3);
		FinishAnim();
		PlayPatrolStop();
	}
	sleep( AlarmPoint(OrderObject).pausetime );
	Timer();

WaitForPlayer:
	Disable('AnimEnd');
	NextAnim = '';
	Acceleration = vect(0,0,0);
Wait:
    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	{
        AlarmTag = '';
        GotoState('Attacking');
    }

	if (NeedToTurn(Enemy.Location))
	{
		PlayTurning();
		TurnToward(Enemy);
	}
	TweenToWaiting(0.2);
	FinishAnim();
	PlayWaiting();
	FinishAnim();
	if ((Enemy!=none ) && (VSize(Location - Enemy.Location) > CollisionRadius + Enemy.CollisionRadius + 220)
		|| ((Enemy!=none ) && !Enemy.LineOfSightTo(Self)) )
		Goto('Wait');
	TweenToRunning(0.15);
	gotoState('TriggerAlarm');

WaitAround:
	Disable('AnimEnd');
	Acceleration = vect(0,0,0);
	if ( (AlarmPoint(OrderObject) != None) && NeedToTurn(Location + AlarmPoint(OrderObject).lookdir) )
	{
		PlayTurning();
		TurnTo(Location + AlarmPoint(OrderObject).lookdir);
	}
	if ( (AlarmPoint(OrderObject) != None) && AlarmPoint(OrderObject).AlarmAnim != '')
	{
		TweenAnim(AlarmPoint(OrderObject).AlarmAnim, 0.2);
		FinishAnim();
		PlayAnim(AlarmPoint(OrderObject).AlarmAnim);
		FinishAnim();
	}
	else
	{
		TweenToPatrolStop(0.2);
		FinishAnim();
		if (Enemy!=none && NeedToTurn(Enemy.Location))
		{
			PlayTurning();
			TurnToward(Enemy);
			TweenToPatrolStop(0.2);
		}
		PlayWaitAround();
		FinishAnim();
		PlayWaitAround();
		FinishAnim();
		PlayWaitAround();
		FinishAnim();
		TweenToPatrolStop(0.1);
		FinishAnim();
	}
	if (AlarmTag == '')
		WhatToDoNext('','');
	else
		GotoState('TriggerAlarm');
}

state TriggerAlarm
{
	ignores HearNoise, SeePlayer;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		local bool bWasFriendly;

		bWasFriendly = ( !bNoWait && Enemy.bIsPlayer && (AttitudeToPlayer == ATTITUDE_Friendly) );
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (NextState == 'TakeHit')
		{
			if ( bWasFriendly && (AttitudeToPlayer < ATTITUDE_Friendly) )
			{
				AlarmTag = '';
				NextState = 'Attacking';
				NextLabel = 'Begin';
			}
			else
			{
				NextState = 'TriggerAlarm';
				NextLabel = 'Recover';
			}
			GotoState('TakeHit');
		}
	}

	function EnemyNotVisible()
	{
		if (Enemy != none && AttitudeTo(Enemy) >= ATTITUDE_Ignore)
			GotoState('AlarmPaused', 'WaitForPlayer');
	}

	function Bump(actor Other)
	{
	    if ( Health <= 0 || bDeleteme )
		  return;
		if ( (Pawn(Other) != None) && Pawn(Other).bIsPlayer
			&& (AttitudeToPlayer == ATTITUDE_Friendly) )
			return;

		Super.Bump(Other);
	}

	function AlarmDone()
	{
		local pawn OtherPawn;
		local Actor A;
		local AlarmPoint AlarmSpot;

		AlarmSpot = AlarmPoint(OrderObject);
		if ( AlarmSpot != None )
		{
			if( AlarmSpot.Event != '' )
				foreach AllActors( class 'Actor', A, AlarmSpot.Event )
				{
					if ( (ScriptedPawn(A) != None) && AlarmSpot.bKillMe )
						ScriptedPawn(A).Hated = self;
					A.Trigger( self, instigator );
				}
			if ( AlarmSpot.bDestroyAlarmTriggerer )
			{
				OtherPawn = Level.PawnList;
				while ( OtherPawn != None )
				{
					OtherPawn.Killed(self, self, '');
					OtherPawn = OtherPawn.nextPawn;
				}
				level.game.Killed(self, self, '');
				//log(class$" dying");
				if( Event != '' )
					foreach AllActors( class 'Actor', A, Event )
						A.Trigger( Self, Instigator );
				Weapon = None;
				Level.Game.DiscardInventory(self);
				Destroy();
				return;
			}
			AlarmTag = AlarmSpot.NextAlarm;
			if ( AlarmSpot.pausetime > 0.0 )
			{
				Acceleration = vect(0,0,0);
				if ( Enemy != none && AttitudeTo(Enemy) > ATTITUDE_Ignore)
					GotoState('AlarmPaused', 'WaitAround');
				else
					GotoState('AlarmPaused');
			}
			else if ( AlarmTag != '' )
			{
				FindAlarm();
				GotoState('TriggerAlarm', 'Begin');
			}
			else if (Enemy != none && AttitudeTo(Enemy) > ATTITUDE_Ignore)
			{
				Acceleration = vect(0,0,0);
				GotoState('Roaming');
			}
			else
			{
				bReadyToAttack = true;
				GotoState('Attacking');
			}
			return;
		}

		AlarmTag = '';

		if (AttitudeToPlayer > ATTITUDE_Ignore)
			GotoState('AlarmPaused', 'WaitAround');
		else
		{
			bReadyToAttack = true;
			GotoState('Attacking');
		}
	}

	function BeginState()
	{
		bCanFire = false;
		SpecialGoal = None;
		SpecialPause = 0.0;
		bSpecialPausing = false;
		if ( (Enemy!=none) && !Enemy.bIsPlayer
			|| ((AttitudeToPlayer == ATTITUDE_Fear)
				&& !bInitialFear && (Default.AttitudeToPlayer == ATTITUDE_Friendly)) )
		{
			GotoState('Attacking');
			return;
		}

		FindAlarm();

		if ( (TeamLeader != None) && !TeamLeader.bTeamSpeaking )
			TeamLeader.SpeakOrderTo(self);
	}
}

state Waiting
{
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if ( Enemy != None )
			LastSeenPos = Enemy.Location;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else if ( Enemy != None )
			GotoState('Attacking');
	}

	function Landed(vector HitNormal)
	{
		SetPhysics(PHYS_None);
	}

	function Bump(actor Other)
	{
		//log(Other.class$" bumped "$class);
		if (Pawn(Other) != None)
		{
			if (Enemy == Other)
				bReadyToAttack = True; //can melee right away
			SetEnemy(Pawn(Other));
		}
		if ( TimerRate <= 0 )
			setTimer(1.5, false);
		Disable('Bump');
	}

	function Timer()
	{
       local mover m;
       local bool bstartmove;

       if(Level.TimeSeconds > 10 && Level.TimeSeconds-LastPainTime >10)  //dont fast loop if no escape
       {
         LastPainTime = Level.TimeSeconds; // hijack LastPainTime
         bstartmove=false;
         if( bCanFly || bCanWalk || (Region.Zone.bWaterZone && bCanSwim ) )
         {
           foreach visiblecollidingactors(class'mover', m, CollisionRadius + 200)
           {
             if( base!=m && (m.MoverEncroachType==ME_StopWhenEncroach
                || m.MoverEncroachType==ME_ReturnWhenEncroach))
             {
              bstartmove=true;
              break;
             }
           }
           if(bstartmove )
           {
             SetMovementPhysics();
             WhatToDoNext('Roaming','Begin');
           }
         }
      }
      Enable('Bump');
	}

	function BeginState()
	{
	    if ( !Level.Game.bDeathMatch && AlarmTag == '' && bIsPlayer )
	       bIsPlayer=false;
        Target = None;
        Enemy = None;
        bStasis = false;
        Acceleration = vect(0,0,0);
        SetAlertness(0.0);
	}

TurnFromWall:
    WaitForLanding();
	if ( NearWall(2 * CollisionRadius + 50) )
	{
		PlayTurning();
		TurnTo(Focus);
	}
	Disable('Bump');
	Timer();

Begin:
    WaitForLanding();
	TweenToWaiting(0.4);
	bReadyToAttack = false;
	DesiredRotation = rot(0,0,0);
	DesiredRotation.Yaw = Rotation.Yaw;
	SetRotation(DesiredRotation);
	if (Physics != PHYS_Falling)
		SetPhysics(PHYS_None);

KeepWaiting:
   NextAnim = '';
}

state Ambushing
{
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if ( Enemy != None )
			LastSeenPos = Enemy.Location;

		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
		else if ( Enemy != None )
			GotoState('Attacking');
	}
}

state FallingState
{
ignores Bump, Hitwall, WarnTarget;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if (Enemy == None)
		{
			Enemy = instigatedBy;
			NextState = 'Attacking';
			NextLabel = 'Begin';
		}
		if (Enemy != None)
			LastSeenPos = Enemy.Location;
		if (NextState == 'TakeHit')
		{
			NextState = 'Attacking';
			NextLabel = 'Begin';
			GotoState('TakeHit');
		}
	}
}

state Greeting
{
	ignores SeePlayer, EnemyNotVisible;

	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
							Vector momentum, name damageType)
	{
		local eAttitude AttEn;
		Global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
		if ( health <= 0 || bDeleteme )
			return;
		if ( Enemy != None )
		{
			AttEn = AttitudeTo(Enemy);
			if (NextState == 'TakeHit')
			{
				if (AttEn == ATTITUDE_Fear)
				{
					NextState = 'Retreating';
					NextLabel = 'Begin';
				}
				else
				{
					NextState = 'Attacking';
					NextLabel = 'Begin';
				}
				GotoState('TakeHit');
			}
			else
				GotoState('Attacking');
		}
	}
}

state TakeHit
{
ignores seeplayer, hearnoise, bump, hitwall;


	singular function PlayHitAnim(vector HitLocation, float Damage)
	{
		if ( LastPainTime - Level.TimeSeconds > 0.1 )
		{
			PlayTakeHit(0.1, hitLocation, Damage);
			BeginState();
			GotoState('TakeHit', 'Begin');
		}
	}

	function BeginState()
	{
		LastPainTime = Level.TimeSeconds;
		LastPainAnim = AnimSequence;
		if(NextState == 'TakeHit')
		   NextState = '';
	}

Begin:
	// Acceleration = Normal(Acceleration);
	FinishAnim();
	if ( skill < 2 )
		Sleep(0.05);
	if ( (Physics == PHYS_Falling) && !Region.Zone.bWaterZone )
	{
		Acceleration = vect(0,0,0);
		NextAnim = '';
		GotoState('FallingState', 'Ducking');
	}
	else if (NextState != '' && NextState != 'TakeHit')
		GotoState(NextState, NextLabel);
	else
		GotoState('Attacking');
}

auto state StartUp
{
  function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, name damageType)
  {}

Begin:
	SetHome();
	if (SharedAlarmTag != '')
		SetAlarm();
	if ( !Level.Game.bDeathMatch && AlarmTag == '' && bIsPlayer )
	    bIsPlayer=false;
	if (TeamTag != '')
		SetTeam();
	if (Orders == 'Guarding')
	{
		OrderObject = Spawn(class 'GuardPoint');
		if (OrderTag != '')
			Tag = OrderTag; //so will be triggered if guarded object is touched
	}
	else if (!bFixedStart)
	{
		if (Orders == 'Patroling')
			InitPatrolLoc();
		else if (Orders == 'Ambushing')
			InitAmbushLoc();
	}

	if (Orders != '')
	{
		if (Orders == 'Attacking')
		{
			Orders = '';
			if (enemy != None)
				GotoState('Attacking');
			else
				StartRoaming();
		}
		else if ( bDelayedPatrol && (Orders == 'Patroling') )
			GotoState('Patroling', 'DelayedPatrol');
		else
			GotoState(Orders);
		if ( Physics == PHYS_Falling )
			SetFall();
		else
			SetMovementPhysics();
	}
	else
		GotoState('Waiting');
}

defaultproperties
{
}
