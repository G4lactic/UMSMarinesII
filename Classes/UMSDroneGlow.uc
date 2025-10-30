//=============================================================================
// UMSDroneGlow.
//=============================================================================
class UMSDroneGlow extends Effects;

simulated function Destroyed()
{
    if ( Level.NetMode!=NM_Client && Owner!=None && !Owner.bDeleteMe )
        Owner.SetDefaultDisplayProperties();
    Super.Destroyed();
}



simulated function Tick(float DeltaTime)
{
    Fatness = Owner.Fatness+1;
    if ( Pawn(Owner)!=None && Pawn(Owner).Health>0)
    {
        Mesh = Owner.Mesh;
        bHidden = Owner.bHidden;
        PrePivot = Owner.PrePivot;
        DrawScale = Owner.DrawScale;
    }
    else bHidden=True;
}

defaultproperties
{
    ScaleGlow=0.5
    Texture=None
    MultiSkins(0)=Texture'UWindow.BlackTexture'
    MultiSkins(1)=Texture'UMSMarinesII.GlowRed'
    Physics=PHYS_Trailer
    RemoteRole=ROLE_SimulatedProxy
    DrawType=DT_Mesh
    Style=STY_Translucent
    AmbientGlow=255
    Fatness=129
    LightEffect=LE_WateryShimmer
    LightBrightness=200
    LightHue=30
    LightRadius=16
    LightPeriod=64
    bAnimByOwner=True
    bNetTemporary=False
    bTrailerSameRotation=True
    bUnlit=True
    bOwnerNoSee=True
    bCarriedItem=True
}