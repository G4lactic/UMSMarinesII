//=============================================================================
// UMSSMGib2.
//=============================================================================
class UMSSMGib2 extends UMSMarineChunks;


#exec MESH IMPORT MESH=UMSSMGib2 ANIVFILE=MODELS\UMSMarine\UMSsmgib2_a.3d DATAFILE=MODELS\UMSMarine\UMSsmgib2_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=UMSSMGib2 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UMSSMGib2 SEQ=All  STARTFRAME=0 NUMFRAMES=1
#exec mesh SEQUENCE MESH=UMSSMGib2 SEQ=bird STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP new   MESHMAP=UMSSMGib2 MESH=UMSSMGib2
#exec MESHMAP scale MESHMAP=UMSSMGib2 X=0.3 Y=0.3 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=UMSSMGib2 NUM=1 TEXTURE=Jsmgib1
//#exec MESHMAP SETTEXTURE MESHMAP=smgib2T NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=10.0
	CollisionHeight=10.0
	Mesh=LodMesh'UMSMarinesII.UMSSMGib2'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
