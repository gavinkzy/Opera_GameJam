switch (currentState)
{
	default:
		break;
	case GameState.preGame:
		hasPressedDownKey = keyboard_check(ord("S"));
		isPressingRightKey = keyboard_check(ord("D"));
		isPressingLeftKey = keyboard_check(ord("A"));
		hasPressedJumpKey = keyboard_check_pressed(ord("W"))
		isHoldingJumpKey = keyboard_check(ord("W"))
		//Running
		var horizontalDirection = isPressingRightKey - isPressingLeftKey;
		if (isPressingLeftKey || isPressingRightKey)
		{
			hsp = moveSpd * horizontalDirection;
			if (!isJumping) { sprite_index = Running_2; }
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
			if (vsp == 0)
			{
				jumpKeyStroke = 0;
				grv = 0.5;
				dashDownActivated = false;
			}
			if (hasPressedJumpKey) && (jumpKeyStroke < 1)
			{
				jumpKeyStroke += 1;
				vsp = -jumpSpd;
				isJumping = true;
				sprite_index = Jump_2;
			}
			else if (jumpBufferEnabled) && (jumpKeyStroke < 1)
			{
				jumpKeyStroke += 1;
				vsp = -jumpSpd;
				isJumping = true;
				sprite_index = Jump_2;
				jumpBufferEnabled = false;
			}
		}
		else
		{
			//buffer jump
			if (hasPressedJumpKey)
			{
				//set to true
				jumpBufferEnabled = true;
				alarm[1] = jumpBufferTime;
			}
			if (vsp > 0) 
			{ 
				isJumping = false;
				sprite_index = Landing_2;
			}
		}

		if (!isJumping) && !(isPressingLeftKey || isPressingRightKey)
		{
			sprite_index = Idle_2;	
		}

		vsp = vsp + grv;

		var isStuckInGround = CheckForVertTileCollision(id, tilemap);
		y = y + vsp;
		if (!isStuckInGround)
		{
			CheckForHoriTileCollision(id, tilemap);	
		}
		x = x + hsp;
		if (x<50)
		{
			x = 50;	
		}
		if (x>350)
		{
			GameManager.currentState = GameState.gameStarting;	
		}
		break;
	case GameState.gameStarting:
		sprite_index = Idle_2;
		break;
	case GameState.gameStarted:
		if (!isJumping) { sprite_index = Running_2; }
		hasPressedDownKey = keyboard_check(ord("S"));
		isPressingRightKey = keyboard_check(ord("D"));
		isPressingLeftKey = keyboard_check(ord("A"));
		hasPressedJumpKey = keyboard_check_pressed(ord("W"))
		isHoldingJumpKey = keyboard_check(ord("W"))
		//Running
		var horizontalDirection = isPressingRightKey - isPressingLeftKey;
		if (isPressingLeftKey || isPressingRightKey)
		{
			hsp = moveSpd * horizontalDirection;
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
				image_xscale = 1;
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
			if (vsp == 0)
			{
				jumpKeyStroke = 0;
				grv = 0.5;
				dashDownActivated = false;
			}
			if (hasPressedJumpKey) && (jumpKeyStroke < 1)
			{
				jumpKeyStroke += 1;
				vsp = -jumpSpd;
				isJumping = true;
				sprite_index = Jump_2;
			}
			else if (jumpBufferEnabled) && (jumpKeyStroke < 1)
			{
				jumpKeyStroke += 1;
				vsp = -jumpSpd;
				isJumping = true;
				sprite_index = Jump_2;
				jumpBufferEnabled = false;
			}
		}
		else
		{
			//buffer jump
			if (hasPressedJumpKey)
			{
				//set to true
				jumpBufferEnabled = true;
				alarm[1] = jumpBufferTime;
			}
			//Dash downwards
			if (hasPressedDownKey)
			{
				//dashDownActivated = true;	
			}
			if (dashDownActivated)
			{
				grv = 1;
			}
			else
			{
				grv = 0.5;
			}
			if (vsp > 0) 
			{ 
				isJumping = false;
				sprite_index = Landing_2;
			}
		}

		vsp = vsp + grv;

		var isStuckInGround = CheckForVertTileCollision(id, tilemap);
		y = y + vsp;
		if (!isStuckInGround)
		{
			CheckForHoriTileCollision(id, tilemap);	
		}
		x = x + hsp;
		if (x<50)
		{
			x = 50;	
		}
		if (x>350)
		{
			x = 350;
		}
		break;
}