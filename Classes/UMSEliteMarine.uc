//=============================================================================
// UMSEliteMarine
//=============================================================================

class UMSEliteMarine extends UMSSpecialForces;

#exec texture IMPORT NAME=EMarine1 FILE=MODELS\banditmarine1.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=EMarine2 FILE=MODELS\banditmarine2.PCX GROUP=Skins LODSET=2

//var() bool bShieldBeltOn; //--OBSOLETE--DELETE ME

var bool bShieldOn;
var bool bCheckedWeapon;

var inventory SB;
var Effects Glowy;

Function PostBeginPlay()
{
    Glowy=Spawn(Class'UMSGlowyVisor2',Self,,Location,Rotation);
	Super.PostBeginPlay();
}

Function FireWeapon()
{
    if(bDoSpecial && !bAutoDoSpecial && !bShieldOn)
    GotoState('TurnOnShield');
    else
    super.FireWeapon();
}

Function AddArmor()
{
    if(!bShieldOn)
    {
		SB=Spawn(class'UMSEliteBelt');
		bIsPlayer = True;
		SB.Touch(self);
		bIsPlayer = False;
        bShieldOn=True;
    }
}

state TurnOnShield
{
	ignores SeePlayer, EnemyNotVisible, HearNoise, Bump, HitWall, HeadZoneChange, 	FootZoneChange, ZoneChange, Falling, WarnTarget, DamageAttitudeTo, PlayTakeHit;

	Function EndState()
	{
		if(Health>0)
		AddArmor();
		Super.EndState();
	}

begin:
Velocity*=0;
Acceleration*=0;
PlayAnim('Activate',1.4,0.2);
PlaySound(Sound'Activates.Beeps.Mactiv63', SLOT_Interact);
FinishAnim();
//CloakingTime();
GotoState('TacticalMove');
}

auto state StartUp
{
	function sethome()
	{
		Super.sethome();
		if(bAutoDoSpecial)
		AddArmor();
	}
}


function PreSetMovement()
{
	if ( Skill >= 3 )
		RotationRate.Yaw = 100000;
	else
		RotationRate.Yaw = 30000 + 16000 * skill;
	if (JumpZ > 0)
		bCanJump = true;
	bCanWalk = true;
	bCanSwim = true;
	bCanFly = false;
	MinHitWall = -0.5;
	bCanOpenDoors = true;
	bCanDoSpecial = true;
    if ( Skill > 3 )
     Skill=3;
    MaxDesiredSpeed = 0.7 + 0.1 * skill;
    PunchDamage=default.PunchDamage + (skill *4);
    SlamDamage=default.PunchDamage  + (skill *4);
 	if ( skill <= 1 )
 		bCanDuck = false;
 	else
  		bCanDuck = true;
}

state Charging
{
ignores SeePlayer, HearNoise;

    function TweenToRunning(float tweentime)
    {
	   if (Region.Zone.bWaterZone )
	   {
			TweenToSwimming(tweentime);
			return;
	   }
       BaseEyeHeight = Default.BaseEyeHeight;
       EyeHeight = BaseEyeHeight;
	   if (Weapon == None)
	   {
	     global.TweenToRunning(tweentime);
	     return;
	   }
	   else if (Enemy == None)
	   {
		   if (Weapon.Mass < 20)
			   TweenAnim('WalkSM', tweentime);
		   else
			   TweenAnim('WalkLG', tweentime);
       }

	   else
	   {
		   if (Weapon.Mass < 20)
			   TweenAnim('WalkSMFR', tweentime);
		   else
			   TweenAnim('WalkLGFR', tweentime);
       }
    }

	function BeginState()
	{
      bGetResponse=false;
      if ( Level.TimeSeconds - LastTalkTime > 2.0 && LastTalker!=self)
       {
	    ChargePhrase();
        if (bGetResponse)
        {
          NotifyPeers( 'respond', Enemy );
          bRespond=false;
        }
       }
      if ( Enemy != None && Enemy.Health >0 )
       NotifyPeers( 'Attack', Enemy );
 	  Super(UMSSpaceMarine).BeginState();
	}

	function EndState()
	{
	    super(UMSSpaceMarine).EndState();
	}
}

