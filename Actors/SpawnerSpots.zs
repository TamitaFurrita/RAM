class ZombieSpot : SpecialSpot
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

class ImpSpot : SpecialSpot
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

class PinkySpot : SpecialSpot
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

class ShellSpot : SpecialSpot
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

class AmmoSpot : SpecialSpot
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