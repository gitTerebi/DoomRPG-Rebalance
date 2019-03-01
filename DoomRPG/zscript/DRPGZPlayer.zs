class DRPGZPlayer : DoomPlayer
{
    bool RevivePending;
    property RevivePending: RevivePending;
    
	override void DeathThink ()
	{
		let player = self.player;
		int dir;
		double delta;

		player.Uncrouch();
		TickPSprites();

		player.onground = (pos.Z <= floorz);
		if (self is "PlayerChunk")
		{ // Flying bloody skull or flying ice chunk
			player.viewheight = 6;
			player.deltaviewheight = 0;
			if (player.onground)
			{
				if (Pitch > -19.)
				{
					double lookDelta = (-19. - Pitch) / 8;
					Pitch += lookDelta;
				}
			}
		}
		else if (!bIceCorpse)
		{ // Fall to ground (if not frozen)
			player.deltaviewheight = 0;
			if (player.viewheight > 6)
			{
				player.viewheight -= 1;
			}
			if (player.viewheight < 6)
			{
				player.viewheight = 6;
			}
			if (Pitch < 0)
			{
				Pitch += 3;
			}
			else if (Pitch > 0)
			{
				Pitch -= 3;
			}
			if (abs(Pitch) < 3)
			{
				Pitch = 0.;
			}
		}
		player.mo.CalcHeight();

        if (player.damagecount)
        {
            player.damagecount--;
        }
        if (player.poisoncount)
        {
            player.poisoncount--;
        }

		if ((CVar.GetCVar("drpg_revives", players[0]).GetInt() != 1) && ((player.cmd.buttons & BT_USE || ((multiplayer || alwaysapplydmflags) && sv_forcerespawn)) && !sv_norespawn))
		{
			if (Level.maptime >= player.respawn_time || ((player.cmd.buttons & BT_USE) && player.Bot == NULL))
			{
				player.cls = NULL;		// Force a new class if the player is using a random class
				player.playerstate = (multiplayer || level.AllowRespawn || sv_singleplayerrespawn || G_SkillPropertyInt(SKILLP_PlayerRespawn)) ? PST_REBORN : PST_ENTER;
				if (special1 > 2)
				{
					special1 = 0;
				}
			}
		}
        
        if (RevivePending)
        {
            RevivePending = false;
            player.playerstate = PST_LIVE;
        }
	}
    
    static void PrepareForRevive(int PlayerNum)
    {
        DRPGZPlayer(Players[PlayerNum].mo).RevivePending = true;
    }
}
