//=============================================================================
// UMSSpaceMarinePlayer  -- GFour
// Huge thanks to AlCapowned for getting the skins working!
//=============================================================================

class UMSSpaceMarinePlayer extends UnrealiPlayer;

var string		DefaultPackage; //Default is MarineSkins_Fake.
var string		DefaultSkinName; //Default is MarineSkins_Fake.spce
var int			FixedSkin; //Default is 0

var() sound DeathStatic;
var() sound Gesture1Cue;
var() sound Gesture2Cue;
var() sound Gesture3Cue;

/* Skin Stuff */
static function GetMultiSkin( Actor SkinActor, out string SkinName, out string FaceName )
{
	local string ShortSkinName, FullSkinName;

	FullSkinName  = String(SkinActor.Multiskins[default.FixedSkin]);
	ShortSkinName = SkinActor.GetItemName(FullSkinName);

	SkinName = Left(FullSkinName, Len(FullSkinName) - Len(ShortSkinName)) $ Left(ShortSkinName, 4);
}

static function bool bIsFakeSkin(String givenSkinName)
{
	if (inStr(Caps(givenSkinName),Caps("UMSMarineSkins_Fake.")) > -1)
		return true;
	return false;
}

static function string Replace(coerce string source, coerce string search, coerce string replace) {
	local int pos;
	
	pos = InStr(source, search);
	if (pos >= 0) {
		source = Left(source, pos) $ replace $ Mid(source, pos + Len(search));
	}
	
	return source;
}


static function SetMultiSkin(Actor SkinActor, string SkinName, string FaceName, byte TeamNum)
{
	local string MeshName, SkinItem, SkinPackage;

	MeshName = SkinActor.GetItemName(string(SkinActor.Mesh));

	SkinItem = SkinActor.GetItemName(SkinName);

	SkinPackage = Left(SkinName, Len(SkinName) - Len(SkinItem));

	if(SkinPackage == "")
	{
		SkinPackage=default.DefaultPackage;
		SkinName=SkinPackage$SkinName;
	}
	

	// Set the fixed skin element.  If it fails, go to default skin & no face.
	if(!SetSkinElement(SkinActor, default.FixedSkin, SkinName$string(default.FixedSkin+1), default.DefaultSkinName$string(default.FixedSkin+1)))
	{
		SkinName = default.DefaultSkinName;
		FaceName = "";
	}

	if(!SetSkinElement(SkinActor, 0, SkinName$"1", default.DefaultSkinName))
		SkinName=default.DefaultSkinName;

	//Skin slot 0 not used by the model, so start with 1
	SetSkinElement(SkinActor, 1, SkinName$"1", SkinName$"1");
	SetSkinElement(SkinActor, 2, SkinName$"2", SkinName$"2");
}

