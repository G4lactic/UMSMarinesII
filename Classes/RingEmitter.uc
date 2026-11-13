class RingEmitter extends NetworkMeshEmitter;

defaultproperties
{
	ParticleMesh=LodMesh'UnrealShare.Ringex'
	InitialRot=(X=(Min=0.25,Max=0.25))
	MaxParticles=4
	ParticlesPerSec=24.0
	FadeInTime=0.05
	FadeOutTime=0.25
	FadeInMaxAmount=0.4
	ParticleTextures(0)=FireTexture'UnrealShare.Effect56.FireEffect56'
	TimeScale(0)=(DrawScaling=6.0,Time=1.0)
	LifetimeRange=(Min=0.5,Max=0.5)
	StartingScale=(Min=2.0,Max=2.0)
	ParticleColor=(Z=(Min=0.0,Max=0.0))
	bRespawnParticles=False
	bNoDelete=False
}