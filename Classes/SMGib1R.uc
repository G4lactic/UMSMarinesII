//=============================================================================
// SMGib1R.
//=============================================================================
class SMGib1R extends UMSMarineChunks;

#exec mesh IMPORT MESH=smgib1R ANIVFILE=MODELS\smgib1_a.3d DATAFILE=MODELS\smgib1_d.3d X=0 Y=0 Z=0 UNMIRROR=0
#exec mesh ORIGIN MESH=smgib1R X=0 Y=0 Z=0 YAW=128

#exec mesh SEQUENCE MESH=smgib1R SEQ=All  STARTFRAME=0 NUMFRAMES=1
#exec mesh SEQUENCE MESH=smgib1R SEQ=fish STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP new   MESHMAP=smgib1R MESH=smgib1R
#exec MESHMAP scale MESHMAP=smgib1R X=0.2 Y=0.2 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=smgib1R NUM=1 TEXTURE=Jsmgib1
#exec MESHMAP SETTEXTURE MESHMAP=smgib1R NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=10.0
	CollisionHeight=10.0
	Mesh=LodMesh'UMSMarinesII.SMGib1R'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
