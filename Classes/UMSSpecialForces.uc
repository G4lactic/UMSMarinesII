//=============================================================================
// UMSSpecialForces - GFour
//=============================================================================
class UMSSpecialForces extends UMSSpaceMarine abstract;

var() bool bDoSpecial; // Do you want this marine to use their special ability? (Default is: True)
var() bool bAutoDoSpecial; // Do you want this marine to start with their special ability enabled? (Default is: False)

defaultproperties
{
    bDoSpecial=True;
    bAutoDoSpecial=False;
}