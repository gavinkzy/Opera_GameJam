

if (currentState = GameState.preGame)
{
	DrawSetText(c_white, defaultFont, fa_left, fa_middle);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2,"Player 1 - Arrow keys \n Player 2 - WASD")
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
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+10, "Press enter to try again.");
}