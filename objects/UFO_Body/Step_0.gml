if (GameManager.currentState == GameState.gameStarted)
{
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
			if (point_distance(x, y, xTo, yTo) > 5)
			{
				move_towards_point(xTo, yTo, 1);
			}
			else
			{
				currentState = AIStates.kiting;
			}
			
			break;
		case AIStates.kiting:
			if (currentNoMovementTimer >= noMovementTimer)
			{
				xTo = irandom_range(190,350);
				yTo = irandom_range(15,100);
				currentState = AIStates.lull;
			}
			UFO_Cannon.currentPattern = Pattern.pattern_1;
			// Target Player 1 if Player 1 exists only.
			if instance_exists(oPlayer) && !instance_exists(oPlayer_Two)
			{
				//Player 1 too close
				if (x - oPlayer.x < 60)
				{
					x = x + 1;
					//Move UFO down to ground
					y = y + 1;
				}
				//Player 1 too far
				else if (x - oPlayer.x > 100)
				{
					x = x - 1;
				}
				else
				{
					currentNoMovementTimer += 1;
				}
			}
			else if instance_exists(oPlayer_Two) && (!instance_exists(oPlayer))
			{
				//Player 2 too close
				if (x - oPlayer_Two.x < 60)
				{
					x = x + 1;
					//Move UFO down to ground
					y = y + 1;
				}
				//Player 2 too far
				else if (x - oPlayer_Two.x > 100)
				{
					x = x - 1;
				}
				else
				{
					currentNoMovementTimer += 1;
				}
			}
			else if instance_exists(oPlayer) && instance_exists(oPlayer_Two)
			{
				var furthestPlayer = oPlayer;
				//Check who is the furthest on the right
				if (oPlayer.x > oPlayer_Two.x)
				{
					furthestPlayer = oPlayer;	
				}
				else if (oPlayer.x < oPlayer_Two.x)
				{
					furthestPlayer = oPlayer_Two;	
				}
				//Furthest player too close
				if (x - furthestPlayer.x < 60)
				{
					x = x + 1;
					//Move UFO down to ground
					y = y + 1;
				}
				//Furthest player too far
				else if (x - furthestPlayer.x > 100)
				{
					x = x - 1;
				}
				else
				{
					currentNoMovementTimer += 1;
				}
			}
			else
			{
				show_debug_message("Both players do not exist");	
			}
			break;
	}
}