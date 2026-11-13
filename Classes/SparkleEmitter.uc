class SparkleEmitter extends NetworkEmitter;

defaultproperties
{
	FadeInTime=0.01
	FadeOutTime=0.1
	RevolutionTimeScale(0)=(RevolutionScale=(X=1.0,Y=1.0,Z=1.0),Time=10000.0)
	ParticleTextures(0)=Texture'SpaceFX.3e'
	TimeScale(0)=(DrawScaling=-1.0,Time=1.0)
	LifetimeRange=(Min=0.25,Max=0.25)
	RevolutionsPerSec=(X=(Min=0.1),Y=(Min=0.1,Max=1.0),Z=(Min=0.1,Max=1.0))
	StartingScale=(Min=0.05,Max=0.1)
	BoxLocation=(X=(Min=-32.0,Max=32.0),Y=(Min=-32.0,Max=32.0),Z=(Min=-32.0,Max=32.0))
	BoxVelocity=(X=(Min=25.0,Max=-25.0),Y=(Min=25.0,Max=-25.0),Z=(Min=25.0,Max=-25.0))
	bRevolutionEnabled=True
	bVelRelativeToRotation=True
	bRespawnParticles=False
	bNoDelete=False
}