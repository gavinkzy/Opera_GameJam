enum GameState
{
	preGame,
	gameStarting,
	gameStarted,
	postGame
}

currentState = GameState.preGame;

increasedSpeed = true;
speedIncrementInterval = 20 * room_speed;
game_speed = 1;

currentScore = 0;

playerOneActive = false;
playerTwoActive = false;