static function bool SetSkinElement(Actor SkinActor, int SkinNo, string SkinName, string DefaultSkinName)
{
	local Texture NewSkin;
	//local bool bIsFake;

	//Dirty workaround for skins in the U file
	//Looks for our fake names that we gave the int file and manually replaces them with the real texture names
	if (bIsFakeSkin(SkinName))
	{
		if (inStr(Caps(SkinName),Caps("arct1")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.arct1", "UMSMarinesII.skins.jMarine1");
		else if (inStr(Caps(SkinName),Caps("arct2")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.arct2", "UMSMarinesII.skins.jMarine2");
		else if (inStr(Caps(SkinName),Caps("jung1")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.jung1", "UMSMarinesII.skins.jMarine3");
		else if (inStr(Caps(SkinName),Caps("jung2")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.jung2", "UMSMarinesII.skins.jMarine4");
		else if (inStr(Caps(SkinName),Caps("dsrt1")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.dsrt1", "UMSMarinesII.skins.jMarine5");
		else if (inStr(Caps(SkinName),Caps("dsrt2")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.dsrt2", "UMSMarinesII.skins.jMarine6");
		else if (inStr(Caps(SkinName),Caps("spce1")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.spce1", "UMSMarinesII.skins.jMarine7");
		else if (inStr(Caps(SkinName),Caps("spce2")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.spce2", "UMSMarinesII.skins.jMarine8");
		else if (inStr(Caps(SkinName),Caps("gibb1")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.gibb1", "UMSMarinesII.skins.jSMGib1");
		else if (inStr(Caps(SkinName),Caps("gibb2")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.gibb2", "UMSMarinesII.skins.jSMGib2");
		else if (inStr(Caps(SkinName),Caps("blop1")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.blop1", "UMSMarinesII.skins.sMarine1");
		else if (inStr(Caps(SkinName),Caps("blop2")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.blop2", "UMSMarinesII.skins.sMarine2");
		else if (inStr(Caps(SkinName),Caps("EliteM1")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.EliteM1", "UMSMarinesII.skins.EMarine1");
		else if (inStr(Caps(SkinName),Caps("EliteM2")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.EliteM2", "UMSMarinesII.skins.EMarine2");
		else if (inStr(Caps(SkinName),Caps("ATM1")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.ATM1", "UMSMarinesII.skins.ATMarine1");
		else if (inStr(Caps(SkinName),Caps("ATM2")) > -1)
			SkinName = Replace(SkinName, "UMSMarineSkins_Fake.ATM2", "UMSMarinesII.skins.ATMarine2");
	}
	
	if (SkinName == "")
		return false;

	NewSkin = Texture(DynamicLoadObject(SkinName, class'Texture'));
	if ( NewSkin != None )
	{
		SkinActor.Multiskins[SkinNo] = NewSkin;
		return True;
	}
	else
	{
		if (DefaultSkinName != "")
		{
			NewSkin = Texture(DynamicLoadObject(DefaultSkinName, class'Texture'));
			SkinActor.Multiskins[SkinNo] = NewSkin;
		}
		return False;
	}
}
/*
//==============
// Encroachment
function PreSetMovement()
{
	bCanJump = true;
	bCanWalk = true;
	bCanSwim = true;
	bCanFly = false;
	bCanOpenDoors = true;
	bCanDoSpecial = true;
}

function ChangeSetHand( string S )
{
	Super.ChangeSetHand(S);
	if ( Handedness == 1 )
		LoadLeftHand();
}

function LoadLeftHand()
{
	local mesh M;

	// load left handed weapon meshes
	M = mesh(DynamicLoadObject("Botpack.PulseGunL", class'Mesh'));
	M = mesh(DynamicLoadObject("Botpack.Rifle2mL", class'Mesh'));
	M = mesh(DynamicLoadObject("Botpack.EightML", class'Mesh'));
	M = mesh(DynamicLoadObject("Botpack.Minigun2L", class'Mesh'));
}

function SendGlobalMessage(PlayerReplicationInfo Recipient, name MessageType, byte MessageID, float Wait)
{
	if ( Level.TimeSeconds - OldMessageTime < 5 )
		return;

	SendVoiceMessage(PlayerReplicationInfo, Recipient, MessageType, MessageID, 'GLOBAL');
}


function SendTeamMessage(PlayerReplicationInfo Recipient, name MessageType, byte MessageID, float Wait)
{
	if ( Level.TimeSeconds - OldMessageTime < 10 )
		return;

	SendVoiceMessage(PlayerReplicationInfo, Recipient, MessageType, MessageID, 'TEAM');
}

function Killed(pawn Killer, pawn Other, name damageType)
{
	Super.Killed(Killer, Other, damageType);

	if ( (Killer == self) 
		&& (((bFire == 0) && (bAltFire == 0))
			|| ((Weapon != None) && !Weapon.IsA('Minigun2') && !Weapon.IsA('PulseGun'))) )
		Other.Health = FMin(Other.Health, -11); // don't let other do stagger death
}

function PlayDodge(eDodgeDir DodgeMove)
{
	Velocity.Z = 210;
	if ( DodgeMove == DODGE_Left )
		TweenAnim('DodgeL', 0.25);
	else if ( DodgeMove == DODGE_Right )
		TweenAnim('DodgeR', 0.25);
	else if ( DodgeMove == DODGE_Back )
		TweenAnim('DodgeB', 0.25);
	else 
		PlayAnim('Flip', 1.35 * FMax(0.35, Region.Zone.ZoneGravity.Z/Region.Zone.Default.ZoneGravity.Z), 0.06);
}

function PlayChatting()
{
	if ( mesh != None )
		LoopAnim('Chat1', 0.7, 0.25);
}

function PlayWaiting()
{
	local name newAnim;

	if ( Mesh == None )
		return;

	if ( bIsTyping )
	{
		PlayChatting();
		return;
	}

	if ( (IsInState('PlayerSwimming')) || (Physics == PHYS_Swimming) )
	{
		BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			LoopAnim('TreadSM');
		else
			LoopAnim('TreadLG');
	}
	else
	{	
		BaseEyeHeight = Default.BaseEyeHeight;
		ViewRotation.Pitch = ViewRotation.Pitch & 65535;
		If ( (ViewRotation.Pitch > RotationRate.Pitch) 
			&& (ViewRotation.Pitch < 65536 - RotationRate.Pitch) )
		{
			If (ViewRotation.Pitch < 32768) 
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
					TweenAnim('AimUpSm', 0.3);
				else
					TweenAnim('AimUpLg', 0.3);
			}
			else
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
					TweenAnim('AimDnSm', 0.3);
				else
					TweenAnim('AimDnLg', 0.3);
			}
		}
		else if ( (Weapon != None) && Weapon.bPointing )
		{
			if ( Weapon.bRapidFire && ((bFire != 0) || (bAltFire != 0)) )
				LoopAnim('StillFRRP');
			else if ( Weapon.Mass < 20 )
				TweenAnim('StillSMFR', 0.3);
			else
				TweenAnim('StillFRRP', 0.3);
		}
		else
		{
			if ( FRand() < 0.1 )
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
					PlayAnim('CockGun', 0.5 + 0.5 * FRand(), 0.3);
				else
					PlayAnim('CockGunL', 0.5 + 0.5 * FRand(), 0.3);
			}
			else
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
				{
					if ( (FRand() < 0.75) && ((AnimSequence == 'Breath1') || (AnimSequence == 'Breath2')) )
						newAnim = AnimSequence;
					else if ( FRand() < 0.5 )
						newAnim = 'Breath1';
					else
						newAnim = 'Breath2';
				}
				else
				{
					if ( (FRand() < 0.75) && ((AnimSequence == 'Breath1L') || (AnimSequence == 'Breath2L')) )
						newAnim = AnimSequence;
					else if ( FRand() < 0.5 )
						newAnim = 'Breath1L';
					else
						newAnim = 'Breath2L';
				}
								
				if ( AnimSequence == newAnim )
					LoopAnim(newAnim, 0.4 + 0.4 * FRand());
				else
					PlayAnim(newAnim, 0.4 + 0.4 * FRand(), 0.25);
			}
		}
	}
}

exec function SetAirControl(float F)
{
	if ( bAdmin || (Level.Netmode == NM_Standalone) )
		AirControl = F;
}

// Skip any map.

// Skip all maps.

simulated function PlayFootStep()
{
	if ( (Level.NetMode != NM_Client) 
		&& ((Weapon == None) || !Weapon.bPointing) )
		MakeNoise(0.1);

	if ( bBehindView || (Role==ROLE_SimulatedProxy) )	
		FootStepping();
}

simulated function FootStepping()
{
	local sound step;
	local float decision;

	if ( FootRegion.Zone.bWaterZone )
	{
		PlaySound(WaterStep, SLOT_Interact, 1, false, 1000.0, 1.0);
		return;
	}

	decision = FRand();
	if ( decision < 0.34 )
		step = Footstep1;
	else if (decision < 0.67 )
		step = Footstep2;
	else
		step = Footstep3;

	PlaySound(step, SLOT_Interact, 2.2, false, 1000.0, 1.0);
}

//-----------------------------------------------------------------------------
// Sound functions

function PlayTakeHitSound(int damage, name damageType, int Mult)
{
	if ( Level.TimeSeconds - LastPainSound < 0.3 )
		return;
	LastPainSound = Level.TimeSeconds;

	if ( HeadRegion.Zone.bWaterZone )
	{
		if ( damageType == 'Drowned' )
			PlaySound(drown, SLOT_Pain, 12);
		else if ( FRand() < 0.5 )
			PlaySound(UWHit1, SLOT_Pain,16,,,Frand()*0.15+0.9);
		else
			PlaySound(UWHit2, SLOT_Pain,16,,,Frand()*0.15+0.9);
		return;
	}
	damage *= FRand();

	if (damage < 8) 
		PlaySound(HitSound1, SLOT_Pain,16,,,Frand()*0.15+0.9);
	else if (damage < 25)
	{
		if (FRand() < 0.5) PlaySound(HitSound2, SLOT_Pain,16,,,Frand()*0.15+0.9);			
		else PlaySound(HitSound3, SLOT_Pain,16,,,Frand()*0.15+0.9);
	}
	else
		PlaySound(HitSound4, SLOT_Pain,16,,,Frand()*0.15+0.9);			
}

function Gasp()
{
	if ( Role != ROLE_Authority )
		return;
	if ( PainTime < 2 )
		PlaySound(GaspSound, SLOT_Talk, 2.0);
	else
		PlaySound(BreathAgain, SLOT_Talk, 2.0);
}

//-----------------------------------------------------------------------------
// Animation functions

function PlayTurning()
{
	BaseEyeHeight = Default.BaseEyeHeight;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		PlayAnim('TurnSM', 0.3, 0.3);
	else
		PlayAnim('TurnLG', 0.3, 0.3);
}

function TweenToWalking(float tweentime)
{
	BaseEyeHeight = Default.BaseEyeHeight;
	if (Weapon == None)
		TweenAnim('Walk', tweentime);
	else if ( Weapon.bPointing || (CarriedDecoration != None) ) 
	{
		if (Weapon.Mass < 20)
			TweenAnim('WalkSMFR', tweentime);
		else
			TweenAnim('WalkLGFR', tweentime);
	}
	else
	{
		if (Weapon.Mass < 20)
			TweenAnim('WalkSM', tweentime);
		else
			TweenAnim('WalkLG', tweentime);
	} 
}

function PlayWalking()
{
	BaseEyeHeight = Default.BaseEyeHeight;
	if (Weapon == None)
	{
		if (HasAnim('Walk'))
			LoopAnim('Walk');
		else
			LoopAnim('WalkSM');
	}
	else if ( Weapon.bPointing || (CarriedDecoration != None) ) 
	{
		if (Weapon.Mass < 20)
			LoopAnim('WalkSMFR');
		else
			LoopAnim('WalkLGFR');
	}
	else
	{
		if (Weapon.Mass < 20)
			LoopAnim('WalkSM');
		else
			LoopAnim('WalkLG');
	}
}

function TweenToRunning(float tweentime)
{
	local vector X,Y,Z, Dir;

	BaseEyeHeight = Default.BaseEyeHeight;
	if (bIsWalking)
	{
		TweenToWalking(0.1);
		return;
	}

	GetAxes(Rotation, X,Y,Z);
	Dir = Normal(Acceleration);
	if ( (Dir Dot X < 0.75) && (Dir != vect(0,0,0)) )
	{
		// strafing or backing up
		if ( Dir Dot X < -0.75 )
			PlayAnim('Backstep', 0.9, tweentime);
		else if ( Dir Dot Y > 0 )
			PlayAnim('StrafeRSM', 0.9, tweentime);
		else
			PlayAnim('StrafeLSM', 0.9, tweentime);
	}
	else if (Weapon == None)
		PlayAnim('RunSM', 0.9, tweentime);
	else if ( Weapon.bPointing ) 
	{
		if (Weapon.Mass < 20)
			PlayAnim('RunSMFR', 0.9, tweentime);
		else
			PlayAnim('RunLGFR', 0.9, tweentime);
	}
	else
	{
		if (Weapon.Mass < 20)
			PlayAnim('RunSM', 0.9, tweentime);
		else
			PlayAnim('RunLG', 0.9, tweentime);
	} 
}

function PlayRunning()
{
	local vector X,Y,Z, Dir;

	BaseEyeHeight = Default.BaseEyeHeight;

	// determine facing direction
	GetAxes(Rotation, X,Y,Z);
	Dir = Normal(Acceleration);
	if ( (Dir Dot X < 0.75) && (Dir != vect(0,0,0)) )
	{
		// strafing or backing up
		if ( Dir Dot X < -0.75 )
			LoopAnim('Backstep');
		else if ( Dir Dot Y > 0 )
			LoopAnim('StrafeRSM');
		else
			LoopAnim('StrafeLSM');
	}
	else if (Weapon == None)
		LoopAnim('RunSM');
	else if ( Weapon.bPointing ) 
	{
		if (Weapon.Mass < 20)
			LoopAnim('RunSMFR');
		else
			LoopAnim('RunLGFR');
	}
	else
	{
		if (Weapon.Mass < 20)
			LoopAnim('RunSM');
		else
			LoopAnim('RunLG');
	}
}

function PlayRising()
{
	BaseEyeHeight = 0.4 * Default.BaseEyeHeight;
	TweenAnim('DuckWlkS', 0.7);
}

function PlayFeignDeath()
{
	local float decision;
	local name Tween;
	local name Play;

	BaseEyeHeight = 0;
	decision = frand();
	if ( decision < 0.33 )
	{
		Tween = 'DeathEnd';
		if (!HasAnim(Tween))
		{
			Play = 'Dead';
			if (!HasAnim(Play))
				Play = 'Dead1';
		}
	}
	else if ( decision < 0.67 )
	{
		Tween = 'DeathEnd2';
		if (!HasAnim(Tween))
			Play = 'Dead2';
	}
	else 
	{
		Tween = 'DeathEnd3';
		if (!HasAnim(Tween))
			Play = 'Dead3';
	}
	if (Play != '')
		PlayAnim(Play,, 0.1);
	else
		TweenAnim(Tween, 0.5);
}

function PlayGutHit(float tweentime)
{
	if ( (AnimSequence == 'GutHit') || (AnimSequence == 'Dead2') )
	{
		if (FRand() < 0.5)
			TweenAnim('LeftHit', tweentime);
		else
			TweenAnim('RightHit', tweentime);
	}
	else if ( FRand() < 0.6 )
		TweenAnim('GutHit', tweentime);
	else
		TweenAnim('Dead2', tweentime);

}

function PlayHeadHit(float tweentime)
{
	if ( (AnimSequence == 'HeadHit') || (AnimSequence == 'Dead4') )
		TweenAnim('GutHit', tweentime);
	else if ( FRand() < 0.6 )
		TweenAnim('HeadHit', tweentime);
	else
		TweenAnim('Dead4', tweentime);
}

function PlayLeftHit(float tweentime)
{
	if ( (AnimSequence == 'LeftHit') || (AnimSequence == 'Dead3') )
		TweenAnim('GutHit', tweentime);
	else if ( FRand() < 0.6 )
		TweenAnim('LeftHit', tweentime);
	else 
		TweenAnim('Dead3', tweentime);
}

function PlayRightHit(float tweentime)
{
	if ( (AnimSequence == 'RightHit') || (AnimSequence == 'Dead5') )
		TweenAnim('GutHit', tweentime);
	else if ( FRand() < 0.6 )
		TweenAnim('RightHit', tweentime);
	else
		TweenAnim('Dead5', tweentime);
}
	
function PlayLanded(float impactVel)
{	
	impactVel = impactVel/JumpZ;
	impactVel = 0.1 * impactVel * impactVel;
	BaseEyeHeight = Default.BaseEyeHeight;

	if ( impactVel > 0.17 )
		PlaySound(LandGrunt, SLOT_Talk, FMin(5, 5 * impactVel),false,1200,FRand()*0.4+0.8);
	if ( !FootRegion.Zone.bWaterZone && (impactVel > 0.01) )
		PlaySound(Land, SLOT_Interact, FClamp(4 * impactVel,0.5,5), false,1000, 1.0);
	if ( (impactVel > 0.06) || (GetAnimGroup(AnimSequence) == 'Jumping') || (GetAnimGroup(AnimSequence) == 'Ducking') )
	{
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			TweenAnim('LandSMFR', 0.12);
		else
			TweenAnim('LandLGFR', 0.12);
	}
	else if ( !IsAnimating() )
	{
		if ( GetAnimGroup(AnimSequence) == 'TakeHit' )
		{
			SetPhysics(PHYS_Walking);
			AnimEnd();
		}
		else 
		{
			if ( (Weapon == None) || (Weapon.Mass < 20) )
				TweenAnim('LandSMFR', 0.12);
			else
				TweenAnim('LandLGFR', 0.12);
		}
	}
}
	
function PlayInAir()
{
	local vector X,Y,Z, Dir;
	local float f, TweenTime;

	BaseEyeHeight =  0.7 * Default.BaseEyeHeight;

	if ( (GetAnimGroup(AnimSequence) == 'Landing') )
	{
		GetAxes(Rotation, X,Y,Z);
		Dir = Normal(Acceleration);
		f = Dir dot Y;
		if ( f > 0.7 )
			TweenAnim('DodgeL', 0.35);
		else if ( f < -0.7 )
			TweenAnim('DodgeR', 0.35);
		else if ( Dir dot X > 0 )
			TweenAnim('DodgeF', 0.35);
		else
			TweenAnim('DodgeB', 0.35);
		return;
	}
	if ( GetAnimGroup(AnimSequence) == 'Jumping' )
	{
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			TweenAnim('DuckWlkS', 2);
		else
			TweenAnim('DuckWlkL', 2);
		return;
	}
	else if ( GetAnimGroup(AnimSequence) == 'Ducking' )
		TweenTime = 2;
	else 
		TweenTime = 0.7;

	if ( AnimSequence == 'StrafeLSM' )
		TweenAnim('DodgeR', TweenTime);
	else if ( AnimSequence == 'StrafeRSM' )
		TweenAnim('DodgeL', TweenTime);
	else if ( AnimSequence == 'Backstep' )
		TweenAnim('DodgeB', TweenTime);
	else if ( (Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('JumpSMFR', TweenTime);
	else
		TweenAnim('JumpLGFR', TweenTime); 
}

function PlayDuck()
{
	BaseEyeHeight = 0;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('DuckWlkS', 0.25);
	else
		TweenAnim('DuckWlkL', 0.25);
}

function PlayCrawling()
{
	//log("Play duck");
	BaseEyeHeight = 0;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		LoopAnim('DuckWlkS');
	else
		LoopAnim('DuckWlkL');
}

function TweenToWaiting(float tweentime)
{
	if ( (IsInState('PlayerSwimming')) || (Physics == PHYS_Swimming) )
	{
		BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			TweenAnim('TreadSM', tweentime);
		else
			TweenAnim('TreadLG', tweentime);
	}
	else
	{
		BaseEyeHeight = Default.BaseEyeHeight;
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			TweenAnim('StillSMFR', tweentime);
		else 
			TweenAnim('StillFRRP', tweentime);
	}
}
	
function PlayRecoil(float Rate)
{
	if ( Weapon != None && Weapon.bRapidFire )
	{
		if ( !IsAnimating() && (Physics == PHYS_Walking) )
			LoopAnim('StillFRRP', 0.02);
	}
	else if ( AnimSequence == 'StillSmFr' )
		PlayAnim('StillSmFr', Rate, 0.02);
	else if ( (AnimSequence == 'StillLgFr') || (AnimSequence == 'StillFrRp') )	
		PlayAnim('StillLgFr', Rate, 0.02);
}

function PlayFiring()
{
	// switch animation sequence mid-stream if needed
	if (AnimSequence == 'RunLG')
		AnimSequence = 'RunLGFR';
	else if (AnimSequence == 'RunSM')
		AnimSequence = 'RunSMFR';
	else if (AnimSequence == 'WalkLG')
		AnimSequence = 'WalkLGFR';
	else if (AnimSequence == 'WalkSM')
		AnimSequence = 'WalkSMFR';
	else if ( AnimSequence == 'JumpSMFR' )
		TweenAnim('JumpSMFR', 0.03);
	else if ( AnimSequence == 'JumpLGFR' )
		TweenAnim('JumpLGFR', 0.03);
	else if ( (GetAnimGroup(AnimSequence) == 'Waiting') || (GetAnimGroup(AnimSequence) == 'Gesture')
		&& (AnimSequence != 'TreadLG') && (AnimSequence != 'TreadSM') )
	{
		if ( Weapon.Mass < 20 )
			TweenAnim('StillSMFR', 0.02);
		else
			TweenAnim('StillFRRP', 0.02);
	}
}

function PlayWeaponSwitch(Weapon NewWeapon)
{
	if ( (Weapon == None) || (Weapon.Mass < 20) )
	{
		if ( (NewWeapon != None) && (NewWeapon.Mass > 20) )
		{
			if ( (AnimSequence == 'RunSM') || (AnimSequence == 'RunSMFR') )
				AnimSequence = 'RunLG';
			else if ( (AnimSequence == 'WalkSM') || (AnimSequence == 'WalkSMFR') )
				AnimSequence = 'WalkLG';	
		 	else if ( AnimSequence == 'JumpSMFR' )
		 		AnimSequence = 'JumpLGFR';
			else if ( AnimSequence == 'DuckWlkL' )
				AnimSequence = 'DuckWlkS';
		 	else if ( AnimSequence == 'StillSMFR' )
		 		AnimSequence = 'StillFRRP';
			else if ( AnimSequence == 'AimDnSm' )
				AnimSequence = 'AimDnLg';
			else if ( AnimSequence == 'AimUpSm' )
				AnimSequence = 'AimUpLg';
		 }	
	}
	else if ( (NewWeapon == None) || (NewWeapon.Mass < 20) )
	{		
		if ( (AnimSequence == 'RunLG') || (AnimSequence == 'RunLGFR') )
			AnimSequence = 'RunSM';
		else if ( (AnimSequence == 'WalkLG') || (AnimSequence == 'WalkLGFR') )
			AnimSequence = 'WalkSM';
	 	else if ( AnimSequence == 'JumpLGFR' )
	 		AnimSequence = 'JumpSMFR';
		else if ( AnimSequence == 'DuckWlkS' )
			AnimSequence = 'DuckWlkL';
	 	else if (AnimSequence == 'StillFRRP')
	 		AnimSequence = 'StillSMFR';
		else if ( AnimSequence == 'AimDnLg' )
			AnimSequence = 'AimDnSm';
		else if ( AnimSequence == 'AimUpLg' )
			AnimSequence = 'AimUpSm';
	}
}

function PlaySwimming()
{
	BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
	if ((Weapon == None) || (Weapon.Mass < 20) )
		LoopAnim('SwimSM');
	else
		LoopAnim('SwimLG');
}

function TweenToSwimming(float tweentime)
{
	BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
	if ((Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('SwimSM',tweentime);
	else
		TweenAnim('SwimLG',tweentime);
}

state Dying
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, SwitchWeapon, Falling, PainTimer;

	function ViewFlash(float DeltaTime)
	{
		if ( Carcass(ViewTarget) != None )
		{
			InstantFlash = -0.3;
			InstantFog = vect(0.25, 0.03, 0.03);
		}
		Super.ViewFlash(DeltaTime);
	}
}
	
state GameEnded
{
	ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, PainTimer, Died;

	exec function Fire( optional float F )
	{
		if ( Role < ROLE_Authority )
			return;

		if ( (Level.NetMode == NM_Standalone) && !bFrozen )
			ServerReStartGame();
	}
}

*/


function PlayTurning()
{
	BaseEyeHeight = Default.BaseEyeHeight;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		PlayAnim('TurnSM', 0.3, 0.3);
	else
		PlayAnim('TurnLG', 0.3, 0.3);
}

function TweenToWalking(float tweentime)
{
	BaseEyeHeight = Default.BaseEyeHeight;
	if (Weapon == None)
		TweenAnim('Walk', tweentime);
	else if ( Weapon.bPointing || (CarriedDecoration != None) ) 
	{
		if (Weapon.Mass < 20)
			TweenAnim('WalkSMFR', tweentime);
		else
			TweenAnim('WalkLGFR', tweentime);
	}
	else
	{
		if (Weapon.Mass < 20)
			TweenAnim('WalkSM', tweentime);
		else
			TweenAnim('WalkLG', tweentime);
	} 
}

function TweenToRunning(float tweentime)
	{
		local vector X,Y,Z, Dir;

		BaseEyeHeight = Default.BaseEyeHeight;
		if (bIsWalking)
		{
			TweenToWalking(0.1);
			return;
		}

	GetAxes(Rotation, X,Y,Z);
	Dir = Normal(Acceleration);
	if ( (Dir Dot X < 0.75) && (Dir != vect(0,0,0)) )
	{
		// strafing
		if ( Dir Dot X < -0.75 )
		{
			if (Weapon == None)
				PlayAnim('RunSM2', 0.9, tweentime);
			else if ( Weapon.bPointing ) 
			{
				if (Weapon.Mass < 20)
					PlayAnim('RunSMFR', 0.9, tweentime);
				else
					PlayAnim('RunLGFR', 0.9, tweentime);
			}
			else
			{
				if (Weapon.Mass < 20)
					PlayAnim('RunSM2', 0.9, tweentime);
				else
					PlayAnim('RunLG3', 0.9, tweentime);
			} 
		}
		else if ( Dir Dot Y > 0 )
			PlayAnim('StrafeRSM', 0.9, tweentime);
		else
			PlayAnim('StrafeLSM', 0.9, tweentime);
	}
		else if (Weapon == None)
			PlayAnim('RunSM', 0.9, tweentime);
		else if ( Weapon.bPointing ) 
		{
			if (Weapon.Mass < 20)
				PlayAnim('RunSMFR', 0.9, tweentime);
			else
				PlayAnim('RunLGFR', 0.9, tweentime);
		}
		else
		{
			if (Weapon.Mass < 20)
				PlayAnim('RunSM', 0.9, tweentime);
			else
				PlayAnim('RunLG3', 0.9, tweentime);
		} 
	}

function PlayWalking()
	{
		BaseEyeHeight = Default.BaseEyeHeight;
		if (Weapon == None)
			LoopAnim('Walk');
		else if ( Weapon.bPointing || (CarriedDecoration != None) ) 
		{
			if (Weapon.Mass < 20)
				LoopAnim('WalkSMFR');
			else
				LoopAnim('WalkLGFR');
		}
		else
		{
			if (Weapon.Mass < 20)
				LoopAnim('WalkSM');
			else
				LoopAnim('WalkLG');
		}
	}

function PlayRunning()
	{
			local vector X,Y,Z, Dir;

		BaseEyeHeight = Default.BaseEyeHeight;

	// determine facing direction
	GetAxes(Rotation, X,Y,Z);
	Dir = Normal(Acceleration);
	if ( (Dir Dot X < 0.75) && (Dir != vect(0,0,0)) )
	{
		// strafing or backing up
		if ( Dir Dot X < -0.75 )
		{
			if (Weapon == None)
				PlayAnim('RunSM2', 0.9);
			else if ( Weapon.bPointing ) 
			{
				if (Weapon.Mass < 20)
					PlayAnim('RunSMFR', 0.9);
				else
					PlayAnim('RunLGFR', 0.9);
			}
			else
			{
				if (Weapon.Mass < 20)
					PlayAnim('RunSM2', 0.9);
				else
					PlayAnim('RunLG3', 0.9);
			} 
		}
		else if ( Dir Dot Y > 0 )
			LoopAnim('StrafeRSM');
		else
			LoopAnim('StrafeLSM');
	}
		else if (Weapon == None)
			LoopAnim('RunSM');
		else if ( Weapon.bPointing ) 
		{
			if (Weapon.Mass < 20)
				LoopAnim('RunSMFR');
			else
				LoopAnim('RunLGFR');
		}
		else
		{
			if (Weapon.Mass < 20)
				LoopAnim('RunSM');
			else
				LoopAnim('RunLG3');
		}
	}

function PlayRising()
{
	BaseEyeHeight = 0.4 * Default.BaseEyeHeight;
	TweenAnim('DuckWlkS', 0.7);
}

function PlayFeignDeath()
{
	local float decision;

	BaseEyeHeight = 0;
	if ( decision < 0.33 )
		TweenAnim('DeathEnd', 0.5);
	else if ( decision < 0.67 )
		TweenAnim('DeathEnd2', 0.5);
	else 
		TweenAnim('DeathEnd3', 0.5);
}

function PlayDying(name DamageType, vector HitLoc)
{
	local vector X,Y,Z, HitVec, HitVec2D;
	local float dotp;
	local carcass carc;

	BaseEyeHeight = Default.BaseEyeHeight;
	PlayDyingSound();
		
	if ( DamageType == 'Suicided' )
	{
		PlayAnim('Dead1', 0.7, 0.1);
		return;
	}
		
	if ( FRand() < 0.15 )
	{
		PlayAnim('Dead3',0.7,0.1);
		return;
	}

	// check for big hit
	if ( (Velocity.Z > 250) && (FRand() < 0.7) )
	{
		PlayAnim('Dead2', 0.7, 0.1);
		return;
	}

	// check for head hit
	if ( ((DamageType == 'Decapitated') || (HitLoc.Z - Location.Z > 0.6 * CollisionHeight))
		 && ((Level.Game == None) || !Level.Game.bVeryLowGore) )
	{
		DamageType = 'Decapitated';
		if ( Level.NetMode != NM_Client )
		{
			carc = Spawn(class 'FemaleHead',,, Location + CollisionHeight * vect(0,0,0.8), Rotation + rot(3000,0,16384) );
			if (carc != None)
			{
				carc.Initfor(self);
				carc.Velocity = Velocity + VSize(Velocity) * VRand();
				carc.Velocity.Z = FMax(carc.Velocity.Z, Velocity.Z);
				ViewTarget = carc;
			}
		}
		PlayAnim('Dead6', 0.7, 0.1);
		return;
	}

	
	if ( FRand() < 0.15)
	{
		PlayAnim('Dead1', 0.7, 0.1);
		return;
	}

	GetAxes(Rotation,X,Y,Z);
	X.Z = 0;
	HitVec = Normal(HitLoc - Location);
	HitVec2D= HitVec;
	HitVec2D.Z = 0;
	dotp = HitVec2D dot X;
	
	if (Abs(dotp) > 0.71) //then hit in front or back
		PlayAnim('Dead4', 0.7, 0.1);
	else
	{
		dotp = HitVec dot Y;
		if ( (dotp > 0.0) && ((Level.Game == None) || !Level.Game.bVeryLowGore) )
		{
			PlayAnim('Dead7', 0.7, 0.1);
			carc = Spawn(class 'Arm1');
			if (carc != None)
			{
				carc.Initfor(self);
				carc.Velocity = Velocity + VSize(Velocity) * VRand();
				carc.Velocity.Z = FMax(carc.Velocity.Z, Velocity.Z);
			}
		}
		else
			PlayAnim('Dead5', 0.7, 0.1);
	}
}

function PlayGutHit(float tweentime)
{
	if ( (AnimSequence == 'GutHit') || (AnimSequence == 'Dead2') )
	{
		if (FRand() < 0.5)
			TweenAnim('LeftHit', tweentime);
		else
			TweenAnim('RightHit', tweentime);
	}
	else if ( FRand() < 0.6 )
		TweenAnim('GutHit', tweentime);
	else
		TweenAnim('Dead2', tweentime);

}

function PlayHeadHit(float tweentime)
{
	if ( (AnimSequence == 'HeadHit') || (AnimSequence == 'Dead4') )
		TweenAnim('GutHit', tweentime);
	else if ( FRand() < 0.6 )
		TweenAnim('HeadHit', tweentime);
	else
		TweenAnim('Dead4', tweentime);
}

function PlayLeftHit(float tweentime)
{
	if ( (AnimSequence == 'LeftHit') || (AnimSequence == 'Dead3') )
		TweenAnim('GutHit', tweentime);
	else if ( FRand() < 0.6 )
		TweenAnim('LeftHit', tweentime);
	else 
		TweenAnim('Dead3', tweentime);
}

function PlayRightHit(float tweentime)
{
	if ( (AnimSequence == 'RightHit') || (AnimSequence == 'Dead5') )
		TweenAnim('GutHit', tweentime);
	else if ( FRand() < 0.6 )
		TweenAnim('RightHit', tweentime);
	else
		TweenAnim('Dead5', tweentime);
}
	
function PlayLanded(float impactVel)
{	
	impactVel = impactVel/JumpZ;
	impactVel = 0.1 * impactVel * impactVel;
	BaseEyeHeight = Default.BaseEyeHeight;

	if ( Role == ROLE_Authority )
	{
		if ( impactVel > 0.17 )
			PlaySound(LandGrunt, SLOT_Talk, FMin(5, 5 * impactVel),false,1200,FRand()*0.4+0.8);
		if ( !FootRegion.Zone.bWaterZone && (impactVel > 0.01) )
			PlaySound(Land, SLOT_Interact, FClamp(4 * impactVel,0.5,5), false,1000, 1.0);
	}
	if ( (impactVel > 0.06) || (GetAnimGroup(AnimSequence) == 'Jumping') )
	{
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			TweenAnim('LandSMFR', 0.12);
		else
			TweenAnim('LandLGFR', 0.12);
	}
	else if ( !IsAnimating() )
	{
		if ( GetAnimGroup(AnimSequence) == 'TakeHit' )
		{
			SetPhysics(PHYS_Walking);
			AnimEnd();
		}
		else 
		{
			if ( (Weapon == None) || (Weapon.Mass < 20) )
				TweenAnim('LandSMFR', 0.12);
			else
				TweenAnim('LandLGFR', 0.12);
		}
	}
}
	
function PlayInAir()
{
	local float /*f,*/ TweenTime;

	BaseEyeHeight =  0.7 * Default.BaseEyeHeight;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('JumpSMFR', 0.8);
	else
		TweenAnim('JumpLGFR', 0.8); 

	if ( AnimSequence == 'StrafeLSM' )
		TweenAnim('DodgeR', TweenTime);
	else if ( AnimSequence == 'StrafeRSM' )
		TweenAnim('DodgeL', TweenTime);
}

function PlayDuck()
{
	BaseEyeHeight = 0;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('DuckWlkS', 0.25);
	else
		TweenAnim('DuckWlkL', 0.25);
}

function PlayCrawling()
{
	//log("Play duck");
	BaseEyeHeight = 0;
	if ( (Weapon == None) || (Weapon.Mass < 20) )
		LoopAnim('DuckWlkS');
	else
		LoopAnim('DuckWlkL');
}

function TweenToWaiting(float tweentime)
{
	if ( (IsInState('PlayerSwimming')) || (Physics == PHYS_Swimming) )
	{
		BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			TweenAnim('TreadSM', tweentime);
		else
			TweenAnim('TreadLG', tweentime);
	}
	else
	{
		BaseEyeHeight = Default.BaseEyeHeight;
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			TweenAnim('StillSMFR', tweentime);
		else 
			TweenAnim('StillFRRP', tweentime);
	}
}
	
function PlayWaiting()
{
	local name newAnim;

	if ( bIsTyping )
	{
		PlayChatting();
		return;
	}

	if ( (IsInState('PlayerSwimming')) || (Physics == PHYS_Swimming) )
	{
		BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
		if ( (Weapon == None) || (Weapon.Mass < 20) )
			LoopAnim('TreadSM');
		else
			LoopAnim('TreadLG');
	}
	else
	{	
		BaseEyeHeight = Default.BaseEyeHeight;
		ViewRotation.Pitch = ViewRotation.Pitch & 65535;
		If ( (ViewRotation.Pitch > RotationRate.Pitch) 
			&& (ViewRotation.Pitch < 65536 - RotationRate.Pitch) )
		{
			If (ViewRotation.Pitch < 32768) 
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
					TweenAnim('AimUpSm', 0.3);
				else
					TweenAnim('AimUpLg', 0.3);
			}
			else
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
					TweenAnim('AimDnSm', 0.3);
				else
					TweenAnim('AimDnLg', 0.3);
			}
		}
		else if ( (Weapon != None) && Weapon.bPointing )
		{
			if ( Weapon.bRapidFire && ((bFire != 0) || (bAltFire != 0)) )
				LoopAnim('StillFRRP');
			else if ( Weapon.Mass < 20 )
				TweenAnim('StillSMFR', 0.3);
			else
				TweenAnim('StillFRRP', 0.3);
		}
		else
		{
			if ( FRand() < 0.1 )
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
					PlayAnim('CockGun', 0.5 + 0.5 * FRand(), 0.3);
				else
					PlayAnim('CockGunL', 0.5 + 0.5 * FRand(), 0.3);
			}
			else
			{
				if ( (Weapon == None) || (Weapon.Mass < 20) )
				{
					if ( Health > 50 )
						newAnim = 'Breath1';
					else
						newAnim = 'Breath2';
				}
				else
				{
					if ( Health > 50 )
						newAnim = 'Breath1L';
					else
						newAnim = 'Breath2L';
				}
								
				if ( AnimSequence == newAnim )
					LoopAnim(newAnim, 0.3 + 0.7 * FRand());
				else
					PlayAnim(newAnim, 0.3 + 0.7 * FRand(), 0.25);
			}
		}
	}
}	

function PlayRecoil(float Rate)
{
	if ( AnimSequence == 'StillSmFr' )
		PlayAnim('StillSmFr', Rate, 0.02);
	else if ( (AnimSequence == 'StillLgFr') || (AnimSequence == 'StillFrRp') )	
		PlayAnim('StillLgFr', Rate, 0.02);
}

function PlayFiring()
{
	// switch animation sequence mid-stream if needed
	if (AnimSequence == 'RunLG3')
		AnimSequence = 'RunLGFR';
	else if (AnimSequence == 'RunSM')
		AnimSequence = 'RunSMFR';
	else if (AnimSequence == 'WalkLG')
		AnimSequence = 'WalkLGFR';
	else if (AnimSequence == 'WalkSM')
		AnimSequence = 'WalkSMFR';
	else if ( AnimSequence == 'JumpSMFR' )
		TweenAnim('JumpSMFR', 0.03);
	else if ( AnimSequence == 'JumpLGFR' )
		TweenAnim('JumpLGFR', 0.03);
	else if ( (GetAnimGroup(AnimSequence) == 'Waiting') || (GetAnimGroup(AnimSequence) == 'Gesture')
		&& (AnimSequence != 'TreadLG') && (AnimSequence != 'TreadSM') )
	{
		if ( Weapon.Mass < 20 )
			TweenAnim('StillSMFR', 0.02);
		else
			TweenAnim('StillFRRP', 0.02);
	}
}

function PlayWeaponSwitch(Weapon NewWeapon)
{
	if ( (Weapon == None) || (Weapon.Mass < 20) )
	{
		if ( (NewWeapon != None) && (NewWeapon.Mass > 20) )
		{
			if ( (AnimSequence == 'RunSM') || (AnimSequence == 'RunSMFR') )
				AnimSequence = 'RunLG3';
			else if ( (AnimSequence == 'WalkSM') || (AnimSequence == 'WalkSMFR') )
				AnimSequence = 'WalkLG';	
		 	else if ( AnimSequence == 'JumpSMFR' )
		 		AnimSequence = 'JumpLGFR';
			else if ( AnimSequence == 'DuckWlkL' )
				AnimSequence = 'DuckWlkS';
		 	else if ( AnimSequence == 'StillSMFR' )
		 		AnimSequence = 'StillFRRP';
			else if ( AnimSequence == 'AimDnSm' )
				AnimSequence = 'AimDnLg';
			else if ( AnimSequence == 'AimUpSm' )
				AnimSequence = 'AimUpLg';
		 }	
	}
	else if ( (NewWeapon == None) || (NewWeapon.Mass < 20) )
	{		
		if ( (AnimSequence == 'RunLG3') || (AnimSequence == 'RunLGFR') )
			AnimSequence = 'RunSM';
		else if ( (AnimSequence == 'WalkLG') || (AnimSequence == 'WalkLGFR') )
			AnimSequence = 'WalkSM';
	 	else if ( AnimSequence == 'JumpLGFR' )
	 		AnimSequence = 'JumpSMFR';
		else if ( AnimSequence == 'DuckWlkS' )
			AnimSequence = 'DuckWlkL';
	 	else if (AnimSequence == 'StillFRRP')
	 		AnimSequence = 'StillSMFR';
		else if ( AnimSequence == 'AimDnLg' )
			AnimSequence = 'AimDnSm';
		else if ( AnimSequence == 'AimUpLg' )
			AnimSequence = 'AimUpSm';
	}
}

function PlaySwimming()
{
	BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
	if ((Weapon == None) || (Weapon.Mass < 20) )
		LoopAnim('SwimSM');
	else
		LoopAnim('SwimLG');
}

function TweenToSwimming(float tweentime)
{
	BaseEyeHeight = 0.7 * Default.BaseEyeHeight;
	if ((Weapon == None) || (Weapon.Mass < 20) )
		TweenAnim('SwimSM',tweentime);
	else
		TweenAnim('SwimLG',tweentime);
}

function PlayChatting()
{
	if ( mesh != None )
		LoopAnim('Chat1', 0.5, 0.25);
}

function PlayDyingSound()
{
	local float rnd;

	PlaySound(DeathStatic, SLOT_Talk);
	if ( HeadRegion.Zone.bWaterZone )
	{
		if ( FRand() < 0.5 )
			PlaySound(UWHit1, SLOT_Pain,,,,Frand()*0.2+0.9);
		else
			PlaySound(UWHit2, SLOT_Pain,,,,Frand()*0.2+0.9);
		return;
	}

	rnd = FRand();
	if (rnd < 0.25)
		PlaySound(Die, SLOT_Talk);
	else if (rnd < 0.5)
		PlaySound(Die2, SLOT_Talk);
	else if (rnd < 0.75)
		PlaySound(Die3, SLOT_Talk);
	else
		PlaySound(Die4, SLOT_Talk);
}

exec function Taunt( name Sequence )
{
	Super.Taunt( Sequence );
}

defaultproperties
{
	DefaultPackage="UMSMarineSkins_Fake."
	DefaultSkinName="UMSMarineSkins_Fake.spce"
	DeathStatic=Sound'UMSMarinesII.UMSMarines.UMSStatic'
	Gesture1Cue=Sound'UMSMarinesII.Marine.sirmale'
	Gesture2Cue=Sound'UMSMarinesII.Marine.gotemm'
	Gesture3Cue=Sound'UMSMarinesII.Marine.him2'
	drown=Sound'UnrealShare.Male.MDrown1'
	breathagain=Sound'UnrealShare.Male.MGasp1'
	Footstep1=Sound'UMSMarinesII.Footsteps.MStep1'
	Footstep2=Sound'UMSMarinesII.Footsteps.MStep2'
	Footstep3=Sound'UMSMarinesII.Footsteps.MStep3'
	HitSound3=Sound'UnrealShare.Male.MInjur3'
	HitSound4=Sound'UnrealShare.Male.MInjur4'
	Die2=Sound'UnrealShare.Male.MDeath3'
	Die3=Sound'UnrealShare.Male.MDeath3'
	Die4=Sound'UnrealShare.Male.MDeath4'
	GaspSound=Sound'UnrealShare.Male.MGasp2'
	UWHit1=Sound'UnrealShare.Male.MUWHit1'
	UWHit2=Sound'UnrealShare.Male.MUWHit2'
	LandGrunt=Sound'UnrealShare.Male.lland01'
	JumpSound=Sound'UnrealShare.Male.MJump1'
	CarcassType=Class'UMSMarinesII.UMSSpaceMarineCarcass'
	BaseEyeHeight=23.0
	EyeHeight=23.0
	HitSound1=Sound'UnrealShare.Male.MInjur1'
	HitSound2=Sound'UnrealShare.Male.MInjur2'
	Die=Sound'UnrealShare.Male.MDeath1'
	MenuName="UMS Space Marine"
	bIsHuman=True
	CollisionRadius=17.0
	CollisionHeight=39.0
	Buoyancy=99.0
	Skin=Texture'UnrealShare.Skins.Kurgan'
	Mesh=LodMesh'UMSMarinesII.UMSMarine'
}