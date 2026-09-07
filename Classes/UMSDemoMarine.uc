//=============================================================================
// UMSDemoMarine
//=============================================================================
class UMSDemoMarine extends UMSSpecialForces;

#exec texture IMPORT NAME=JProxSkin FILE=Textures\Skins\Jdetn1.PCX GROUP=Skins LODSET=2

var(UMSDemolitionsMarine) bool bTurret,bCastMines;
var(UMSDemolitionsMarine) int MaxMines,MaxActiveMines;
var(UMSDemolitionsMarine) float MineCastCooldown;