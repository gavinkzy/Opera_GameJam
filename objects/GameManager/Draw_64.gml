if (currentState = GameState.preGame)
{
	DrawSetText(c_white, defaultFont, fa_center, fa_middle);
	
	if instance_exists(oPlayer) || instance_exists(oPlayer_Two)
	{
		if (!initiatedDotAlarm)
		{
			alarm[4] = 30;
			initiatedDotAlarm = true;
		}
		if (currentDot == 0)
		{
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2-60,"Press enter to start");	
		}
		if (currentDot == 1)
		{
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2-60,"Press enter to start.");
		}
		if (currentDot == 2)
		{
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2-60,"Press enter to start..");
		}
		if (currentDot == 3)
		{
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2-60,"Press enter to start...");
		}
	}
	DrawSetText(c_grey, defaultFont, fa_left, fa_middle);
	draw_text(display_get_gui_width()/2-20, display_get_gui_height()/2,"Controls: \nPlayer 1 - Arrow keys \nPlayer 2 - WASD")	
}	

if (currentState = GameState.gameStarting) || (currentState = GameState.gameStarted)
{
	DrawSetText(c_white, defaultFont, fa_center, fa_middle);
	draw_text(display_get_gui_width()/2, 40, round(currentScore));
}

if (currentState = GameState.postGame)
{
	DrawSetText(c_white, defaultFont, fa_center, fa_middle);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2-30, "Your score: "+ string(round(currentScore)));
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+10, "Press enter to play again!");
}