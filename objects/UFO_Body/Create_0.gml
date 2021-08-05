reachedYDestination = false;
reachedXDestination = false;
yTo = 95;
xTo = 320;
vertMotionRandTime = 5 * room_speed;
horiMotionRandTime = 5 * room_speed;
playerTooCloseOrFar = false;
distanceFar = 150;
distanceClose = 100;

enum AIStates
{
	lull,
	kiting
}

currentState = AIStates.lull;

noMovementTimer = 5 * room_speed;
currentNoMovementTimer = 0;
furthestPlayer = 0;