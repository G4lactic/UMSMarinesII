//=============================================================================
// LiandriBotSpark.
//=============================================================================
class LiandriBotSpark extends Effects;

function PostBeginPlay()
{
	Velocity = (Vector(Rotation) + VRand()) * 100 * FRand();
}

auto state Explode
{
	simulated function ZoneChange( ZoneInfo NewZone )
	{
		if ( NewZone.bWaterZone )
			Destroy();
	}

	simulated function Landed( vector HitNormal )
	{
		Destroy();
	}

	simulated function HitWall( vector HitNormal, actor Wall )
	{
		Destroy();
	}
}

defaultproperties
{
	DrawScale=0.05
	LifeSpan=1.0
	NetPriority=2.0
	Texture=Texture'UnrealShare.Effects.Sparky'
	Physics=PHYS_Falling
	RemoteRole=ROLE_None
	DrawType=DT_Sprite
	Style=STY_Translucent
	bUnlit=True
	bCollideWorld=True
	bBounce=True
}