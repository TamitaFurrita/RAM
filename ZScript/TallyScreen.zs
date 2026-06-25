class BunnyStatusScreen : DoomStatusScreen
{
	int Bunny;
	
	override void initStats()
	{
		Super.initStats();
		Bunny = random(0,2);
	}
	
		override void updateStats ()
	{
		if (acceleratestage && sp_state != 10)
		{
			acceleratestage = 0;
			sp_state = 10;
			PlaySound("intermission/nextstage");

			cnt_kills[0] = Plrs[me].skills;
			cnt_items[0] = Plrs[me].sitems;
			cnt_secret[0] = Plrs[me].ssecret;
			cnt_time = Thinker.Tics2Seconds(Plrs[me].stime);
			cnt_par = wbs.partime / GameTicRate;
			cnt_total_time = Thinker.Tics2Seconds(wbs.totaltime);
		}

		if (sp_state == 2)
		{
			if (intermissioncounter)
			{
				cnt_kills[0] += 2;

				if (!(bcnt&3))
					PlaySound("intermission/tick");
			}
			if (!intermissioncounter || cnt_kills[0] >= Plrs[me].skills)
			{
				cnt_kills[0] = Plrs[me].skills;
				PlaySound("intermission/nextstage");
				sp_state++;
			}
		}
		else if (sp_state == 4)
		{
			if (intermissioncounter)
			{
				cnt_items[0] += 2;

				if (!(bcnt&3))
					PlaySound("intermission/tick");
			}
			if (!intermissioncounter || cnt_items[0] >= Plrs[me].sitems)
			{
				cnt_items[0] = Plrs[me].sitems;
				PlaySound("intermission/nextstage");
				sp_state++;
			}
		}
		else if (sp_state == 6)
		{
			if (intermissioncounter)
			{
				cnt_secret[0] += 2;

				if (!(bcnt&3))
					PlaySound("intermission/tick");
			}
			if (!intermissioncounter || cnt_secret[0] >= Plrs[me].ssecret)
			{
				cnt_secret[0] = Plrs[me].ssecret;
				PlaySound("intermission/nextstage");
				sp_state++;
			}
		}
		else if (sp_state == 8)
		{
			if (intermissioncounter)
			{
				if (!(bcnt&3))
					PlaySound("intermission/tick");

				cnt_time += 3;
				cnt_par += 3;
				cnt_total_time += 3;
			}

			int sec = Thinker.Tics2Seconds(Plrs[me].stime);
			if (!intermissioncounter || cnt_time >= sec)
				cnt_time = sec;

			int tsec = Thinker.Tics2Seconds(wbs.totaltime);
			if (!intermissioncounter || cnt_total_time >= tsec)
			{
				cnt_total_time = tsec;
				PlaySound("intermission/nextstage");
				sp_state++;
			}
		}
		else if (sp_state == 10)
		{
			if (acceleratestage)
			{
				PlaySound("intermission/paststats");
				initShowNextLoc();
			}
		}
		else if (sp_state & 1)
		{
			if (!--cnt_pause)
			{
				sp_state++;
				cnt_pause = GameTicRate;
			}
		}
	}
	
	override void drawStats (void)
	{
		// line height
		int lh = IntermissionFont.GetHeight() * 3 / 2;
		
		string CoolStrings[3] = { 
		"You are DOOM!", 
		"Rip and tear!", 
		"They're done!" };
		
		drawLF();

		Font textFont = "BigUpper";
		int tcolor = Font.CR_RED;

		Screen.DrawText (textFont, tcolor, 8, 65, "Kills", DTA_320x200, 1);
		Screen.DrawText (textFont, tcolor, 8, 115, "Secrets", DTA_320x200, 1);

		if (sp_state >= 2)
		{
			Screen.DrawText (textFont, tcolor, 300, 65, ""..max(0, cnt_kills[0]), DTA_320x200, 1, DTA_ScaleX, 1.2);
		}
		if (sp_state >= 4)
		{
			Screen.DrawText (textFont, tcolor, 8, 90, CoolStrings[Bunny], DTA_320x200, 1);
		}
		if (sp_state >= 6)
		{
			Screen.DrawText (textFont, tcolor, 300, 115, ""..max(0, cnt_secret[0]), DTA_320x200, 1, DTA_ScaleX, 1.2);
		}
		if (sp_state >= 8)
		{
		Screen.DrawText (textFont, tcolor, 8, 160, "Time", DTA_320x200, 1);
		Screen.DrawText (textFont, tcolor, 300, 160, ""..cnt_time, DTA_320x200, 1, DTA_ScaleX, 1.2);
		}
	}
}