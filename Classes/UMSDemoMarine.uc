//=============================================================================
// UMSDemoMarine
//=============================================================================
class UMSDemoMarine extends UMSSpecialForces;

#exec texture IMPORT NAME=JProxSkin FILE=Textures\Skins\Jdetn1.PCX GROUP=Skins LODSET=2

var(UMSDemolitionsMarine) bool bTurret,bCastMines;
var(UMSDemolitionsMarine) int MaxMines,MaxActiveMines;
var(UMSDemolitionsMarine) float MineCastCooldown;

var int ActiveMines;
var float MineCD;

Function Tick(Float DeltaTime)
{
	if( !bBeamingIn && bCastMines && MaxMines > 0 && ActiveMines < MaxActiveMines && Enemy != None && (!IsInState('ThrowMine')) 
	&& (!CanSee(Enemy)) && MineCD <= 0 && VSize(Enemy.Location - Location) < 1500 && MineCD <= 0 && VSize(LastSeenPos - Location) > 200 && FRand() < 0.75)
	{
		GotoState('ThrowMine');
	}

	if(MineCD > 0)
	{
		MineCD -= DeltaTime;
	}
}

State ThrowMine
{
	Function BeginState()
	{
		MaxMines--;
		ActiveMines++;
	}

	function ThrowProxMine()
	{
		local UMSProxMine Mine;
		Mine=Spawn(Class'UMSProxMine',Self,,Location+(vect(2.5,0,2.5)>>Rotation),ViewRotation);
	}

	Begin:
	TweenAnim('SLAM',0.1);
	Acceleration*=0; Velocity*=0;
	Sleep(0.5); 
	PlayAnim('Punch',0.5,0.1);
	TurnToward(Enemy);
	ThrowProxMine();
	MineCD=MineCastCooldown;
	if(Enemy!=None)
	GoToState('Attacking');
	else GoToState('Waiting');
}

defaultproperties
{
	bCastMines=True
	MineCastCooldown=5
	MaxActiveMines=2
	MaxMines=4
	CombatStyle=-0.3
	MultiSkins(1)=Texture'UMSMarinesII.Skins.DMarine1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.DMarine2'
	GlowyBits=(EffectMultiSkin1=None,EffectMultiSkin2=None,ExtraEffect=Texture'UMSMarinesII.FX.DemoMarineGlow',ExtraEffectLayer=MultiSkin1)
	WeaponType='UnrealShare.Eightball'
}