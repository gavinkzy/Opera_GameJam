if (instance_exists(UFO_Body))
{
	x = UFO_Body.x;
	y = UFO_Body.y;
}

if (GameManager.currentState == GameState.gameStarted)
{
	
	beginSpawn = true;
	//Pattern Manager
	if (enablePatternChange)
	{
		enablePatternChange = false;
		alarm[1] = patternChangeInterval;
		currentPattern = irandom_range(0,2);
		spawnDelay = max(25, spawnDelay - 1); 
	}
}

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
				alarm[0] = min(spawnDelay, spawnDelay + 1 - 1 * GameManager.game_speed);
				var xPos = x-8;
				var yPos = y+8;
				if (noOfSpawns > 0)
				{
					image_index = 0;
					image_speed = 1;
					instance_create_layer(xPos, yPos, "Instances", obstacles[irandom_range(0,2)])
					audio_sound_gain(audio_play_sound(sndPop,1,false), 0.5, 1);
				}
				enableSpawn = false;
			}
			break;
			
		case Pattern.pattern_2:
			if (enableSpawn)
			{
				alarm[0] = min(spawnDelay, spawnDelay + 1 - 1 * GameManager.game_speed);
				var xPos = x-8;
				var yPos = y+8;
				if (noOfSpawns > 0)
				{

					with (instance_create_layer(xPos, yPos, "Instances", obstacles[irandom_range(0,2)]))
					{
						image_index = 0;
						image_speed = 1;
						hsp = -2;
						vsp = -3;
						audio_sound_gain(audio_play_sound(sndPop,1,false), 0.5, 1);
					}
				}
				enableSpawn = false;
			}
			break;
			
			case Pattern.pattern_3:
				if (enableSpawn)
				{
					alarm[0] = min(spawnDelay, spawnDelay + 1 - 1 * GameManager.game_speed);
					var xPos = x-8;
					var yPos = y+8;
					if (noOfSpawns > 0)
					{
						with (instance_create_layer(xPos, yPos, "Instances", obstacles[irandom_range(0,2)]))
						{
							image_index = 0;
							image_speed = 1;
							hsp = -2;
							vsp = -6;
							audio_sound_gain(audio_play_sound(sndPop,1,false), 0.5, 1);
						}
					}
					enableSpawn = false;
				}
			break;
	}
}