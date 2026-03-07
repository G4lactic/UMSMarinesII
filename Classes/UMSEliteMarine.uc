//=============================================================================
// UMSEliteMarine
//=============================================================================

class UMSEliteMarine extends UMSSpecialForces;

#exec texture IMPORT NAME=EMarine1 FILE=Textures\Skins\banditmarine1.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=EMarine2 FILE=Textures\Skins\banditmarine2.PCX GROUP=Skins LODSET=2

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

defaultproperties
{
	bPerfersRanged=True
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
}