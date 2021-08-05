if (instance_exists(oPlayer) || instance_exists(oPlayer_Two)) && (GameManager.currentState = GameState.preGame)
{
	GameManager.currentState = GameState.gameStarting;
}

if (GameManager.currentState = GameState.postGame)
{
	if instance_exists(UFO_Cannon)
	{
		instance_destroy(UFO_Cannon)	
	}
	if instance_exists(UFO_Body)
	{
		instance_destroy(UFO_Body);
	}
	if instance_exists(Obstacles)
	{
		instance_destroy(Obstacles)	
	}
	GameManager.currentState = GameState.gameStarting;
	game_speed = 1;
	currentScore = 0;
	audio_stop_all();
}