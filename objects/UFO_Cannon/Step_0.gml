if (instance_exists(UFO_Body))
{
	x = UFO_Body.x;
	y = UFO_Body.y;
}

if (GameManager.currentState == GameState.gameStarted)
{
	beginSpawn = true;
	show_debug_message(spawnDelay);
	if (GameManager.currentScore < 10) 
	{
		spawnDelay = 0.7 * room_speed;
	}
	if GameManager.currentScore > 10 && GameManager.currentScore < 50
	{
		spawnDelay = 0.6 * room_speed;
	}
	if GameManager.currentScore > 50
	{
		spawnDelay = 0.5 * room_speed;
	}
	show_debug_message(spawnDelay);
}

if (beginSpawn)
{
	if (enableSpawn)
	{
		alarm[0] = spawnDelay;
		var xPos = x-8;
		var yPos = y+8;
		if (noOfSpawns > 0) || (unlimitedSpawn)
		{
			image_index = 0;
			image_speed = 1;
			instance_create_layer(xPos, yPos, "Instances", obstacles[irandom_range(0,2)])
			audio_sound_gain(audio_play_sound(sndPop,1,false), 0.5, 1);
			if (noOfSpawns > 0)
			{
				noOfSpawns -= 1;
			}
		}
		enableSpawn = false;
	}
}

switch (currentPattern)
{
	default:
		currentPattern = Pattern.unlimited;
		break;
	case Pattern.unlimited:
		unlimitedSpawn = true;
		break;
	case Pattern.pattern_1:
		unlimitedSpawn = false;
		if (noOfSpawns <= 0)
		{
			noOfSpawns = 2;	
		}
		break;
}