state TacticalMove
{
ignores SeePlayer, HearNoise;

	function Timer()
	{
		bReadyToAttack = True;
   	    if ( Health <=0 || bDeleteme )
	      return;
	    Enable('Bump');
	    if ( Enemy == none || Enemy.health <= 0 || Enemy.bdeleteme || Enemy == self )
	    {
        	GotoState('Attacking');
        	return;
        }
		Target = Enemy;
		if (VSize(Enemy.Location - Location)
				<= (MeleeRange + Enemy.CollisionRadius + CollisionRadius))
			GotoState('MeleeAttack');
		else if ( FRand() > 0.2 *(skill/skill))
			GotoState('RangedAttack');
	}

    function TweenToRunning(float tweentime)
    {
	   if (Region.Zone.bWaterZone )
	   {
			TweenToSwimming(tweentime);
			return;
	   }
       BaseEyeHeight = Default.BaseEyeHeight;
       EyeHeight = BaseEyeHeight;
	   if (Weapon == None)
	   {
	     global.TweenToRunning(tweentime);
	     return;
	   }
	   else if (Enemy == None)
	   {
		   if (Weapon.Mass < 20)
			   TweenAnim('WalkSM', tweentime);
		   else
			   TweenAnim('WalkLG', tweentime);
       }

	   else
	   {
		   if (Weapon.Mass < 20)
			   TweenAnim('WalkSMFR', tweentime);
		   else
			   TweenAnim('WalkLGFR', tweentime);
       }
    }

    function PlayRunning()
    {
	   local vector X,Y,Z, Dir;

       if (Region.Zone.bWaterZone )
	   {
		   PlaySwimming();
		   return;
	   }
	   if(strafedodge )
	   {
	       	Global.PlayRunning();
	        return;
	   }
       if(Weapon != None)
        DesiredSpeed = WalkingSpeed * MaxDesiredSpeed;
       else
        DesiredSpeed = MaxDesiredSpeed;
       BaseEyeHeight = Default.BaseEyeHeight;
       EyeHeight = BaseEyeHeight;

	// determine facing direction
       GetAxes(Rotation, X,Y,Z);
       Dir = Normal(Acceleration);
	   if ( (Dir dot X < 0.75) && (Dir != vect(0,0,0)) )
	   {
		// strafing or backing up
		   if ( Dir dot X < -0.75 )
	       {
		      if (Weapon == None)
				LoopAnim('BackStep',-7/GroundSpeed,, 0.5);
		      else
		      {
		         if (Weapon.Mass < 20)
				    LoopAnim('BackStepSMFR',-7/GroundSpeed,, 0.5);
			     else
				    LoopAnim('BackStepLGFR',-7/GroundSpeed,, 0.5);
		      }

	       }
		   else if ( Dir Dot Y > 0 )
			{
		      if (Weapon == None)
				LoopAnim('BackStep',-7/GroundSpeed,, 0.5);
		      else
		      {
		         if (Weapon.Mass < 20)
				    LoopAnim('BackStepSMFR',-7/GroundSpeed,, 0.5);
			     else
				    LoopAnim('BackStepLGFR',-7/GroundSpeed,, 0.5);
		      }
			}
		   else
			{
		      if (Weapon == None)
				LoopAnim('BackStep',-7/GroundSpeed,, 0.5);
		      else
		      {
		         if (Weapon.Mass < 20)
				    LoopAnim('BackStepSMFR',-7/GroundSpeed,, 0.5);
			     else
				    LoopAnim('BackStepLGFR',-7/GroundSpeed,, 0.5);
		      }
			}
	   }
       else if(Weapon == None)
	   {
		global.PlayRunning();
        return;
       }
	   else if ( Weapon.bPointing )
	   {
		   if (Weapon.Mass < 20)
		       LoopAnim('WalkSMFR',-7/GroundSpeed,, 0.5);
		   else
			   LoopAnim('WalkLGFR',-7/GroundSpeed,, 0.5);
	   }
	   else if (Enemy == None)
	   {
	       if (Weapon.Mass < 20)
		       LoopAnim('WalkSM',-7/GroundSpeed,, 0.5);
		   else
		       LoopAnim('WalkLG',-7/GroundSpeed,, 0.5);
	   }
       else
	   {
	       if (Weapon.Mass < 20)
	           LoopAnim('WalkSMFR',-7/GroundSpeed,, 0.5);
		   else
		       LoopAnim('WalkLGFR',-7/GroundSpeed,, 0.5);
	   }
    }

    function WarnTarget(Pawn shooter, float projSpeed, vector FireDir)
    {
    	local float enemyDist;
    	local eAttitude att;
    	local vector X,Y,Z, enemyDir;

    	if ( health <= 0 )
    		return;
    	if ( bCanFire && (FRand() < 0.4) )
    		return;
    	att = AttitudeTo(shooter);
    	if ( (att == ATTITUDE_Ignore) || (att == ATTITUDE_Threaten) )
    	{
    		if ( intelligence >= BRAINS_Mammal )
    			damageAttitudeTo(shooter);
    		if (att == ATTITUDE_Ignore)
    			return;
    	}

    	// AI controlled creatures may duck if not falling
    	if ( !bCanDuck || (Enemy == None) || (Physics == PHYS_Falling) || (Physics == PHYS_Swimming) )
    		return;

    	if ( bIsPlayer )
    	{
    		if ( FRand() > 0.33 * skill )
    			return;
    	}
    	else if ( FRand() > 0.55 + 0.15 * skill )
     		return;

    	// and projectile time is long enough
    	enemyDist = VSize(shooter.Location - Location);
    	if (enemyDist/projSpeed < 0.11 + 0.15 * FRand())
    		return;

    	// only if tight FOV
    	GetAxes(Rotation,X,Y,Z);
    	enemyDir = (shooter.Location - Location)/enemyDist;
    	if ((enemyDir Dot X) < 0.8)
    		return;

    	if ( (FireDir Dot Y) > 0 )
    	{
    		Y *= -1;
    		TryToDuck(Y, true);
    	}
    	else
    		TryToDuck(Y, false);

    }

 	function TryToDuck(vector duckDir, bool bReversed)
	{
		local vector extent, HitLocation, HitNormal;
		local actor HitActor;

	    if ( Health <=0 || bDeleteme )
		   return;
		strafedodge=true;
		Extent.X = CollisionRadius;
		Extent.Y = CollisionRadius;
		Extent.Z = CollisionHeight;
		HitActor = Trace(HitLocation, HitNormal, Location + 100 * duckDir, Location, false, Extent);
		if (HitActor != None)
		{
			duckDir *= -1;
			HitActor = Trace(HitLocation, HitNormal, Location + 100 * duckDir, Location, false, Extent);
		}
		if (HitActor != None)
			return;

		if ( Physics == PHYS_Walking )
		{
			HitActor = Trace(HitLocation, HitNormal, Location + 100 * duckDir - MaxStepHeight * vect(0,0,1), Location + 100 * duckDir, false, Extent);
			if ( HitActor == None )
				return;
		}
		Destination = Location + 250 * duckDir;
	}
}

