//=============================================================================
// MarineTeleportEffect - Asgard.
//=============================================================================
class MarineTeleportEffect extends Effects;

auto state Explode
{
	simulated function Tick(float DeltaTime)
	{
		if ( (Level.NetMode == NM_DedicatedServer) || !Level.bHighDetailMode )
		{
			Disable('Tick');
			return;
		}
		ScaleGlow = (Lifespan/Default.Lifespan);	
		LightBrightness = ScaleGlow*210.0;

	}

	simulated function BeginState()
	{
		PlaySound (EffectSound1,,0.5,,500);
		PlayAnim('All',0.6);
	}
}

defaultproperties
{
	LifeSpan=1.5
	DrawScale=0.1
	Texture=Texture'UnrealShare.DispExpl.dseb_A00'
	Skin=Texture'UnrealShare.DispExpl.dseb_A00'
	Mesh=LodMesh'UnrealShare.TeleEffect3'
	AnimSequence="All"
	RemoteRole=ROLE_SimulatedProxy
	DrawType=DT_Mesh
	Style=STY_Translucent
	LightType=LT_Pulse
	LightEffect=LE_NonIncidence
	LightBrightness=255
	LightHue=170
	LightSaturation=96
	LightRadius=12
	bUnlit=True
	bParticles=True
}
