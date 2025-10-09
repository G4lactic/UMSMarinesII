//=============================================================================
// SMGib1.
//=============================================================================
class SMGib1 extends UMSMarineChunks;


#exec mesh IMPORT MESH=smgib1 ANIVFILE=MODELS\smgib1_a.3d DATAFILE=MODELS\smgib1_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec mesh ORIGIN MESH=smgib1 X=0 Y=0 Z=0 YAW=128

#exec mesh SEQUENCE MESH=smgib1 SEQ=All  STARTFRAME=0 NUMFRAMES=1
#exec mesh SEQUENCE MESH=smgib1 SEQ=fish STARTFRAME=0 NUMFRAMES=1

#exec TEXTURE IMPORT NAME=Jsmgib1 FILE=MODELS\Jsmgib1.PCX GROUP=Skins FLAGS=2 // SMblood4
#exec texture IMPORT NAME=Jsmgib2 FILE=MODELS\Jsmgib2.PCX GROUP=Skins PALETTE=Jsmgib1 // SMbloodx4

#exec MESHMAP new   MESHMAP=smgib1 MESH=smgib1
#exec MESHMAP scale MESHMAP=smgib1 X=0.2 Y=0.2 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=smgib1 NUM=1 TEXTURE=Jsmgib1
#exec MESHMAP SETTEXTURE MESHMAP=smgib1 NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=10.0
	CollisionHeight=10.0
	Mesh=LodMesh'UMSMarinesII.SMGib1'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
