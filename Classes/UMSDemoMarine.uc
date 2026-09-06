//=============================================================================
// UMSDemoMarine
//=============================================================================
class UMSDemoMarine extends UMSSpecialForces;

#exec texture IMPORT NAME=JProxSkin FILE=Textures\Skins\Jdetn1.PCX GROUP=Skins LODSET=2
#exec MESH MODELIMPORT STATICMESH MODELFILE="Models/Other/ProxMine.obj" NAME=ProxMine
#exec STATICMESH TRANSFORM NAME=ProxMine ORIGIN=(0.0,0.0,0.0) SIZE=(1.05,1.05,1.05) YAW=0 PITCH=0 ROLL=0
#exec MESHMAP SETTEXTURE MESHMAP=ProxMine NUM=0 TEXTURE=JProxSkin

var(UMSDemolitionsMarine) bool bTurret,bCastMines;
var(UMSDemolitionsMarine) int MaxMines,MaxActiveMines;
var(UMSDemolitionsMarine) float MineCastCooldown;