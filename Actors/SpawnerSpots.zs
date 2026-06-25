class ZombieSpot : MapSpot
{
	Default
	{
	+INVISIBLE 
	//$Category "Monsters/Spawners"
	//$Sprite "POSSA1"
	//$Color 14
	}
	States
	{
	Spawn:
		TNT1 A 1 A_Look();
		Loop;
	See:
		TNT1 A 1 A_AlertMonsters(16);
		Loop;
	}
}

class ImpSpot : MapSpot
{
	Default
	{
	+INVISIBLE 
	//$Category "Monsters/Spawners"
	//$Sprite "TROOA1"
	//$Color 14
	}
	States
	{
	Spawn:
		TNT1 A 1 A_Look();
		Loop;
	See:
		TNT1 A 1 A_AlertMonsters(16);
		Loop;
	}
}

class PinkySpot : MapSpot
{
	Default
	{
	+INVISIBLE 
	//$Category "Monsters/Spawners"
	//$Sprite "SARGA1"
	//$Color 14
	}
	States
	{
	Spawn:
		TNT1 A 1 A_Look();
		Loop;
	See:
		TNT1 A 1 A_AlertMonsters(16);
		Loop;
	}
}

class ShellSpot : MapSpot
{
	Default
	{
	+INVISIBLE 
	//$Category "Ammunition/Spawners"
	//$Sprite "SBOXA0"
	//$Color 14
	}
	States
	{
	Spawn:
		TNT1 A 1 A_Look();
		Loop;
	}
}

class AmmoSpot : MapSpot
{
	Default
	{
	+INVISIBLE 
	//$Category "Ammunition/Spawners"
	//$Sprite "AMMOA0"
	//$Color 14
	}
	States
	{
	Spawn:
		TNT1 A 1 A_Look();
		Loop;
	}
}

class CellSpot : MapSpot
{
	Default
	{
	+INVISIBLE 
	//$Category "Ammunition/Spawners"
	//$Sprite "CELPA0"
	//$Color 14
	}
	States
	{
	Spawn:
		TNT1 A 1 A_Look();
		Loop;
	}
}

class HealthSpot : MapSpot
{
	Default
	{
	+INVISIBLE 
	//$Category "Health and Armor/Spawners"
	//$Sprite "MEDIA0"
	//$Color 14
	}
	States
	{
	Spawn:
		TNT1 A 1 A_Look();
		Loop;
	}
}