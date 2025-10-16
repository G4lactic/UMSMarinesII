//=============================================================================
// UMSSMGib3. left leg
//=============================================================================
class UMSSMGib3 extends UMSMarineChunks;


#exec mesh IMPORT MESH=UMSSMGib3 ANIVFILE=MODELS\UMSsmgib3_a.3d DATAFILE=MODELS\UMSsmgib3_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=UMSSMGib3 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UMSSMGib3 SEQ=All    STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSSMGib3 SEQ=flower STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW   MESHMAP=UMSSMGib3 MESH=UMSSMGib3
#exec MESHMAP scale MESHMAP=UMSSMGib3 X=0.26 Y=0.3 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=UMSSMGib3 NUM=1 TEXTURE=Jsmgib1
#exec MESHMAP SETTEXTURE MESHMAP=UMSSMGib3 NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=20.0
	CollisionHeight=10.0
	Mesh=LodMesh'UMSMarinesII.UMSSMGib3'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
