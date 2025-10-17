//=============================================================================
// UMSSpaceCadet(--WIP--)  -- GFour
// Re-adding this back anew to allow for weaker marines to be used. these guys flee alot so i only reccomend them for early game.
// NOTICE!!! Cadets currently dont look different from normal marines im still working on a way to make them stand out.
//=============================================================================
class UMSSpaceCadet extends UMSSpaceMarine;

var bool bWimp;

Function FireWeapon()
{
    if(!bWimp && Health < 0.65 * Default.Health)
    WimpOut();
    else if (bWimp && Frand() < 0.35)
    GotoState('Retreating');
    else
    super.FireWeapon();
}

Function WimpOut()
{
bIsWuss=True;
bWimp=True;
if(!bIsFemale)
PlaySound(Sound'UMSMarinesII.Marine.Backupm', SLOT_Interact);
else
PlaySound(Sound'UMSMarinesII.Marine.Backupf', SLOT_Interact);
CombatStyle=-0.4;
//GotoState('Retreating');
}

defaultproperties
{
    CombatStyle=0.65
    bWimp=False
    WeaponType=class'DispersionPistol'
    //DrawScale=0.925
	//CollisionRadius=19.5
	//CollisionHeight=38.0
}