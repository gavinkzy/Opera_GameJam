tilemap = layer_tilemap_get_id(layer_get_id("Tilemap"));
isPressingRightKey = false;
isPressingLeftKey = false;
hasPressedJumpKey = false;
isHoldingJumpKey = false;
isTouchingGround = false;

hsp = 0;
vsp = 0;
grv = 0.5;
moveSpd = 1;
jumpSpd = 6;
jumpKeyStroke = 0;
isJumping = false;
dashDownActivated = false;
jumpBufferTime = 0.2 * room_speed;
jumpBufferEnabled = false;

currentState = GameState.preGame;

isDead = false;

godMode = false;