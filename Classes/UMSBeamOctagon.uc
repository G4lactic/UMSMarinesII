//=============================================================================
// UMSBeamOctagon.
// - Xaleros
//=============================================================================
class UMSBeamOctagon expands Effects;

#exec MESH IMPORT MESH=UMSOctagon ANIVFILE=MODELS\FX\Octagon_a.3d DATAFILE=MODELS\FX\Octagon_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=UMSOctagon X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UMSOctagon SEQ=All     STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSOctagon SEQ=OCTAGON STARTFRAME=0 NUMFRAMES=1

#exec TEXTURE IMPORT NAME=JOctagon0 FILE=Textures\FX\JOctagon0.PCX GROUP=FX FLAGS=2 // SKIN

#exec MESHMAP NEW   MESHMAP=UMSOctagon MESH=UMSOctagon
#exec MESHMAP SCALE MESHMAP=UMSOctagon X=0.1 Y=0.1 Z=125.2

#exec MESHMAP SETTEXTURE MESHMAP=UMSOctagon NUM=0 TEXTURE=JOctagon0

#exec AUDIO IMPORT FILE="SOUNDS\SFX\BeamIn.WAV" NAME="BeamIn" GROUP="SFX"

var() float FadeInTime;
var() float FadeOutTime;
var() float HoldTime;
var float FadeTimer;
var float DebugTimer;

simulated function PostBeginPlay()
{
	local Actor Other;
	local vector HitLocation, HitNormal;
	local vector TraceEnd;

	// Fix the beam to the ground
	TraceEnd = Location;
	TraceEnd.Z -= 10000;
	Other = Trace(HitLocation, HitNormal, TraceEnd, Location, False);
	if (Other != None)
		SetLocation(HitLocation);
}

// Sets the fade timer values and starts the effect
simulated function SetFade(float NewFadeInTime, float NewHoldTime, float NewFadeOutTime)
{
	FadeInTime = NewFadeInTime;
	FadeOutTime = NewFadeOutTime;
	HoldTime = NewHoldTime;
	GotoState('FadingIn');
}

simulated state FadingIn
{
	simulated function Timer()
	{
		GotoState('FadingOut');
	}

	simulated function BeginState()
	{
		Fadetimer = 0.0;
		Fatness = 0;
		SoundVolume = 1;
	}

	simulated function Tick( float DeltaTime )
	{
		FadeTimer += DeltaTime;
		if ( FadeTimer > FadeInTime )
		{
			Disable('Tick');
			SetTimer(HoldTime, False);
			return;
		}
		
	    if( SoundVolume <= Default.SoundVolume )
	        SoundVolume = Default.SoundVolume * (FadeTimer / Default.FadeInTime);

	    if( Mesh != None && Fatness < Default.Fatness )
	        Fatness = Default.Fatness * (FadeTimer / Default.FadeInTime);
	}
}

simulated state FadingOut
{
    simulated function BeginState()
    {
		if( Level.NetMode==NM_DedicatedServer )
	    {
	        Destroy();
	        Return;
	    }
		Enable('Tick');
   		SoundVolume = Default.SoundVolume;
		Fatness = Default.Fatness;
		FadeTimer = 0.0;
        bUnlit = True;
    }
    
    simulated function Tick( float DeltaTime )
    {
        FadeTimer += DeltaTime;
        if ( FadeTimer > Default.FadeOutTime )
		{
			Destroy();
            return;
		}

	    if ( SoundVolume > 1.0 )
	   		SoundVolume = Default.SoundVolume * (1.0 - (FadeTimer / Default.FadeOutTime));

	    if ( Fatness > 0.0 )
	        Fatness = Default.Fatness * (1.0 - (FadeTimer / Default.FadeOutTime));

		if ( DrawScale > 0.85 )
			DrawScale = 1.0 - (0.25 * (FadeTimer / Default.FadeOutTime));

		if ( ScaleGlow > 0.01 )
			ScaleGlow = 1.0 - (FadeTimer / Default.FadeOutTime);
    }
}


defaultproperties
{
    AmbientSound=sound'UMSMarinesII.SFX.BeamIn'
    LifeSpan=10.0
    CollisionRadius=22.0
    CollisionHeight=1.0
    Texture=FireTexture'UMSMarinesII.FX.beam3'
    Skin=FireTexture'UMSMarinesII.FX.beam3'
    Physics=PHYS_None
    RemoteRole=ROLE_SimulatedProxy
    DrawType=DT_Mesh
    Style=STY_Translucent
    Mesh=Mesh'UMSOctagon'
    bUnlit=True
    Fatness=220
    bCollideWorld=True
	SoundVolume=128
    SoundRadius=128
	FadeInTime=2.0
	FadeOutTime=5
	HoldTime=0.5
}