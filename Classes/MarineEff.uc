//=============================================================================
// MarineEff - Asgard
//=============================================================================
class MarineEff extends Effects;



simulated function Tick(float DeltaTime)
{
	if ( (Fatness > Default.Fatness) && (Level.NetMode != NM_DedicatedServer) )
		Fatness = Max(Default.Fatness, Fatness - 130 * DeltaTime );
	if ( Owner != None )
    {
		if ( (bHidden != Owner.bHidden) && (Level.NetMode != NM_DedicatedServer) )
			bHidden = Owner.bHidden;
        DrawScale = Owner.Drawscale;
	}
}

defaultproperties
{
	Texture=Texture'UnrealShare.SKEffect.Skj_a08'
	Physics=PHYS_Trailer
	RemoteRole=ROLE_SimulatedProxy
	DrawType=DT_Mesh
	Style=STY_Translucent
	AmbientGlow=64
	Fatness=157
	bAnimByOwner=True
	bNetTemporary=False
	bTrailerSameRotation=True
	bUnlit=True
	bMeshEnviroMap=True
	bOwnerNoSee=True
}