function PlayWalking()
{
	local vector X,Y,Z, Dir;

	if (Region.Zone.bWaterZone )
	{
		PlaySwimming();
		return;
	}

    DesiredSpeed = WalkingSpeed * MaxDesiredSpeed;
    BaseEyeHeight = Default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;

	// determine facing direction
	GetAxes(Rotation, X,Y,Z);
	Dir = Normal(Acceleration);
	if ( (Dir Dot X < 0.75) && (Dir != vect(0,0,0)) )
	{
		// strafing or backing up
		if ( Dir Dot X < -0.75 )
		{
			if (Weapon == None)
				LoopAnim('BackStep');
			else
			{
			 if (Weapon.Mass < 20)
				LoopAnim('BackStepSMFR');
			 else
				LoopAnim('BackStepLGFR');
			}

		}
		   else if ( Dir Dot Y > 0 )
			{
		      if (Weapon == None)
				LoopAnim('BackStep',-7/GroundSpeed,, 0.5);
		      else
		      {
		         if (Weapon.Mass < 20)
				    LoopAnim('BackStepSMFR',-7/GroundSpeed,, 0.5);
			     else
				    LoopAnim('BackStepLGFR',-7/GroundSpeed,, 0.5);
		      }
			}
		   else
			{
		      if (Weapon == None)
				LoopAnim('BackStep',-7/GroundSpeed,, 0.5);
		      else
		      {
		         if (Weapon.Mass < 20)
				    LoopAnim('BackStepSMFR',-7/GroundSpeed,, 0.5);
			     else
				    LoopAnim('BackStepLGFR',-7/GroundSpeed,, 0.5);
		      }
			}
	}
	else if (Weapon == None)
	{
		if (Enemy == None)
			LoopAnim('Walk');
		else
			LoopAnim('Walkdisarmed');
	}
	else if ( Weapon.bPointing )
	{
		if (Weapon.Mass < 20)
			LoopAnim('WalkSMFR');
		else
			LoopAnim('WalkLGFR');
	}
	else if (Enemy == None)
	{
		if (Weapon.Mass < 20)
			LoopAnim('WalkSM');
		else
			LoopAnim('WalkLG');
	}
	else
	{
		if (Weapon.Mass < 20)
			LoopAnim('WalkSMFR');
		else
			LoopAnim('WalkLGFR');
	}
}

