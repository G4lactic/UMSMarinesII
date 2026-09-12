class UMSProxyFX_RingCalm extends NetworkMeshEmitter;

DefaultProperties
{
	ParticleMesh=LodMesh'UnrealShare.Ringex'
	InitialRot=(X=(Min=0.25,Max=0.25))
	bRespawnParticles=False
	MaxParticles=1
	ParticlesPerSec=1.0
	FadeOutTime=0.8
	FadeInMaxAmount=0.6
	ParticleTextures(0)=FireTexture'UnrealShare.Effect56.FireEffect56'
	TimeScale(0)=(DrawScaling=192.0,Time=1.0)
	LifetimeRange=(Min=2.0,Max=2.0)
	StartingScale=(Min=0.1,Max=0.1)
	BoxLocation=(Z=(Min=2.0,Max=2.0))
	ParticleColor=(Y=(Min=0.0,Max=0.0),Z=(Min=0.0,Max=0.0))
	FadeStyle=STY_Translucent
	bRelativeToRotation=True
	bUseRelativeLocation=True
	DrawScale=0.5
	LifeSpan=2.0
	bStatic=False
	bNoDelete=False
}