//=============================================================================
// SMGib3. left leg
//=============================================================================
class SMGib3 extends UMSMarineChunks;


#exec mesh IMPORT MESH=SMGib3 ANIVFILE=MODELS\smgib3_a.3d DATAFILE=MODELS\smgib3_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=SMGib3 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=SMGib3 SEQ=All    STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SMGib3 SEQ=flower STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW   MESHMAP=SMGib3 MESH=SMGib3
#exec MESHMAP scale MESHMAP=SMGib3 X=0.26 Y=0.3 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=SMGib3 NUM=1 TEXTURE=Jsmgib1
#exec MESHMAP SETTEXTURE MESHMAP=SMGib3 NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=20.0
	CollisionHeight=10.0
	Mesh=LodMesh'UMSMarinesII.SMGib3'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
