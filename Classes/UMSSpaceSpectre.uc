//=============================================================================
// UMSSpaceSpectre - GFour
//=============================================================================
class UMSSpaceSpectre extends UMSSpecialForces;

#exec texture IMPORT NAME=SMarine1 FILE=MODELS\UMSBlackOpMarine.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=SMarine2 FILE=MODELS\UMSBlackOpMarine2.PCX GROUP=Skins LODSET=2
#exec texture IMPORT NAME=MarineBlackOpsGlow FILE=MODELS\UMSBlackOpMarineNV.PCX GROUP=Skins LODSET=2

var sound CloakAmbient;
var sound cloakon;
var sound cloakoff;
var(UMSSpecialForces) float CloakDuration;
var(UMSSpecialForces) float CooldownDuration;
//var() bool bAlwaysCloak;//--OBSOLETE--DELETE ME
var float CloakTimer;

var bool bCloaked;
var bool bCooldown;
var bool bExpanding;
var texture CloakTexture;
var Effects GhostT;

var Effects Glowy;

Function PostBeginPlay()
{
    Glowy=Spawn(Class'UMSGlowyVisor',Self,,Location,Rotation);
	//if(bAlwaysCloak)
	//CloakingTime();
	CloakTimer=0;
	Super.PostBeginPlay();
}

Function Tick(float DeltaTime)
{
	if(bCloaked && !bCooldown && !bAutoDoSpecial)
	{
		CloakTimer -= DeltaTime;
		//Log(CloakTimer);
		if(CloakTimer <= 0)
		{
			EndCloak();
		}
	}
	else if (bCooldown)
	{
		CloakTimer -= DeltaTime;
		if(CloakTimer <= 0)
		{
			bCooldown=False;
		}
	}

	if(bCloaked)
	{
		if( Fatness > 115 && !bExpanding )
		{
			Fatness -= 2;
			ScaleGlow-=1;
			Weapon.ScaleGlow-=1;
		}
		else
		{
			bExpanding = True;
			if(Fatness < 128 )
			{
				Fatness += 2;
				ScaleGlow+= 1;
				Weapon.ScaleGlow+=1;
			}
			else
				bExpanding = False;
		}
    	GhostT=Spawn(Class'UMSGhostTrail',Self,,Location,Rotation);
	}
	else if(!bCloaked)
	{
		Fatness=Default.Fatness;
		ScaleGlow=Default.ScaleGlow;
		Weapon.ScaleGlow=Weapon.Default.ScaleGlow;
	}
}

Function FireWeapon()
{
    if(bDoSpecial && !bAutoDoSpecial && !bCooldown && !bCloaked && FRand() < 0.45 )
    GotoState('BlackOpsSpecial');
    else
    super.FireWeapon();
}

Function CloakingTime()
{
	if(!bCloaked)
	{
		Glowy.Destroy();
		CloakTimer=CloakDuration;
	 	//bunlit=true;
     	ScaleGlow = 0.2;
     	bMeshEnviroMap=true;
     	texture = CloakTexture;
	 	style=STY_Translucent;
		CombatStyle=1;
		GroundSpeed=default.GroundSpeed*1.5;
		log(GroundSpeed);
     	if( Weapon != none )
     	{
     		Weapon.bunlit=true;
	  		Weapon.ScaleGlow = 0.2;
      		Weapon.bMeshEnviroMap=true;
      		Weapon.texture = CloakTexture;
      		weapon.style=STY_Translucent;
		}
    	PlaySound(cloakon);
    	AmbientSound = CloakAmbient;
		bCloaked=True;
	}
}

Function EndCloak()
{
	if(bCloaked)
	{
    	Glowy=Spawn(Class'UMSGlowyVisor',Self,,Location,Rotation);
		bCloaked=False;
		bCooldown=True;
		CloakTimer=CooldownDuration;
		GroundSpeed=default.GroundSpeed;
		bunlit=default.bunlit;
		ScaleGlow = default.ScaleGlow;
		bMeshEnviroMap=default.bMeshEnviroMap;
		texture = default.texture;
		style=default.style;
		CombatStyle=default.CombatStyle;
		if( Weapon != none )
		{
			 Weapon.bunlit=Weapon.default.bunlit;
			 Weapon.ScaleGlow = Weapon.default.ScaleGlow;
			 Weapon.bMeshEnviroMap=Weapon.default.bMeshEnviroMap;
			 Weapon.texture = weapon.default.Texture;
			 weapon.style=Weapon.default.style;
		}
		AmbientSound = none;
		PlaySound(cloakoff);
	}
}

state BlackOpsSpecial
{
	ignores SeePlayer, EnemyNotVisible, HearNoise, Bump, HitWall, HeadZoneChange, 	FootZoneChange, ZoneChange, Falling, WarnTarget, DamageAttitudeTo, PlayTakeHit;

	Function EndState()
	{
		if(Health>0)
		CloakingTime();
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
		CloakingTime();
	}
}

function Died(pawn Killer, name damageType, vector HitLocation)
{
	EndCloak();
	Super.Died(Killer,DamageType,hitlocation);
}

defaultproperties
{
	Health=100
	CloakDuration=4
	CooldownDuration=8
	WeaponType=class'UnrealShare.Flakcannon'
	CloakAmbient=Sound'UMSMarinesII.Marinsuit.MCloakL'
	CloakOn=Sound'UMSMarinesII.Marinsuit.PowerON'
	CloakOff=Sound'UMSMarinesII.Marinsuit.PowerOFF'
	bExpanding=False
	CloakTexture=Texture'UMSMarinesII.Marinsuit.MCloak'
	HumanKillMessage=" was assassinated by a UMS Spectre Marine"
	DispPowerLevel=4
	CombatStyle=0.3
	MenuName="UMS Spectre Marine"
	MultiSkins(1)=Texture'UMSMarinesII.Skins.SMarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.SMarine2'
}
