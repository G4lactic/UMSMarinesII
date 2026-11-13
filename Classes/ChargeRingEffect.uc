class ChargeRingEffect extends Effects;

var XEmitter Em;

function PostBeginPlay()
{
	if(Level.NetMode!=NM_DedicatedServer)
		PostNetBeginPlay();
}

simulated function PostNetBeginPlay()
{
	Super.PostNetBeginPlay();
	Em=Spawn(class'RingEmitter',Owner,,Location,Rotation);
}

simulated function Destroyed()
{
	if(bool(Em)) Em.Kill();
	Super.Destroyed();
}

defaultproperties
{
	LifeSpan=0.25
}
