//=============================================================================
// UMSEliteMarine
//=============================================================================
class UMSEliteMarine extends UMSSpecialForces;

var bool bShieldOn;
var float ShieldCDTime;
var float NoEnemyTick;
var inventory SB;

Function Tick(Float DeltaTime)
{
    if(Enemy == None)
    {
        NoEnemyTick+=DeltaTime;
        if(ShieldCDTime > 0)
        ShieldCDTime -= DeltaTime;
        if(SB != None && NoEnemyTick>5)
        {
          NoEnemyTick=0;
          GotoState('TurnOffShield');
        }
    }
}

Function AddArmor()
{
    if(!bShieldOn && ShieldCDTime <= 0)
    {
		SB=Spawn(class'UMSEliteBelt');
		bIsPlayer = True;
		SB.Touch(self);
		bIsPlayer = False;
        bShieldOn=True;
    }
}

Function RemoveArmor()
{
	PlaySound(Sound'UnrealShare.Pickups.Sbelthe2', SLOT_Interact);
	SB.Destroy();
	SB=None;
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
GotoState('TacticalMove');
}

state TurnOffShield
{
	ignores SeePlayer, EnemyNotVisible, HearNoise, Bump, HitWall, HeadZoneChange, 	FootZoneChange, ZoneChange, Falling, WarnTarget, DamageAttitudeTo, PlayTakeHit;

	Function EndState()
	{
		if(Health>0)
		RemoveArmor();
		Super.EndState();
	}

begin:
Velocity*=0;
Acceleration*=0;
PlayAnim('Activate',1.4,0.2);
PlaySound(Sound'Activates.Beeps.Mactiv63', SLOT_Interact);
FinishAnim();
GotoState('Attacking');
}

state BeamingIn
{
	ignores EnemyAcquired, PeerNotification, TakeDamage, SeePlayer, EnemyNotVisible, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, 
			FootZoneChange, ZoneChange, Falling, WarnTarget, Died;

	function EndState()
	{
		if(bBeamingIn)
		GotoState('TurnOnShield');
		Super.EndState();
	}
}

state Acquisition
{
	ignores falling, landed;

	Function BeginState()
	{
		if(!bShieldOn && ShieldCDTime <= 0)
		GotoState('TurnOnShield');
		Super.BeginState();
	}
}

defaultproperties
{
	//bPrefersRanged=True
    bShieldOn=False
	WeaponType=Class'ASMD'
	HumanKillMessage=" was blown away by a UMS Elite Soldier"
	bWarnTarget=False
	CombatStyle=1
    Skill=3.0
	MenuName="UMS Elite Soldier"
	MultiSkins(1)=Texture'UMSMarinesII.Skins.EMarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.EMarine2'
	GlowyBits=(EffectMultiSkin1=None,EffectMultiSkin2=None,ExtraEffect=Texture'UMSMarinesII.FX.MarineVisorGlowBasic',ExtraEffectLayer=MultiSkin1)
}