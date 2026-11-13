//=============================================================================
// UMSDemoMarine
//=============================================================================
class UMSDemoMarine extends UMSSpecialForces;

#exec texture IMPORT NAME=JProxSkin FILE=Textures\Skins\Jdetn1.PCX GROUP=Skins LODSET=2
#exec AUDIO IMPORT FILE="Sounds\SFX\MarineTackle.wav" NAME="MarineTackle" GROUP="SFX" 

var(UMSDemolitionsMarine) bool bTurret,bCastMines;
var(UMSDemolitionsMarine) int MaxMines,MaxActiveMines;
var(UMSDemolitionsMarine) float MineCastCooldown;
var(UMSDemolitionsMarine) sound TackleSound;

var int ActiveMines,TackleDelay;
var float MineCD,SavedGroundSpeed,SavedAccelRate,TackleCD,EffectTick;

function Tick(Float DeltaTime)
{
	if(MineCD > 0)
		MineCD -= DeltaTime;
	if(TackleCD>0)
		TackleCD -= DeltaTime;

	if(!bBeamingIn)
	{
		if(Physics==PHYS_Walking && Enemy!=None && CanSee(Enemy) && actorReachable(Enemy) && VSize(Enemy.Location-Location)<=350 && TackleCD<=0)
		{
			TackleCD=5;
			GoToState('Tackle');
		}
		else if( bCastMines && MaxMines > 0 && ActiveMines < MaxActiveMines && Enemy != None && (!IsInState('ThrowMine')) 
		&& (!CanSee(Enemy)) && MineCD <= 0 && VSize(Enemy.Location - Location) < 1000 && MineCD <= 0 && VSize(LastSeenPos - Location) > 200
		&& VSize(LastSeenPos - Location) < 1000 && FRand() < 0.75 && LastSeenPos!=vect(0,0,0))
			GotoState('ThrowMine');
	}
}


function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
					 Vector momentum, name damageType)					 
{
	if(instigatedBy==Self && DamageType=='Exploded')
	Damage*=0;
	Super.TakeDamage(Damage,instigatedBy,hitlocation,Momentum,DamageType);
}

State Tackle
{
	function Tick(Float DeltaTime)
	{
		EffectTick+=DeltaTime*30;
		if(VSize(Velocity)>0 && EffectTick>1)
		{
			EffectTick=0;
			Spawn(Class'UMSAfterImage',Self,,Location,Rotation);
		}
	}

	function Bump(actor Other)
	{
		if(Enemy==Other && VSize(Velocity)>0)
		{	
			PlaySound(Sound'Swing1t',SLOT_None);
			PlayAnim('RIFLESTOMP',1,0.05);
			Other.TakeDamage(SlamDamage*2,Self,Location+(Enemy.Location-Location),100000*Normal(Velocity),'hacked');
			PlaySound(Slap, SLOT_Interact);
			PlaySound(Slap, SLOT_Misc);
			if(bIsFemale)
			{
				if(FRand()<0.5)
				PlaySound(Sound'woof', SLOT_Misc);
				else
				PlaySound(Sound'takethatf', SLOT_Misc);
			}
			else
			{
				if(FRand()<0.5)
				PlaySound(Sound'lockm', SLOT_Misc);
				else
				PlaySound(Sound'sdownm', SLOT_Misc);
			}

			if(Physics==PHYS_Walking)
			Velocity*=0;
			Disable('Bump');
		}
		else
		Global.Bump(Other);
	}

	function BeginState()
	{
		SavedAccelRate=AccelRate;
		SavedGroundSpeed=GroundSpeed;
	}

	function EndState()
	{
		Enable('Bump');
		AccelRate=SavedAccelRate;
		GroundSpeed=SavedGroundSpeed;
	}

	Begin:

	if(Enemy!=None && CanSee(Enemy) && actorReachable(Enemy) && VSize(Enemy.Location-Location)<=350)
	{
		Spawn(Class'SparkleEffect',Self,,Location,Rotation);
		Spawn(Class'ChargeRingEffect',Self,,Location-vect(0,0,0.8)*CollisionHeight,Rotation);
		Velocity*=0;
		TackleDelay=0;
		PlaySound(TackleSound,SLOT_None);
		PlaySound(TackleSound,SLOT_None);
		PlaySound(TackleSound,SLOT_None);
		if(bIsFemale)
		{
			if(FRand()<0.5)
			PlaySound(sound'heref',SLOT_Talk);
			else
			PlaySound(sound'rockf',SLOT_Talk);
		}
		else
		{
			if(FRand()<0.5)
			PlaySound(sound'herem',SLOT_Talk);
			else
			PlaySound(sound'letsgom',SLOT_Talk);
		}
		TweenAnim('Punch',0.05);
		while(TackleDelay<5)
		{
			if(Enemy!=None)
			TurnTo(Enemy.Location);
			TackleDelay++;
			Sleep(0.05);
		}
		LoopAnim('RunLG',1.2);
		AccelRate=8192;
		GroundSpeed=800;
		if(Enemy!=None)
		MoveTo(Enemy.Location+(Enemy.Velocity*0.25),800);
		Sleep(0.05);
	}

	if(AnimSequence!='RIFLESTOMP')
	{
		PlaySound(Sound'Swing1t',SLOT_None);
		PlayAnim('RIFLESTOMP',1,0.05);
	}
	else
	FinishAnim();

	if(Enemy!=None)
	GoToState('Attacking');
	else GoToState('Waiting');
}

State ThrowMine
{
	function ThrowProxMine()
	{
		local UMSProxMine Mine;
		Mine=Spawn(Class'UMSProxMine',Self,,Location+(vect(2.5,0,2.5)>>Rotation),ViewRotation);

		if(Mine!=None)
		{
			MaxMines--;
			ActiveMines++;
		}
	}

	Begin:
	TweenAnim('SLAM',0.1);
	Acceleration*=0; Velocity*=0;
	TurnTo(LastSeenPos);
	Sleep(0.5); 
	PlaySound(Sound'Swing1t',SLOT_None,,,,1.1);
	PlayAnim('Punch',0.5,0.1);
	ThrowProxMine();
	Sleep(0.1);
	MineCD=MineCastCooldown;
	if(Enemy!=None)
	GoToState('Attacking');
	else GoToState('Waiting');
}

defaultproperties
{
	Health=120
	Fatness=132
	ReducedDamageType='Exploded'
	ReducedDamagePct=0.8
	TackleSound=Sound'MarineTackle'
	bMovingRangedAttack=False
	RefireRate=2
	TimeBetweenAttacks=0.5
	bCastMines=True
	MineCastCooldown=5
	MaxActiveMines=2
	MaxMines=4
	CombatStyle=-0.3
	MultiSkins(1)=Texture'UMSMarinesII.Skins.DMarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.DMarine2'
	GlowyBits=(EffectMultiSkin1=None,EffectMultiSkin2=None,ExtraEffect=Texture'UMSMarinesII.FX.DemoMarineGlow',ExtraEffectLayer=MultiSkin1)
	WeaponType=Class'UnrealShare.Eightball'
}