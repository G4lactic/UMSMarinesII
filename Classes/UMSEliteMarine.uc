//=============================================================================
// UMSEliteMarine
//=============================================================================

class UMSEliteMarine extends UMSSpecialForces;

var bool bShieldOn;
var bool bCheckedWeapon;

var inventory SB;

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

defaultproperties
{
	bPrefersRanged=True
    bShieldOn=False
	WeaponType=Class'ASMD'
	HumanKillMessage=" was blown away by a UMS Elite Soldier"
	bWarnTarget=False
	Health=100
	CombatStyle=1
    Skill=3.0
	MenuName="UMS Elite Soldier"
	MultiSkins(1)=Texture'UMSMarinesII.Skins.EMarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.EMarine2'
	GlowyBits=(EffectMultiSkin1=None,EffectMultiSkin2=None,ExtraEffect=Texture'UMSMarinesII.FX.MarineVisorGlowBasic',ExtraEffectLayer=MultiSkin1)
}