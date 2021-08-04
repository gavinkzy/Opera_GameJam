if (x < 35)
{
	instance_destroy(self);	
}

vsp = vsp + grv;
CheckForVertTileCollision(id, tilemap);
y = y + vsp;

if (vsp == 0) 
{ 
	//fixed hsp, simulated
	hsp = max(maxGroundedHsp, groundedHsp - 1 * GameManager.game_speed);
	if (!hitGround)
	{
		shaking = true;
		alarm[0] = shakeDuration;
	}
	hitGround = true;
}

if (hitGround) && (shaking)
{
	//shake screen
	//camera_set_view_pos(view_camera[0], irandom_range(49,51), 0)
}

x = x + hsp;

if (instance_exists(oPlayer))
{
	 if (x < oPlayer.x) && (!hasAccountedForScore)
	 {
		GameManager.currentScore += 1;
		hasAccountedForScore = true;
	 }
}

if (instance_exists(oPlayer_Two))
{
	if (x < oPlayer_Two.x) && (!hasAccountedForScore)
	{
		GameManager.currentScore += 1;
		hasAccountedForScore = true;
	}
}