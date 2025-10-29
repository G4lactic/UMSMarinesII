//=============================================================================
// LiandriBotSpark.
//=============================================================================
class LiandriBotSpark extends Spark;

function PostBeginPlay()
{
	Velocity = (Vector(Rotation) + VRand()) * 100 * FRand();
}

defaultproperties
{
	DrawScale=0.05
}