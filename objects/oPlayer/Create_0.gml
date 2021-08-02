tilemap = layer_tilemap_get_id(layer_get_id("Tilemap"));
isPressingRightKey = false;
isPressingLeftKey = false;
hasPressedJumpKey = false;
isHoldingJumpKey = false;
isTouchingGround = false;

hsp = 0;
vsp = 0;
grv = 0.1;
moveSpd = 1;
jumpSpd = 2;
jumpKeyStroke = 0;
isJumping = false;

enum GameState
{
	preGame,
	gameStarting,
	gameStarted,
	postGame
}

currentState = GameState.preGame;