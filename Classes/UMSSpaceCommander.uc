//=============================================================================
// UMSSpaceCommander - GFour
// WIP -- Not sure what i fully want this guy to do right now.
//=============================================================================
class UMSSpaceCommander extends UMSSpecialForces;

Var() float fReinforceRadius;
Var() bool bCallBackup;
Var() class <umsspacemarine> cBackup[2];
Var() class <Weapon> cBackupWeaponType[2];

var bool Beamed;
//var Effects Glowy;

function PostBeginPlay()
{
    //Glowy=Spawn(Class'UMSGlowyVisorCom',Self,,Location,Rotation);
    GiveItems();
    Super.PostBeginPlay();
}

Function FireWeapon()
{
    if(bDoSpecial && bCallBackup && Health < Default.Health/3 && !Beamed && FRand() < 0.5 )
    GotoState('CallBackup');
    else
    super.FireWeapon();
}

state CallBackup
{
    ignores SeePlayer, EnemyNotVisible, HearNoise, Bump, HitWall, HeadZoneChange, 	FootZoneChange, ZoneChange, Falling, WarnTarget, DamageAttitudeTo, PlayTakeHit;


begin:
Velocity*=0;
Acceleration*=0;
PlayAnim('Talk',1.2,0.2);
PlaySound(Sound'UMSMarinesII.UMSMarines.st8', SLOT_Interact);
if(!bIsFemale)
PlaySound(Sound'UMSMarinesII.Marine.Backupm', SLOT_Interact);
else
PlaySound(Sound'UMSMarinesII.Marine.Backupf', SLOT_Interact);
FinishAnim();
BeamBrothers();    
GotoState('Attacking');
}

function BeamBrothers()
{
	local int i,M,W,SM,Rand;
	local umsspacemarine NewMarine;
	local UMSMarineBeampoint MSP;
    local vector SpawnLoc;

    while(SM < 2)
    {
        NewMarine=None;
        while(!bool(NewMarine) && i<2000)
        {
            SpawnLoc=Location+((VRand()*vect(1,1,0))*fReinforceRadius);
            NewMarine=Spawn(cBackup[M++],,,SpawnLoc,Rotation);
            i++;

			if(NewMarine!=None)
			{
				NewMarine.WeaponType = cBackupWeaponType[W++];
				NewMarine.bBeamingIn = True;
				NewMarine.Enemy = Enemy;
				NewMarine.Target = Target;
                Beamed=True;
            }
        }
        SM++;
    }
}

Function GiveItems()
{
    local ShieldBelt SB;
    Local Armor AM;

    bIsPlayer=True;
    SB=Spawn(class'ShieldBelt');
    SB.Touch(Self);
    AM=Spawn(class'Armor');
    AM.Touch(Self);
    bIsPlayer=False;
}

defaultproperties
{
	fReinforceRadius=192.0
	bCallBackup=True
	cBackup(0)=Class'UMSMarinesII.UMSEliteMarine'
	cBackup(1)=Class'UMSMarinesII.UMSEliteMarine'
	cBackupWeaponType(0)=Class'UnrealShare.ASMD'
	cBackupWeaponType(1)=Class'UnrealShare.ASMD'
    WeaponType=Class'UnrealShare.Automag'
	Health=200
}