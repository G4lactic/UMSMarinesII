//=============================================================================
// UMSSMGib3R.     right leg
//=============================================================================
class UMSSMGib3R extends UMSMarineChunks;


#exec mesh IMPORT MESH=UMSSMGib3R ANIVFILE=MODELS\UMSsmgib3_a.3d DATAFILE=MODELS\UMSsmgib3_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=UMSSMGib3R X=0 Y=0 Z=0 YAW=128

#exec mesh SEQUENCE MESH=UMSSMGib3R SEQ=All    STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UMSSMGib3R SEQ=flower STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP new   MESHMAP=UMSSMGib3R MESH=UMSSMGib3R
#exec MESHMAP scale MESHMAP=UMSSMGib3R X=0.26 Y=0.3 Z=0.7

#exec MESHMAP SETTEXTURE MESHMAP=UMSSMGib3R NUM=1 TEXTURE=Jsmgib1
#exec MESHMAP SETTEXTURE MESHMAP=UMSSMGib3R NUM=2 TEXTURE=Jsmgib2

defaultproperties
{
	CollisionRadius=20.0
	CollisionHeight=10.0
	Mesh=LodMesh'UMSMarinesII.UMSSMGib3R'
	MultiSkins(1)=Texture'UMSMarinesII.Skins.Jsmgib1'
	MultiSkins(2)=Texture'UMSMarinesII.Skins.Jsmgib2'
}
