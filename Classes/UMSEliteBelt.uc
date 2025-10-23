//=============================================================================
// UMSEliteBelt.
//=============================================================================
class UMSEliteBelt extends ShieldBelt;

defaultproperties
{
	TeamFireTextures(0)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.RedShield'
	TeamFireTextures(1)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.RedShield'
	TeamFireTextures(2)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.RedShield'
	TeamFireTextures(3)=FireTexture'UnrealShare.Belt_fx.ShieldBelt.RedShield'
	TeamTextures(0)=Texture'UnrealShare.Belt_fx.ShieldBelt.newred'
	TeamTextures(1)=Texture'UnrealShare.Belt_fx.ShieldBelt.newred'
	TeamTextures(2)=Texture'UnrealShare.Belt_fx.ShieldBelt.newred'
	TeamTextures(3)=Texture'UnrealShare.Belt_fx.ShieldBelt.newred'
	Charge=150
	ArmorAbsorption=100
	AbsorptionPriority=10
	RespawnTime=0.0
	MaxDesireability=2.0
	PickupViewMesh=LodMesh'UnrealShare.ShieldBeltMesh'
	PickupSound=Sound'UnrealShare.Pickups.BeltSnd'
	DeActivateSound=Sound'UnrealShare.Pickups.Sbelthe2'
	Icon=Texture'UnrealShare.Icons.I_ShieldBelt'
	ProtectionType1="ProtectNone"
	ProtectionType2="ProtectNone"
	PickupMessage="You got the Shield Belt."
	bDisplayableInv=True
	bIsAnArmor=True
	CollisionRadius=20.0
	CollisionHeight=5.0
	Mesh=LodMesh'UnrealShare.ShieldBeltMesh'
	RemoteRole=ROLE_DumbProxy
	bOwnerNoSee=True
}