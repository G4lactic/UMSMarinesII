//=============================================================================
// LiandriBotChunks.
//=============================================================================
class LiandriBotChunks expands PlayerChunks abstract;

var sound HitSounds[4];

function ChunkUp(int Damage)
{
	if (bHidden)
		return;
	Spawn(class 'LiandriBotHitEffect',,,,rot(16384,0,0));

	if (bPlayerCarcass)
	{
		bHidden = true;
		SetPhysics(PHYS_None);
		SetCollision(false,false,false);
		bProjTarget = false;
		if ( Trail != None )
			Trail.Destroy();
	}
	else
		destroy();
}

simulated function Landed(vector HitNormal)
{
	local rotator finalRot;

	if ( trail != None )
	{
		if ( Level.bHighDetailMode && !Level.bDropDetail )
			bUnlit = false;
		trail.Destroy();
		trail = None;
	}
	finalRot = Rotation;
	finalRot.Roll = 0;
	finalRot.Pitch = 0;
	setRotation(finalRot);
	
	Spawn(class 'LiandriBotHitEffect',,,,rotator(HitNormal));
	SetPhysics(PHYS_None);
	SetCollision(true, false, false);
}

simulated function HitWall(vector HitNormal, actor Wall)
{
	local float speed;

	Velocity = 0.8 * (Velocity - 2 * HitNormal * (Velocity Dot HitNormal));
	Velocity.Z = FMin(Velocity.Z * 0.8, 700);
	speed = VSize(Velocity);
	if ( speed < 350 )
	{
		if ( trail != None )
		{
			if ( Level.bHighDetailMode && !Level.bDropDetail )
				bUnlit = false;
			trail.Destroy();
			trail = None;
		}
		if ( speed < 120 )
		{
			bBounce = false;
			Disable('HitWall');
		}
	}
	else if ( speed > 150 )
	{
		if ( speed > 700 )
			velocity *= 0.8;
		if (  (Level.NetMode != NM_DedicatedServer) && Level.bHighDetailMode && !Level.bDropDetail
			&& (LifeSpan < 19.3) )
			PlaySound(HitSounds[Rand(4)],,12);
	}
	
	
	Spawn(class 'LiandriBotHitEffect',,,,rotator(HitNormal));
}


defaultproperties
{
	TrailSize=0;
	HitSounds(0)=Sound'UnrealI.Hit1'
	HitSounds(1)=Sound'UnrealI.Hit3'
	HitSounds(2)=Sound'UnrealI.Hit5'
	HitSounds(3)=Sound'UnrealI.Hit5'
}