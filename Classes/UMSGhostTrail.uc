//=============================================================================
// UMSGhostTrail - GFour
//=============================================================================
class UMSGhostTrail extends Effects;

var bool bExpanding;

simulated function PostBeginPlay()
{
	//local int i;

	if(Owner!=None || Owner.bDeleteMe)
	{
		Mesh=Owner.Mesh;
		//Skin=Owner.Skin;
		DrawScale=Owner.DrawScale;
		AnimSequence=Owner.AnimSequence;
		AnimFrame=Owner.AnimFrame;
		PrePivot=Owner.PrePivot;
		//for(i=0; i<8; i++)
		//MultiSkins[1]=Texture'UnrealShare.Effect3.FireEffect3';
		//MultiSkins[2]=Texture'UnrealShare.Effect3.FireEffect3';
		Texture=Texture'UnrealShare.Effect3.FireEffect3';
		Fatness=Owner.Fatness;
	}
	Super.PostBeginPlay();
}

simulated function tick(float DT)
{
	if(VSize(Location-Owner.Location)<=(Owner.CollisionRadius*2)) bOwnerNoSee=True;
	else bOwnerNoSee=False;

	ScaleGlow-=DT*1.95;
	if(ScaleGlow<=0)
	Destroy();


		if( Fatness > 115 && !bExpanding )
		{
			Fatness -= 2;
		}
		else
		{
			bExpanding = True;
			if(Fatness < 128 )
			{
				Fatness += 2;
			}
			else
				bExpanding = False;
		}
}

defaultproperties
{
	LifeSpan=0.45
	ScaleGlow=0.45
	//ActorRenderColor=(R=32,G=255,B=220)
	//ActorGUnlitColor=(R=32,G=255,B=220)
	//AmbientGlowColor=(R=32,G=255,B=220)
	RemoteRole=ROLE_SimulatedProxy
	DrawType=DT_Mesh
	Style=STY_Translucent
	bNetTemporary=False
	bMeshEnviroMap=True
	bUnlit=True
	bAlwaysRelevant=True
}