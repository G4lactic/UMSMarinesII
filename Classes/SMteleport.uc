//=============================================================================
// SMteleport - Asgard
//=============================================================================

class SMteleport expands effects;

#exec  OBJ LOAD FILE=..\Textures\XFX.utx


var() sound teleport;

simulated function PostBeginPlay()
{
 local Actor a;

	if ( Level.NetMode != NM_DedicatedServer )
	{
	 a = Spawn(class'MarineTeleportEffect',,,Location+Vect(0,0,-1)*30);
	 if(a!=none)
	  a.RemoteRole = ROLE_None;
	}
}

defaultproperties
{
	Teleport=None
	LifeSpan=1.0
	DrawScale=0.3
	Texture=FireTexture'XFX.xeolighting'
	RemoteRole=ROLE_SimulatedProxy
	DrawType=DT_Sprite
	Style=STY_Translucent
	bNetOptional=True
}
