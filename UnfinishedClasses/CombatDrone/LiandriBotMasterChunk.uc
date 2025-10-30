//=============================================================================
// LiandriBotMasterChunk.
//=============================================================================
class LiandriBotMasterChunk expands MasterCreatureChunk;

var sound HitSounds[4];

function SpawnHead()
{
	local carcass carc;
	
	carc = Spawn(class'LiandriBotHead');
	if ( carc != None )
		carc.Initfor(self);
}

function ChunkUp(int Damage)
{
	if (bHidden)
		return;
	Spawn(class 'LiandriBotHitEffect',,,,rot(16384,0,0));
	Destroy();
}

simulated function Landed(vector HitNormal)
{
	local rotator finalRot;

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
	if ( speed < 120 )
	{
		bBounce = false;
		Disable('HitWall');
	}

	else if ( speed > 150 )
	{
		if ( speed > 700 )
			velocity *= 0.8;
		if (  (Level.NetMode != NM_DedicatedServer) && Level.bHighDetailMode
			&& (LifeSpan < 19.3) )
			PlaySound(HitSounds[Rand(4)],,12);
	}
	
	
	Spawn(class 'LiandriBotHitEffect',,,,rotator(HitNormal));
}


simulated function ClientExtraChunks(bool bSpawnChunks)
{
	local carcass carc;

	If ( Level.NetMode == NM_DedicatedServer )
		return;
	if ( class'GameInfo'.Default.bLowGore )
	{
		Destroy();
		return;
	}

	Spawn(class 'LiandriBotHitEffect',,,,rot(16384,0,0));


	if ( Owner.AnimSequence != 'Dead4')
	{
		carc = Spawn(class'LiandriBotHead');
		if ( carc != None )
			carc.Initfor(self);
	}

	carc = Spawn(class 'LiandriBotTorso');
	if (carc != None)
		carc.Initfor(self);
		
	carc = Spawn(class 'LiandriBotLeftArm');
	if (carc != None)
		carc.Initfor(self);

	carc = Spawn(class 'LiandriBotRightArm');
	if (carc != None)
		carc.Initfor(self);

	carc = Spawn(class 'LiandriBotLeftLeg');
	if (carc != None)
		carc.Initfor(self);

	carc = Spawn(class 'LiandriBotRightLeg');
	if (carc != None)
		carc.Initfor(self);
}


defaultproperties
{
	TrailSize=0;
	Mesh=Mesh'UMSMarinesII.DroneHip'
	HitSounds(0)=Sound'UnrealI.flak.Hit1'
	HitSounds(1)=Sound'UnrealI.flak.Hit3'
	HitSounds(2)=Sound'UnrealI.flak.Hit5'
	HitSounds(3)=Sound'UnrealI.flak.Hit5'
}