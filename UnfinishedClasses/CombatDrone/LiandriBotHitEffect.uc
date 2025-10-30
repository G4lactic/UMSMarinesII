//=============================================================================
// LiandriBotHitEffect.
//=============================================================================
class LiandriBotHitEffect extends HeavyWallHitEffect;



simulated function SpawnSound()
{}

simulated function SpawnEffects()
{
	local Actor A;
	local int j;
	local vector Dir;

	SpawnSound();

	for ( j=0; j<2; j++ )
	if ( FRand() < 0.35 ) 
	{
		A = spawn(class'Chip');
		if ( A != None )
			A.RemoteRole = ROLE_None;
	}

	Dir = Vector(Rotation);
	if ( !Level.bHighDetailMode )
		return;
		
	//A = Spawn(class'SpriteSmokePuff',,,Location + 8 * Vector(Rotation));
	//A.RemoteRole = ROLE_None;
	if ( Region.Zone.bWaterZone )
		return;
		
		for (j=0; j<8; j++) 
			spawn(class'LiandriBotSpark',,,Location + 8 * Vector(Rotation));
}

defaultproperties
{
	DrawType=DT_None
}