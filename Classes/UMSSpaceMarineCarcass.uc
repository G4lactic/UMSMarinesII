//=============================================================================
// UMSSpaceMarineCarcass  -- Asgard
// CARCASS USED BY PAWNS!!! PLEASE USE "UMSSpaceMarineBody" FOR DECORATION.
//=============================================================================

class UMSSpaceMarineCarcass extends CreatureCarcass;


function ForceMeshToExist()
{
	//never called
	Spawn(class 'UMSSpaceMarine');
}

function Initfor(actor Other)
{
	local int i;

	bReducedHeight = false;
	PrePivot = vect(0,0,0);
    Super.InitFor(Other);
	for ( i=0; i<4; i++ )
		Multiskins[i] = Other.MultiSkins[i];
}

static simulated function bool AllowChunk(int N, name A)
{
   if (A == 'DEAD4' && N==2)
     return false;
   if (A == 'Dead7a')
   {
     if ( N==3 )
     return false;
     if ( N==4 )
     return false;
   }
   if (A == 'Dead7b')
   {
     if ( N==0 )
     return false;
     if (  N==1 )
     return false;
     if ( N==2 )
     return false;
     if ( N==5 )
     return false;
   }
   if (A == 'Dead8a' && N==1)
     return false;
   if (A == 'Dead8b' && N==4)
     return false;
   if (A == 'Dead8c' && N==4)
     return false;
   if (A == 'Dead8d' && N==1)
     return false;
   if (A == 'Dead10a' && N==3)
      return false;
   if (A == 'Dead10b' && N==3)
      return false;
   if (A == 'Dead10c' && N==4)
      return false;
   if (A == 'Dead10d' && N==4)
      return false;
   return true;
}

simulated function Landed(vector HitNormal)
{
	local rotator finalRot;
	local BloodSpurt b;

	if ( (Velocity.Z < -1000) && !bPermanent && !bHidden && !bDeleteme)
	{
		ChunkUp(200);
		return;
	}

	finalRot = Rotation;
	finalRot.Roll = 0;
	finalRot.Pitch = 0;
	setRotation(finalRot);
	SetPhysics(PHYS_None);
	SetCollision(bCollideActors, false, false);
	if ( HitNormal.Z < 0.99 )
		ReducedHeightFactor = 0.1;
	if ( HitNormal.Z < 0.93 )
		ReducedHeightFactor = 0.0;
	if ( !IsAnimating() )
		LieStill();

	if ( Level.NetMode == NM_DedicatedServer )
		return;

    b = Spawn(class'BloodSpurt',,,,rot(0,0,0));
    if (b!=none )
    {
     if(bGreenBlood)
       b.GreenBlood();
      b.RemoteRole = ROLE_None;
	}
}

function ChunkUp(int Damage)
{
    if(bDeleteMe)
        return;
	if ( bPermanent )
		return;
	if ( Region.Zone.bPainZone && (Region.Zone.DamagePerSec > 0) )
		{
			if ( Bugs != None )
				Bugs.Destroy();
		}
	else
		CreateReplacement();
	SetPhysics(PHYS_None);
	bHidden = true;
	SetCollision(false,false,false);
	bProjTarget = false;
	GotoState('Gibbing');
}

singular event BaseChange()
{
  local float decorMass, decorMass2;

  decormass= FMax(1, Mass);
  bBobbing = false;

  if( Velocity.Z < -500 && (Role == Role_Authority) )
     TakeDamage( (1-Velocity.Z/30),Instigator,Location,vect(0,0,0) , 'crushed');

  if( (base == None)  && (Physics == PHYS_None) )
     SetPhysics(PHYS_Falling);

  else if( (Pawn(base) != None) && (Pawn(Base).CarriedDecoration != self) )
  {   // enable later if adding base and bump damage note health check
     //  if(!Pawn(Base).bDeleteme && (Pawn(Base).health>0))
	 //   Base.TakeDamage( (1-Velocity.Z/400)* decormass/Base.Mass,Instigator,Location,0.5 * Velocity , 'crushed');
    Velocity.Z = 200;
    if (FRand() < 0.5)
      Velocity.X += 70;
    else
      Velocity.Y += 70;
      SetPhysics(PHYS_Falling);
  }
  else if( Decoration(Base)!=None && Velocity.Z<-500 )
  {
    decorMass2 = FMax(Decoration(Base).Mass, 1);
    if(!Base.bDeleteme)
      Base.TakeDamage((1 - decorMass/decorMass2 * Velocity.Z/30), Instigator, Location, 0.2 * Velocity, 'stomped');
    Velocity.Z = 100;
    if (FRand() < 0.5)
      Velocity.X += 70;
    else
      Velocity.Y += 70;
      SetPhysics(PHYS_Falling);
  }
  else
     instigator = None;
}

function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation,
			Vector Momentum, name DamageType)
{
     if ( bDeleteMe)
       return;
     else
       Super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
}

state Dead
{
	singular event BaseChange()
	{
		if ( (Mover(Base) != None) && (ExistTime == 0) )
		{
			ExistTime = FClamp(30.0 - 2 * DeathZone.NumCarcasses, 5, 12);
			SetTimer(3.0, true);
		}
        // cant call super
		//Super.BaseChange();
	}
}

defaultproperties
{
	BodyParts(0)=LodMesh'UMSMarinesII.UMSSMGib1R'
	BodyParts(1)=LodMesh'UMSMarinesII.UMSSMGib1'
	BodyParts(2)=LodMesh'UMSMarinesII.UMSSMGib2'
	BodyParts(3)=LodMesh'UMSMarinesII.UMSSMGib3'
	BodyParts(4)=LodMesh'UMSMarinesII.UMSSMGib3R'
	BodyParts(5)=LodMesh'UMSMarinesII.UMSSMGib4'
	BodyParts(6)=LodMesh'UnrealShare.LiverM'
	BodyParts(7)=LodMesh'UnrealShare.stomachM'
	flies=0
	Mesh=LodMesh'UMSMarinesII.UMSMarine'
	AnimSequence="Dead2"
}
