class B33Handler : EventHandler
{
	int RandomMemberOfArray (int ArraySize)
	{
		int Luaification = ArraySize - 1;
		return clamp(round(frandom(0,Luaification) * (0.5 + dynDiff)), 0, Luaification);
	}
	
	override void WorldTick()
	{
		string zombies[3] = {
			"ZombieMan", "ShotgunGuy", "ChaingunGuy"
		};
			
		string imps[4] = {
			"DoomImp", "DoomBrute", "HellKnight", "BaronOfHell"
		};
		
		string pinkies[2] = {
			"Demon", "Spectre"
		};
		
		string shells[2] = {
			"ShellBox", "Shell"
		};
		
		string ammoes[2] = {
			"ClipBox", "Clip"
		};
		
		let pmo = players[consoleplayer].mo;
		
		int bulletCount = pmo.CountInv("Clip");
		int shellCount  = pmo.CountInv("Shell");
		int rocketCount = pmo.CountInv("RocketAmmo");
		int cellCount   = pmo.CountInv("Cell");
		
		let armorCount = pmo.FindInventory("BasicArmor");
		int armorPoints = armorCount ? armorCount.Amount : 0;
		
		bool hasShotgun = pmo.FindInventory("Shotgun") != null;
		bool hasChaingun = pmo.FindInventory("Chaingun") != null;
		bool hasSSG = pmo.FindInventory("SuperShotgun") != null;
		bool hasRocketLauncher = pmo.FindInventory("RocketLauncher") != null;
		bool hasPlasmaRifle = pmo.FindInventory("PlasmaRifle") != null;
		bool hasBFG = pmo.FindInventory("BFG9000") != null;
		
		Cvar.FindCVar("dynDiff").SetFloat(
			(
				min(armorPoints / 200.0, 1.0) * 0.15 +
				min(bulletCount / 200.0, 1.0) * 0.10 +
				min(shellCount / 50.0, 1.0) * 0.20 +
				min(rocketCount / 50.0, 1.0) * 0.25 +
				min(cellCount / 300.0, 1.0) * 0.30 +
				hasShotgun * 0.20 +
				hasChaingun * 0.20 +
				hasSSG * 0.40 +
				hasRocketLauncher * 0.50 +
				hasPlasmaRifle * 0.60 +
				hasBFG * 1.0
				) / 2.0
			);
		
		if(Bunny_Debug) console.Printf(""..dynDiff);
		
		ThinkerIterator SpotPoker = ThinkerIterator.Create("SpecialSpot");
		Actor mo;
		
		while (mo = SpecialSpot(SpotPoker.Next()))
		{
			if(mo.target && mo.target.Player && !(mo.CheckIfInTargetLOS() && mo.CheckIfTargetInLOS()))
			{
				if(mo.GetClass() == "ZombieSpot" && random(0, 7000) == 1) {
					mo.A_SpawnItemEx(zombies[RandomMemberOfArray(3)], flags:SXF_ISMASTER);
					if(mo.target && mo.Distance3D(mo.target) < 256) mo.A_SpawnItemEx("TeleportFog");
					}
				
				if(mo.GetClass() == "ImpSpot" && random(0, 7000) == 1) {
					mo.A_SpawnItemEx(imps[RandomMemberOfArray(4)], flags:SXF_ISMASTER);
					if(mo.target && mo.Distance3D(mo.target) < 256) mo.A_SpawnItemEx("TeleportFog");
					}
				
				if(mo.GetClass() == "PinkySpot" && random(0, 7000) == 1) {
					mo.A_SpawnItemEx(pinkies[RandomMemberOfArray(2)], flags:SXF_ISMASTER);
					if(mo.target && mo.Distance3D(mo.target) < 256) mo.A_SpawnItemEx("TeleportFog");
					}
				
				if(mo.GetClass() == "ShellSpot" && random(0, 7000) == 1) {
					mo.A_SpawnItemEx(shells[RandomMemberOfArray(2)], flags:SXF_ISMASTER);
					if(mo.target && mo.Distance3D(mo.target) < 256) mo.A_SpawnItemEx("TeleportFog");
					}
				
				if(mo.GetClass() == "AmmoSpot" && random(0, 7000) == 1) {
					mo.A_SpawnItemEx(ammoes[RandomMemberOfArray(2)], flags:SXF_ISMASTER);
					if(mo.target && mo.Distance3D(mo.target) < 256) mo.A_SpawnItemEx("TeleportFog");
					}
			}
		}
	}
}