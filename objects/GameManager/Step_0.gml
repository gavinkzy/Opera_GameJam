if (beginSpawn)
{
	switch (currentPattern)
	{
		default:
			break;
		case Pattern.pattern_1:
			//Infinite spawning at fixed interval with increasing speed according to game_speed
			if (enableSpawn)
			{
				alarm[0] = min(spawnDelay, spawnDelay + 1 - 1 * game_speed);
				var xPos = x;
				var yPos = 120;
				if (noOfSpawns > 0)
				{
					instance_create_layer(xPos, yPos, "Instances", obstacles[irandom_range(0,2)])
				}
				enableSpawn = false;
			}
			break;
			
		case Pattern.pattern_2:
			if (enableSpawn)
			{
				alarm[0] = min(spawnDelay, spawnDelay + 1 - 1 * game_speed);
				var xPos = x;
				var yPos = 120;
				if (noOfSpawns > 0)
				{
					with (instance_create_layer(xPos, yPos, "Instances", obstacles[irandom_range(0,2)]))
					{
						hsp = -2;
						vsp = -6;
					}
				}
				enableSpawn = false;
			}
			break;
			
			case Pattern.pattern_3:
				if (!enableSpawn)
				{
					alarm[1] = spawnInterval;	
				}
				if (enableSpawn)
				{
					alarm[0] = min(spawnDelay, spawnDelay + 1 - 1 * game_speed);
					var xPos = x;
					var yPos = 120;
					if (noOfSpawns > 0)
					{
						with (instance_create_layer(xPos, yPos, "Instances", obstacles[irandom_range(0,2)]))
						{
							hsp = -2;
							vsp = -6;
						}
					}
					enableSpawn = false;
				}
			break;
	}
}

switch (currentState)
{
	default:
		break;
	case GameState.preGame:
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
		beginSpawn = true;
		if (increasedSpeed)
		{
			increasedSpeed = false;
			alarm[2] = speedIncrementInterval;	
		}
		//Pattern Manager
		if (enablePatternChange)
		{
			enablePatternChange = false;
			alarm[3] = patternChangeInterval;
			currentPattern = irandom_range(0,2);
			spawnDelay = max(25, spawnDelay - 1); 
			show_debug_message(spawnDelay);
		}
		break;
	case GameState.postGame:
		break;
}