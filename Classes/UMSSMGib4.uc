//=============================================================================
// UMSSMGib4.
//=============================================================================
class UMSSMGib4 extends UMSMarineChunks;


#exec MESH IMPORT MESH=UMSSMGib4 ANIVFILE=MODELS\UMSMarine\UMSsmgib4_a.3d DATAFILE=MODELS\UMSMarine\UMSsmgib4_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=UMSSMGib4 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UMSSMGib4 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSSMGib4 SEQ=bee STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW   MESHMAP=UMSSMGib4 MESH=UMSSMGib4
#exec MESHMAP SCALE MESHMAP=UMSSMGib4 X=0.3 Y=0.3 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=UMSSMGib4 NUM=1 TEXTURE=Jsmgib1
#exec MESHMAP SETTEXTURE MESHMAP=UMSSMGib4 NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=20.0
	CollisionHeight=15.0
	Mesh=LodMesh'UMSMarinesII.UMSSMGib4'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
