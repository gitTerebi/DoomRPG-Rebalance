#include "Defs.h"

#include "Utils.h"
#include "RPG.h"

NamedScript void DropTombStones()
{
    Delay(35 * 4);

    // Spawn Tombstone
    for (int i = 0; i < MAX_PLAYERS; i++)
    {
        if (PlayerInGame(i))
        {
            if (Players(i).CreditPenalty == 0 && Players(i).XPPenalty == 0 && Players(i).RankPenalty == 0)
            {
                Log("\CdRESPAWN: \C-Found \CaTombstone \C-worth \Ca%ld XP", Players(i).XPPenalty);
                break;
            }

            SpawnForced("DRPGTombstone", Players(i).TombStoneX, Players(i).TombStoneY, Players(i).TombStoneZ, 0, 0);
            Log("\CdRESPAWN: \C-Spawned a \CaTombstone worth %ld XP", Players(i).XPPenalty);
            break;
        }
    }
}

NamedScript DECORATE void PickUpTombstone()
{
    Log("\Cd  ===== Your tombstone DATA =====");
    Log("Got tombstone worth %ld XP %ld RANK %ld CREDITS", Player.XPPenalty, Player.RankPenalty, Player.CreditPenalty);

    ActivatorSound("health/resurrect", 127);
    Player.XP += Player.XPPenalty;
    Player.Rank += Player.RankPenalty;
    GiveInventory("DRPGCredits", Player.CreditPenalty);

    SetHudSize(640, 480, false);
    SetFont("BIGFONT");
    HudMessage("\CdTombstone retrieved\C- \Ca%ld XP \Cb%ld RANK \Ce%ld CREDITS", Player.XPPenalty, Player.RankPenalty, Player.CreditPenalty);
    EndHudMessage(HUDMSG_FADEOUT, 0, "Orange", 320.0, 120.0, 0.5, 6.0);

    // Player.XPPenalty = 0;
    // Player.RankPenalty = 0;
    // Player.CreditPenalty = 0;
}