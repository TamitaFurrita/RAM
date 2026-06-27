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
	
	override void drawEL ()
	{
		Font textFont = "BigUpper";
		int tcolor = Font.CR_RED;
		String LevelName = lnametexts[1];
		
		Screen.DrawTexture(TexMan.CheckForTexture("INTERPIC"), false, 0, 0, DTA_Fullscreen, true, DTA_FullScreenScale, FSMode_ScaleToScreen);
		Screen.DrawText(textFont, Font.CR_RED, 160 - ((textFont.StringWidth("Entering") / 2) * 1.2), 80, "Entering", DTA_320x200, 1, DTA_ScaleX, 1.2);
		Screen.DrawText(textFont, Font.CR_GREY, 160 - ((textFont.StringWidth(LevelName) / 2) * 1.2), 100, LevelName, DTA_320x200, 1, DTA_ScaleX, 1.2);
	}
	
	override void drawStats (void)
	{
		Screen.DrawTexture(TexMan.CheckForTexture("INTERPIC"), false, 0, 0, DTA_Fullscreen, true, DTA_FullScreenScale, FSMode_ScaleToScreen);
		
		string CoolStrings[3] = { 
		"You are DOOM!", 
		"Rip and tear!", 
		"They're done!" };
		
		String LevelName = lnametexts[0];
		Font textFont = "BigUpper";
		int tcolor = Font.CR_RED;

		Screen.DrawText(textFont, Font.CR_RED, 160 - ((textFont.StringWidth("Exiting") / 2) * 1.2), 4, "Exiting", DTA_320x200, 1, DTA_ScaleX, 1.2);
		Screen.DrawText(textFont, Font.CR_GREY, 160 - ((textFont.StringWidth(LevelName) / 2) * 1.2), 20, LevelName, DTA_320x200, 1, DTA_ScaleX, 1.2);
		
		Screen.DrawText (textFont, tcolor, 8, 65, "Kills", DTA_320x200, 1);
		Screen.DrawText (textFont, tcolor, 8, 115, "Secrets", DTA_320x200, 1);

		if (sp_state >= 2)
		{
			Screen.DrawText (textFont, tcolor, 315 - (textFont.StringWidth(String.Format("%d", cnt_kills[0])) * 1.2), 65, ""..max(0, cnt_kills[0]), DTA_320x200, 1, DTA_ScaleX, 1.2);
		}
		if (sp_state >= 4)
		{
			Screen.DrawText (textFont, tcolor, 8, 90, CoolStrings[Bunny], DTA_320x200, 1);
		}
		if (sp_state >= 6)
		{
			Screen.DrawText (textFont, tcolor, 315 - (textFont.StringWidth(String.Format("%d", cnt_secret[0])) * 1.2), 115, ""..max(0, cnt_secret[0]), DTA_320x200, 1, DTA_ScaleX, 1.2);
		}
		if (sp_state >= 8)
		{
		Screen.DrawText (textFont, tcolor, 8, 160, "Time", DTA_320x200, 1);
		
		int t = cnt_time;
		int hours = t / 3600;
		t = t % 3600;
		int minutes = t / 60;
		int seconds = t % 60;
		
		String timeStr;
		timeStr = String.Format("%02d:%02d:%02d", hours, minutes, seconds);

		Screen.DrawText (textFont, tcolor, 315 - (textFont.StringWidth(timeStr) * 1.2), 160, timeStr, DTA_320x200, 1, DTA_ScaleX, 1.2);
		}
	}
}