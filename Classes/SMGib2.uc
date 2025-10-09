//=============================================================================
// SMGib2.
//=============================================================================
class SMGib2 extends UMSMarineChunks;


#exec MESH IMPORT MESH=SMGib2 ANIVFILE=MODELS\smgib2_a.3d DATAFILE=MODELS\smgib2_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=SMGib2 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=SMGib2 SEQ=All  STARTFRAME=0 NUMFRAMES=1
#exec mesh SEQUENCE MESH=SMGib2 SEQ=bird STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP new   MESHMAP=SMGib2 MESH=SMGib2
#exec MESHMAP scale MESHMAP=SMGib2 X=0.3 Y=0.3 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=SMGib2 NUM=1 TEXTURE=Jsmgib1
//#exec MESHMAP SETTEXTURE MESHMAP=smgib2T NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=10.0
	CollisionHeight=10.0
	Mesh=LodMesh'UMSMarinesII.SMGib2'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
