//=============================================================================
// UMSGlowyVisor2.
//=============================================================================
class UMSGlowyVisor2 extends UMSGlowyVisor;

#exec texture IMPORT NAME=MarineVisorGlowBasic FILE=MODELS\MarineVisorGlowBasic.PCX GROUP=FX LODSET=2

defaultproperties
{
    ScaleGlow=0.5
    Texture=None
    MultiSkins(1)=Texture'UMSMarinesII.MarineVisorGlowBasic'
    MultiSkins(2)=Texture'UWindow.BlackTexture'
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