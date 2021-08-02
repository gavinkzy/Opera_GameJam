vsp = vsp + grv;

var isStuckInGround = CheckForVertTileCollision(id, tilemap);
y = y + vsp;
if (!isStuckInGround)
{
	CheckForHoriTileCollision(id, tilemap);	
}
x = x + hsp;