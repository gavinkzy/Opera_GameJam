isPressingRightKey = keyboard_check(vk_right);
isPressingLeftKey = keyboard_check(vk_left);
hasPressedJumpKey = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up);
isHoldingJumpKey = keyboard_check(vk_space) || keyboard_check(vk_up);
//Running
var horizontalDirection = isPressingRightKey - isPressingLeftKey;
if (isPressingLeftKey || isPressingRightKey)
{
	hsp = moveSpd * horizontalDirection;
	if (!isJumping) { sprite_index = Running; }
	if (isPressingLeftKey)
	{
		image_xscale = -1;	
	}
	if (isPressingRightKey)
	{
		image_xscale = 1;	
	}
}
else
{
	//Apply friction if grounded
	if (isTouchingGround)
	{
		if (hsp > 0)
		{
			hsp = max(0, hsp - 0.2);	
		}
		if (hsp < 0)
		{
			hsp = min(0, hsp + 0.2);	
		}
	}
	else // air resistance
	{
		if (hsp > 0)
		{
			hsp = max(0, hsp - 0.05);
		}
		if (hsp < 0)
		{
			hsp = min(0, hsp + 0.05);	
		}
	}
}

//Jumping
if (isTouchingGround)
{
	if (hasPressedJumpKey)
	{
		jumpKeyStroke += 1;
		vsp = -jumpSpd;
		isJumping = true;
		sprite_index = Jump;
	}
	
	if (vsp == 0)
	{
		jumpKeyStroke = 0;
	}
}
else
{
	grv = 0.1;
	if (vsp > 0) 
	{ 
		isJumping = false;
		sprite_index = Landing; 
	}
}

if (!isJumping) && !(isPressingLeftKey || isPressingRightKey)
{
	sprite_index = Idle;	
}

vsp = vsp + grv;

var isStuckInGround = CheckForVertTileCollision(id, tilemap);
y = y + vsp;
if (!isStuckInGround)
{
	CheckForHoriTileCollision(id, tilemap);	
}
x = x + hsp;