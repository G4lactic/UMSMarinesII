class UMSProxyFX_RingAlert extends MeshEmitter;

DefaultProperties
{
	ParticleMesh=LodMesh'UnrealShare.Ringex'
	InitialRot=(X=(Min=0.25,Max=0.25))
	MaxParticles=9999
	ParticlesPerSec=2.0
	FadeOutTime=0.1
	ParticleTextures(0)=FireTexture'UnrealShare.Effect56.FireEffect56'
	TimeScale(0)=(DrawScaling=64.0,Time=1.0)
	LifetimeRange=(Min=0.4,Max=0.4)
	StartingScale=(Min=0.1,Max=0.1)
	BoxLocation=(Z=(Min=2.0,Max=2.0))
	BoxVelocity=(Z=(Min=8.0,Max=8.0))
	VelocityLossRate=(Z=1.0)
	ParticleColor=(Y=(Min=0.0,Max=0.0),Z=(Min=0.0,Max=0.0))
	FadeStyle=STY_Translucent
	bRelativeToRotation=True
	bUseRelativeLocation=True
	DrawScale=0.5
	bStatic=False
	bNoDelete=False
}