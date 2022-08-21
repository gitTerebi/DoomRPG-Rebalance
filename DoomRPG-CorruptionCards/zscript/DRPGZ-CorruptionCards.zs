// DOOMRPG COMPATIBILITY
// --------------------------------------------------

// Calling the ACS MonsterInit script for monsters
class CCards_MonsterInit : EventHandler
{
    override void WorldThingSpawned(WorldEvent e)
    {
        if (e.Thing && e.Thing.bIsMonster)
        {
            static const string CCBosses[] =
            {
                "CCards_Actor_TheAncientOne"
            };

            for (int i = 0; i < CCBosses.size(); i++)
                if (e.Thing.GetClassName() == CCBosses[i])
                    e.Thing.ACS_ScriptCall("MonsterInit", MF_BOSS);
        }
    }
}