function PushButtons()
{
 local float decision, animspeed;

 animspeed = 0.4 + 0.6 * FRand();
 decision = FRand();
 if (decision < 0.2)
 {
   if (Weapon == None)
		LoopAnim('BreathUNARMED', animspeed);
   else if (Weapon.Mass < 20)
		LoopAnim('BreathSM', animspeed);
   else
    	LoopAnim('BreathLG', animspeed);
 }
 else if (decision < 0.4)
 {
  LoopAnim('Activate', animspeed);
 }
 else
  LoopAnim('Button', animspeed);
}

function PlayMeleeAttack()
{
	if ((Region.Zone.bWaterZone || Physics == PHYS_Flying) && weapon!=none)
	{
		PlayRangedAttack();
		return;
	}
   	if ( (Weapon == None) || (Weapon.Mass < 20) )
	{
		if (Frand()<0.5)
     			PlayAnim('Punch');
		else
	 		PlayAnim('Slam');
	}
	else
	{
		if (Frand()<0.5)
     			PlayAnim('RifleStomp');
		else
	 		PlayAnim('RifleStomp2');
	}
}

state Acquisition
{
 ignores falling, landed;

	function SeePlayer(Actor SeenPlayer)
	{
		if ( SetEnemy(Pawn(SeenPlayer)) )
		{
			MakeNoise(1.0);
			LastSeenPos = Enemy.Location;
		}
	}

Playout:
		//  hurry up
Begin:
 Acceleration = vect(0,0,0);
 SetMovementPhysics();
 if (Level.TimeSeconds - LastTalkTime > 2.0)
    AcquirePhrase();
 if (Enemy!=none)
 {
  LastSeenPos = Enemy.Location;
  NotifyPeers( 'Attack', Enemy );
 }
 if ( LastTalker==self )
 {
    if (NeedToTurn(LastSeenPos))
     {
   		PlayTurning();
        TurnTo(LastSeenPos);
        FinishAnim();
     }
     MakeNoise(1.0);
	 NextAnim = '';
	 gotoState( 'Attacking' );
 }
 if (LastTalker !=none && LastTalker!=self && LastTalker.Health >0)
 {
	//log("state acquisition ....last talker "$LastTalker);
   if ( Enemy == LastTalker.Enemy && LastTalker.Enemy!=none && LastTalker.Enemy.Health >0)
	{
     if (LineOfSightTo(LastTalker) )
	 {
      if (LastTalker.bTeamLeader )
 	  {
       TurnToward( LastTalker );
	   PlayAnim( 'Salute', 1.0 );
       if( !bIsFemale )
	    {
		    Randsir = Rand( 2 );
		    if (Randsir==0)
              {
			   PlaySound( sound'UMSMarinesII.MS208a', SLOT_Talk );  //yes sir
	           PlaySound( sound'UMSMarinesII.MS208a', SLOT_None );  //yes sir
              }
            else if (Randsir==1)
              {
               PlaySound( sound'UMSMarinesII.MS208b', SLOT_Talk );  //yes sir
               PlaySound( sound'UMSMarinesII.MS208b', SLOT_None );  //yes sir
              }
		}
		else
		{
            Randsir = Rand( 2 );
			if (Randsir==0)
              {
			   PlaySound( sound'UMSMarinesII.MS308a', SLOT_Talk );  //yes sir
               PlaySound( sound'UMSMarinesII.MS308a', SLOT_None );  //yes sir
              }
			else if (Randsir==1)
              {
               PlaySound( sound'UMSMarinesII.MS308b', SLOT_Talk );  //yes sir
               PlaySound( sound'UMSMarinesII.MS308b', SLOT_None );  //yes sir
              }
		}
     }
     else
     {
	  if (FRand()< 0.4)
       {
        TurnToward( LastTalker );
	    PlayAnim( 'Wave2b', 1.6 );
	   }
	 }
	}
    else
      PlayAnim( 'Talk', 0.5 );
    FinishAnim();
   }
  if (NeedToTurn(LastSeenPos))
  {
  	 PlayTurning();
     TurnTo(LastSeenPos);
     FinishAnim();
  }
 }
 GotoState( 'Attacking' );
}

