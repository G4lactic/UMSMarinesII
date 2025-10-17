//=============================================================================
// UMSSMGib1R.
//=============================================================================
class UMSSMGib1R extends UMSMarineChunks;

#exec mesh IMPORT MESH=UMSsmgib1R ANIVFILE=MODELS\UMSsmgib1_a.3d DATAFILE=MODELS\UMSsmgib1_d.3d X=0 Y=0 Z=0 UNMIRROR=0
#exec mesh ORIGIN MESH=UMSsmgib1R X=0 Y=0 Z=0 YAW=128

#exec mesh SEQUENCE MESH=UMSsmgib1R SEQ=All  STARTFRAME=0 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSsmgib1R SEQ=fish STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP new   MESHMAP=UMSsmgib1R MESH=UMSsmgib1R
#exec MESHMAP scale MESHMAP=UMSsmgib1R X=0.2 Y=0.2 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=UMSsmgib1R NUM=1 TEXTURE=Jsmgib1
#exec MESHMAP SETTEXTURE MESHMAP=UMSsmgib1R NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=10.0
	CollisionHeight=10.0
	Mesh=LodMesh'UMSMarinesII.UMSsmgib1R'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
