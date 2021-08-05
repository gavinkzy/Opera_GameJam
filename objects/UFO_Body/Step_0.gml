if (GameManager.currentState == GameState.gameStarted)
{
	if instance_exists(oPlayer) && instance_exists(oPlayer_Two)
	{
		//Check who is the furthest on the right
		if (oPlayer.x > oPlayer_Two.x)
		{
			furthestPlayer = oPlayer;	
		}
		else if (oPlayer.x < oPlayer_Two.x)
		{
			furthestPlayer = oPlayer_Two;	
		}
	}
	else if instance_exists(oPlayer)
	{
		furthestPlayer = oPlayer;
	}
	else if instance_exists(oPlayer_Two)
	{
		furthestPlayer = oPlayer_Two;	
	}
	
	if (y > 110)
	{
		y = 110;	
	}
	
	if (x < 50)
	{
		x = 50;	
	}
	
	if (x > 325)
	{
		x = 325;
	}
	switch (currentState)
	{
		default:
			break;
		case AIStates.lull:
			//Check if player on the right of screen
			if (furthestPlayer.x > 285) && (furthestPlayer.x < 400)
			{
				currentState = AIStates.kiting;
			}
			else
			{
				if (!reachedXDestination)
				{
					if (x < xTo)
					{
						x = x + 1;	
					}
					if (x > xTo)
					{
						x = x - 1;
					}	
				}
				if (!reachedYDestination)
				{
					if (y > yTo)
					{
						y = y - 1;	
					}
					if (y < yTo)
					{
						y = y + 1;	
					}	
				}
				if (reachedXDestination) && (reachedYDestination)
				{
					currentState = AIStates.kiting;	
				}
			}
			break;
		case AIStates.kiting:
			if (currentNoMovementTimer >= noMovementTimer)
			{
				xTo = irandom_range(190,320);
				yTo = irandom_range(15,100);
				currentState = AIStates.lull;
			}
			//Check if player on the right of screen
			if (furthestPlayer.x > 285) && (furthestPlayer.x < 400)
			{
				UFO_Cannon.currentPattern = Pattern.pattern_1;
				y = y + 1;
				x = x + 1;
				show_debug_message("Player in zone");
			}
			else
			{
				//Furthest player too close
				if (x - furthestPlayer.x < 60)
				{
					UFO_Cannon.currentPattern = Pattern.pattern_1;
					x = x + 1;
					//Move UFO down to ground
					y = y + 1;
				}
				//Furthest player too far
				else if (x - furthestPlayer.x > 100)
				{
					UFO_Cannon.currentPattern = Pattern.pattern_2;
					x = x - 1;
				}
				else
				{
					currentNoMovementTimer += 1;
				}
			}
			break;
		}
}