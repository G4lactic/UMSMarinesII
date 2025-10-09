//=============================================================================
// SMGib3.     right leg
//=============================================================================
class SMGib3R extends UMSMarineChunks;


#exec mesh IMPORT MESH=SMGib3R ANIVFILE=MODELS\smgib3_a.3d DATAFILE=MODELS\smgib3_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=SMGib3R X=0 Y=0 Z=0 YAW=128

#exec mesh SEQUENCE MESH=SMGib3R SEQ=All    STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SMGib3R SEQ=flower STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP new   MESHMAP=SMGib3R MESH=smgib3l1
#exec MESHMAP scale MESHMAP=SMGib3R X=0.26 Y=0.3 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=smgib3R NUM=1 TEXTURE=Jsmgib1
#exec MESHMAP SETTEXTURE MESHMAP=smgib3R NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=20.0
	CollisionHeight=10.0
	Mesh=LodMesh'UMSMarinesII.SMGib3R'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
