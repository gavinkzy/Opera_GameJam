if (GameManager.currentState == GameState.gameStarted)
{
	//Determine the furthest player
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
	else
	{
		furthestPlayer = noone;	
	}
	
	//UFO Boundaries
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
	
	//Check if furthest player still within max distance or in the "danger zone"
	if instance_exists(oPlayer) || instance_exists(oPlayer_Two)
	{
		if ((furthestPlayer.x > 285) && (furthestPlayer.x < 400))
		{
		currentState = AIStates.kiting;
		}
	}
	else
	{
		currentState = AIStates.postGame;	
	}
	
	switch (currentState)
	{
		default:
			break;
		case AIStates.lull:
			show_debug_message("Lull state");
			if (reachedXDestination) && (reachedYDestination)
			{
				UFO_Cannon.currentPattern = Pattern.pattern_1;
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
					else if (x > xTo)
					{
						x = x - 1;
					}
					else
					{
						reachedXDestination = true;
					}
				}
				if (!reachedYDestination)
				{
					if (y > yTo)
					{
						y = y - 1;	
					}
					else if (y < yTo)
					{
						y = y + 1;	
					}	
					else
					{
						reachedYDestination = true;
					}
				}
			}
			break;
		case AIStates.kiting:
			show_debug_message("Kiting state");
			if (currentNoMovementTimer >= noMovementTimer)
			{
				xTo = irandom_range(190,320);
				yTo = irandom_range(15,100);
				currentState = AIStates.lull;
				reachedXDestination = false;
				reachedYDestination = false;
				currentNoMovementTimer = 0;
			}
			//Check if player on the right of screen
			if (furthestPlayer.x > 285) && (furthestPlayer.x < 400)
			{
				y = y + 1;
				x = x + 1;
			}
			else
			{
				//Furthest player too close
				if (x - furthestPlayer.x < 60)
				{
					x = x + 1;
					//Move UFO down to ground
					y = y + 1;
				}
				//Furthest player too far
				else if (x - furthestPlayer.x > 160)
				{
					x = x - 1;
				}
				else
				{
					currentNoMovementTimer += 1;
				}
			}
			break;
		case AIStates.postGame:
				break;
		}
}