switch (currentState)
{
	default:
		break;
	case GameState.preGame:
		if (!instance_exists(oPlayer))
		{
			var hasPressedDownKey = keyboard_check_pressed(vk_down);
			var hasPressedRightKey = keyboard_check_pressed(vk_right);
			var hasPressedLeftKey = keyboard_check_pressed(vk_left);
			var hasPressedJumpKey = keyboard_check_pressed(vk_up);
			if (hasPressedDownKey) || (hasPressedRightKey) || (hasPressedLeftKey) || (hasPressedJumpKey)
			{
				instance_create_layer(190,30,"Instances", oPlayer);
				playerOneActive = true;
			}
		}

		if (!instance_exists(oPlayer_Two))
		{
			var hasPressedDownKey = keyboard_check_pressed(ord("S"));
			var hasPressedRightKey = keyboard_check_pressed(ord("D"));
			var hasPressedLeftKey = keyboard_check_pressed(ord("A"));
			var hasPressedJumpKey = keyboard_check_pressed(ord("W"));
			if (hasPressedDownKey) || (hasPressedRightKey) || (hasPressedLeftKey) || (hasPressedJumpKey)
			{
				instance_create_layer(190,30,"Instances", oPlayer_Two);
				playerTwoActive = true;
			}
		}
		break;
	case GameState.gameStarting:
		var readyToStart = false;
		if (instance_exists(oUFO))
		{
			instance_destroy(oUFO);
			readyToStart = false;
		}
		else
		{
			readyToStart = true;	
		}
		if (instance_exists(oPlayer))
		{
			with (oPlayer)
			{
				if (x > 95)
				{
					x = 95;
					readyToStart = false;
				}
				else
				{
					readyToStart = true;
				}	
			}
		}
		if (instance_exists(oPlayer_Two))
		{
			with (oPlayer_Two)
			{
				if (x > 95)
				{
					x = 80;
					readyToStart = false;
				}
				else
				{
					readyToStart = true;
				}
			}
		}
		//Game Restart
		if (playerOneActive) || (playerTwoActive)
		{
			if (playerOneActive) && (!instance_exists(oPlayer))
			{
				instance_create_layer(95,30,"Instances", oPlayer);
			}
			
			if (playerTwoActive) && (!instance_exists(oPlayer_Two))
			{
				instance_create_layer(85,30,"Instances", oPlayer_Two);	
			}
		}
		
		if (!instance_exists(UFO_Body))
		{
			instance_create_layer(255,30, "UFO_Instance", UFO_Body);	
		}
		
		if (!instance_exists(UFO_Cannon))
		{
			instance_create_layer(255,30, "UFO_Instance", UFO_Cannon);
		}
		
		if (readyToStart == true)
		{
			currentState = GameState.gameStarted;
			if (instance_exists(oPlayer))
			{
				with (oPlayer)
				{
					currentState = GameState.gameStarted;	
				}
			}
			if (instance_exists(oPlayer_Two))
			{
				with (oPlayer_Two)
				{
					currentState = GameState.gameStarted;	
				}
			}
		}
		else
		{
			//Move background
			layer_hspeed("Backgrounds_1", -0.2);
			layer_hspeed("Backgrounds_2", -0.25);
			layer_hspeed("Backgrounds_3", -0.7);
		}	
		break;
	case GameState.gameStarted:
		if ((!instance_exists(oPlayer) && !instance_exists(oPlayer_Two)))
		{
			currentState = GameState.postGame;
		}
		if (increasedSpeed)
		{
			increasedSpeed = false;
			alarm[2] = speedIncrementInterval;	
		}
		break;
	case GameState.postGame:
		if (instance_exists(UFO_Cannon))
		{
			with (UFO_Cannon)
			{
				beginSpawn = false;
			}
		}
		if (keyboard_check_pressed(vk_enter))
		{
			currentState = GameState.gameStarting;
			if (instance_exists(Obstacles))
			{
				instance_destroy(Obstacles);	
			}
			if (instance_exists(UFO_Body))
			{
				instance_destroy(UFO_Body);	
			}
			if (instance_exists(UFO_Cannon))
			{
				instance_destroy(UFO_Cannon);	
			}
			currentScore = 0;
			game_speed = 1;
		}
		else if (keyboard_check(mb_any))
		{
			room_restart();	
		}
		break;
}