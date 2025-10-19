//=============================================================================
// UMSSpaceMarineBody - GFour
// Use this to decorate your level with dead marines!!!
//=============================================================================

class UMSSpaceMarineBody extends CreatureCarcass;

defaultproperties
{
	flies=0
	CollisionRadius=27.0
	CollisionHeight=13.0
	PrePivot=(Z=32.0)
	bBlockActors=False
	bBlockPlayers=False
	BodyParts(0)=LodMesh'UMSMarinesII.UMSSMGib1R'
	BodyParts(1)=LodMesh'UMSMarinesII.UMSSMGib1'
	BodyParts(2)=LodMesh'UMSMarinesII.UMSSMGib2'
	BodyParts(3)=LodMesh'UMSMarinesII.UMSSMGib3'
	BodyParts(4)=LodMesh'UMSMarinesII.UMSSMGib3R'
	BodyParts(5)=LodMesh'UMSMarinesII.UMSSMGib4'
	BodyParts(6)=LodMesh'UnrealShare.LiverM'
	BodyParts(7)=LodMesh'UnrealShare.stomachM'
	Mesh=LodMesh'UMSMarinesII.UMSMarine'
	AnimSequence="Dead2"
}