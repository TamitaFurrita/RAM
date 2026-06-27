class UXMX : Actor
{
	Default
	{
		Health 400;
		PainChance 50;
		Speed 25;
		Radius 16;
		Height 64;
		MissileChanceMult 0.125;
		Monster;
		RenderStyle "Stencil";
		StencilColor "000000";
		+FLOORCLIP
		+TELESTOMP
		+DONTMORPH
		DeathSound "player/male/death1";
		PainSound "player/male/pain100_1";
		Obituary "The illusion of choice caught you.";
		Tag "UXMX";
		DropItem "Shotgun", 255;
		DropItem "SuperShotgun", 255;
	}

	States
	{
	Spawn:
		PLAY A 1 A_Look;
		Loop;
	See:
		PLAY ABCD 4 {
		A_Chase(null, null, CHF_FASTCHASE);
		}
	SeeLoop:
		PLAY ABCD 4 {
		A_Chase("Melee", "Missile", CHF_FASTCHASE);
		}
		Loop;
	Pain:
		PLAY G 4;
		PLAY G 4 A_Pain;
		Goto See;
	Melee:
		PLAY FFFF 4 {
		A_FaceTarget();
		A_M_Saw();
		A_Recoil(-1);
		}
		PLAY F 0 A_JumpIfCloser(40, "Melee");
		Goto See;
	Missile:
		PLAY F 8 A_FaceTarget;
		PLAY E 8 {
			if(self.Health < 200) return ResolveState("SSG");
			else {
				A_CustomBulletAttack(22.5, 0, 7, random[SPosAttack](1,5)*3, "BulletPuff");
				A_StartSound("weapons/shotgf", CHAN_WEAPON);
				return ResolveState(null);
			}
		}
		Goto See;
	SSG:
		PLAY E 0 A_FaceTarget();
		PLAY E 10 A_StartSound("weapons/sshoto");
		PLAY E 13 A_StartSound ("weapons/sshotl");
		PLAY E 0 A_StartSound ("weapons/sshotc");
		PLAY E 7 A_FaceTarget;
		PLAY F 8 {
			A_CustomBulletAttack(20, 14, 10, random(5, 10) * 2, "BulletPuff");
			A_StartSound ("weapons/sshotf");
			}
		PLAY E 8;
		Goto See;
	Death:
		PLAY H 10;
		PLAY I 10 A_PlayerScream;
		PLAY J 10 A_NoBlocking;
		PLAY KLM 10;
		PLAY N -1;
		Stop;
	XDeath:
		PLAY O 5;
		PLAY P 5 A_XScream;
		PLAY Q 5 A_NoBlocking;
		PLAY RSTUV 5;
		PLAY W -1;
		Stop;
	}
}
