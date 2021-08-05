image_speed = 0;

obstacles[0] = Obstacle_Blue;
obstacles[1] = Obstacle_Orange;
obstacles[2] = Obstacle_Yellow;
enableSpawn = true;

noOfSpawns = 0;
unlimitedSpawn = true;
spawnDelay = 0.6 * room_speed;

enum Pattern
{
	unlimited,
	pattern_1,
	pattern_2,
	pattern_3,
}


beginSpawn = false;

currentPattern = Pattern.unlimited;