state RangedAttack
{
ignores SeePlayer, HearNoise, Bump;


	function TryToDuck(vector duckDir, bool bReversed)
	{
		local vector extent, HitLocation, HitNormal;
		local actor HitActor;

	    if ( Health <=0 || bDeleteme )
		   return;
		strafedodge=true;
		Extent.X = CollisionRadius;
		Extent.Y = CollisionRadius;
		Extent.Z = CollisionHeight;
		HitActor = Trace(HitLocation, HitNormal, Location + 100 * duckDir, Location, false, Extent);
		if (HitActor != None)
		{
			duckDir *= -1;
			HitActor = Trace(HitLocation, HitNormal, Location + 100 * duckDir, Location, false, Extent);
		}
		if (HitActor != None)
			return;

		if ( Physics == PHYS_Walking )
		{
			HitActor = Trace(HitLocation, HitNormal, Location + 100 * duckDir - MaxStepHeight * vect(0,0,1), Location + 100 * duckDir, false, Extent);
			if ( HitActor == None )
				return;
		}
		Destination = Location + 250 * duckDir;
		TweenToRunning(0.15);
		GotoState('TacticalMove', 'DoStrafeMove');
	}
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
				if (!bIsPlayer || (2.5 * FRand() > (skill/skill) ) )
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

state MeleeAttack
{
ignores SeePlayer, HearNoise, Bump;


	function BeginState()
	{
	  Super(UMSSpaceMarine).BeginState();
      bCanDuck = false;
	  bFire = 0;
	  bAltFire = 0;
	}

	function EndState()
	{
	    super(UMSSpaceMarine).EndState();
 	    if ( skill <= 1 )
 	      bCanDuck = false;
    	else
  		  bCanDuck = true;
	}
}


defaultproperties
{
    bShieldOn=False
	WeaponType=Class'ASMD'
	HumanKillMessage=" was blown away by a UMS Elite Soldier"
	DispPowerLevel=5
	bWarnTarget=False
	Health=100
	CombatStyle=0.3
    Skill=3.0
	MenuName="UMS Elite Soldier"
	MultiSkins(1)=Texture'UMSMarinesII.Skins.EMarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.EMarine2'
}