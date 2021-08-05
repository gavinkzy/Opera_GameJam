with (other)
{
	if (!isDead) && (!godMode)
	{
		isDead = true;	
		vsp = -5;
		hsp = -5;
		instance_destroy(other);
	}
}
