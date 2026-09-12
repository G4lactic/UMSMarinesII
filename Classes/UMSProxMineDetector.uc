//=============================================================================
// UMSProxMine
//=============================================================================
class UMSProxMineDetector extends Actor;

var bool bJustStateChanged;

// Set these in UMSProxMine, not here
var Sound IdleSound, AlertSound;
var class<Actor> IdleFXClass, GlareIdleFXClass, AlertFXClass, GlareAlertFXClass;
var Actor AlertFX, AlertGlare, IdleFX, IdleGlare;
var float IdleFXRate, AlertFXRate;
var float IdleCollisionRadius;
var int AlertTicks, MaxAlertTicks, NumTouching;
var UMSProxMine Mine;

simulated function Touch(Actor Other)
{
	if ( Other == Owner || Other == Mine || !Other.IsA('Pawn') )
		return;

	if ( !IsInState('Alert') )
		GoToState('Alert');
	NumTouching++;
}

simulated function UnTouch(Actor Other)
{
	if ( Other == Owner || Other == Mine || !Other.IsA('Pawn') )
		return;
	
	if ( NumTouching > 0 )
		NumTouching--;

	if ( NumTouching <= 0 )
		GoToState('Idle');
}

function Destroyed()
{
	IdleFX.Destroy();
	IdleGlare.Destroy();
	AlertFX.Destroy();
	AlertGlare.Destroy();
}

state Idle
{
	function BeginState()
	{
		NumTouching = 0;
		bJustStateChanged = True;
		SetTimer(0.5, False);
	}

	function Timer()
	{
		// XXX: right slot?
		PlaySound(IdleSound, SLOT_Misc);
		IdleFX = Spawn(IdleFXClass, Self,, Location);
		IdleGlare = Spawn(GlareIdleFXClass, Self,, Location + vect(0,0,6));
		if (bJustStateChanged)
		{
			bJustStateChanged = False;
			SetTimer(IdleFXRate, True);
		}
	}
}

state Alert
{
	function BeginState()
	{
		//SetCollisionSize(Default.CollisionRadius, Default.CollisionHeight);
		bJustStateChanged = True;
		AlertTicks = 0;
		IdleFX.Destroy();
		IdleGlare.Destroy();
		AlertFX = Spawn(AlertFXClass, Self,, Location);
		AlertGlare = Spawn(GlareAlertFXClass, Self,, Location + vect(0,0,6));
		SetTimer(0.1, False);
	}

	function EndState()
	{
		AlertFX.LifeSpan = 0.3;
		AlertGlare.LifeSpan = 0.3;
	}

	function Timer()
	{
		PlaySound(AlertSound, SLOT_None);
		if (bJustStateChanged)
		{
			bJustStateChanged = False;
			SetTimer(AlertFXRate, True);
		}

		Log(Name$":"@AlertTicks);
		if (NumTouching > 0)
			AlertTicks++;

		if (AlertTicks >= MaxAlertTicks)
			Mine.Explode(Location, vect(0,0,0));
	}
}

defaultproperties
{
	DrawType=DT_None
	CollisionRadius=112.000000
	CollisionHeight=64.000000
	bCollideActors=True
	bGameRelevant=True
	bNoDynamicShadowCast=True
	RemoteRole=ROLE_DumbProxy
}