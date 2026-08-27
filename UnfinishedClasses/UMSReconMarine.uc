//=============================================================================
// UMSReconMarine - GFour
// Do not set bDoSpecial to true. please.
//=============================================================================
class UMSReconMarine extends UMSSpecialForces;

var(UMSSpecialForces) Sound CloakedAmbientSound;
var(UMSSpecialForces) Sound CloakingSound;
var(UMSSpecialForces) Sound DeCloakingSound;
var(UMSSpecialForces) Float RevealOnHitDuration;

var bool bCloaked;
var float WeaponCooldown;
var bool bWCD;
var bool bExpanding;
var Effects GhostT;

Function FireWeapon()
{
	DeCloakEvent();
	if(!bWCD && bCloaked)
	{
		Super.FireWeapon();
		bWCD=True;
	}
	else
	Super.FireWeapon();
}

Function DoSpecial()
{
	if(!bCloaked)
	{
		bCloaked=True;
     	if( Weapon != none )
     	{
     		Weapon.bunlit=true;
	  		Weapon.ScaleGlow = 0.2;
      		Weapon.bMeshEnviroMap=true;
      		Weapon.texture = Texture;
      		weapon.style=STY_Translucent;
		}
		bMeshEnviroMap=True;
		STYLE=STY_Translucent;
		ScaleGlow=5;
		bUnlit=True;
	}
}

Function DeCloakEvent()
{
	if(bCloaked)
	{
		bCloaked=False;
     	if( Weapon != none )
     	{
     		Weapon.bunlit=Weapon.default.bunlit;
	  		Weapon.ScaleGlow = Weapon.default.scaleglow;
      		Weapon.bMeshEnviroMap=Weapon.default.bMeshEnviroMap;
      		Weapon.texture = Weapon.default.Texture;
      		weapon.style=Weapon.default.style;
		}
		bMeshEnviroMap=default.bMeshEnviroMap;
		STYLE=default.style;
		ScaleGlow=default.scaleglow;
		bUnlit=default.bunlit;
	}
}

Function Tick(float DeltaTime)
{
	/*if(bCloaked)
	{
		CloakTimer -= DeltaTime;
		//Log(CloakTimer);
		if(CloakTimer <= 0)
		{
			EndCloak();
		}
	}*/
	/*else if (bCooldown)
	{
		CloakTimer -= DeltaTime;
		if(CloakTimer <= 0)
		{
			bCooldown=False;
		}
	}*/

	if(bWCD)
	{
		DoSpecial();
		WeaponCooldown -= DeltaTime;
		Log(WeaponCooldown);
		if(WeaponCooldown <= 0)
		{
			bWCD=False;
		}
	}

	if(bCloaked)
	{
		if( Fatness > 115 && !bExpanding )
		{
			Fatness -= 2;
			ScaleGlow-=1.5;
			Weapon.ScaleGlow-=1;
		}
		else
		{
			bExpanding = True;
			if(Fatness < 128 )
			{
				Fatness += 2;
				ScaleGlow+= 1.5;
				Weapon.ScaleGlow+=1;
			}
			else
				bExpanding = False;
		}
		if(VSize(Velocity) > 0.5)
    	GhostT=Spawn(Class'UMSGhostTrail',Self,,Location,Rotation);
		if(GhostT != None)
		{
			GhostT.Texture=Texture;
			GhostT.bUnlit=False;
			GhostT.scaleglow=0.45;
		}
	}
	else if(!bCloaked)
	{
		Fatness=Default.Fatness;
		ScaleGlow=Default.ScaleGlow;
		Weapon.ScaleGlow=Weapon.Default.ScaleGlow;
	}
}

state SpecialAbility
{
	ignores SeePlayer, EnemyNotVisible, HearNoise, Bump, HitWall, HeadZoneChange, 	FootZoneChange, ZoneChange, Falling, WarnTarget, DamageAttitudeTo, PlayTakeHit;

	Function EndState()
	{
		if(Health>0)
		DoSpecial();
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
		DoSpecial();
	}
}

defaultproperties
{
	MultiSkins(1)=Texture'RMarine1'
	MultiSkins(2)=Texture'RMarine2'
	bWCD=False
	WeaponCooldown=0.5
	CombatStyle=-1
	Skill=6
	bMovingRangedAttack=False;
	bPrefersRanged=True
	bDoSpecial=False
	WeaponType='Rifle'
	Texture=Texture'UnrealShare.Invis'
	CloakedAmbientSound=Sound'UMSMarinesII.ReconCloakLoop'
	CloakingSound=sound'UMSMarinesII.PowerON'
	DeCloakingSound=Sound'UMSMarinesII.PowerOFF'
	bAutoDoSpecial=True
}