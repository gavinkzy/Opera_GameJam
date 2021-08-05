image_speed = 0;

obstacles[0] = Obstacle_Blue;
obstacles[1] = Obstacle_Orange;
obstacles[2] = Obstacle_Yellow;
enableSpawn = true;
noOfSpawns = 1;
spawnDelay = 0.5 * room_speed;

enum Pattern
{
	pattern_1,
	pattern_2,
	pattern_3,
}

currentPattern = Pattern.pattern_1;

beginSpawn = false;
spawnInterval = 1 * room_speed;

enablePatternChange = true;
patternChangeInterval = 5 * room_speed;