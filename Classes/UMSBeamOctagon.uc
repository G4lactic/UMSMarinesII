//=============================================================================
// UMSBeamOctagon.
//=============================================================================
class UMSBeamOctagon expands Effects;

#exec MESH IMPORT MESH=UMSOctagon ANIVFILE=MODELS\Octagon_a.3d DATAFILE=MODELS\Octagon_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=UMSOctagon X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UMSOctagon SEQ=All     STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSOctagon SEQ=OCTAGON STARTFRAME=0 NUMFRAMES=1

#exec TEXTURE IMPORT NAME=JOctagon0 FILE=MODELS\JOctagon0.PCX GROUP=FX FLAGS=2 // SKIN

#exec MESHMAP NEW   MESHMAP=UMSOctagon MESH=UMSOctagon
#exec MESHMAP SCALE MESHMAP=UMSOctagon X=0.1 Y=0.1 Z=125.2

#exec MESHMAP SETTEXTURE MESHMAP=UMSOctagon NUM=0 TEXTURE=JOctagon0

#exec AUDIO IMPORT FILE="SOUNDS\BeamIn.WAV" NAME="BeamIn" GROUP="SFX"

simulated function PostBeginPlay()
{
	Fatness = 0;
	Disable( 'Tick' );
	if (Level.Game.Difficulty >= 3)
	SetTimer( 2.5, false );
	else
	SetTimer( 5.5, false );
}
simulated event Landed( vector HitNormal )
{
	AmbientSound = sound'BeamIn';
	SoundVolume = 1;
	SoundRadius = 128;
	Mesh = mesh'Octagon';
	Enable( 'Tick' );
}
simulated function Tick( float DeltaTime )
{
	if( SoundVolume <= 128 )
		SoundVolume += 2;
	
	if( Fatness < 220 && mesh != none )
		Fatness += 1;
}
simulated function Timer()
{
	if( Level.NetMode==NM_DedicatedServer )
	{
		Destroy();
		Return;
	}
	SoundVolume = 128;
	GotoState( 'FadingOut' );
}
simulated state FadingOut
{
	simulated function BeginState()
	{
	}
	
	simulated function Tick( float DeltaTime )
	{
		if( Fatness > 0.0 )
		{
			Fatness -= 1;
			if( DrawScale > 1 )
				DrawScale -= 0.01;
		}
		else
		{
			if( ScaleGlow > 0.01 )
			{
				if( SoundVolume > 15 )
					SoundVolume -= 1;
				bUnlit = false;
				ScaleGlow -= 0.01;
			}
			else Destroy();
		}
	}
}

defaultproperties
{
	LifeSpan=10.0
	CollisionRadius=22.0
	CollisionHeight=1.0
	Texture=FireTexture'UMSMarinesII.BeamEffect.beam3'
	Skin=FireTexture'UMSMarinesII.BeamEffect.beam3'
	Physics=PHYS_Falling
	RemoteRole=ROLE_SimulatedProxy
	DrawType=DT_Mesh
	Style=STY_Translucent
	ScaleGlow=1.25
	bUnlit=True
	bCollideWorld=True
	bMeshEnviroMap=false
}