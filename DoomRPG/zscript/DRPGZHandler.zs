class DRPGZEHandler : EventHandler
{
    // Replaces exits with ACS_Execute which calls DRPG's map exit script instead
    override void WorldLoaded(WorldEvent e)
    {
        CallACS("SetDebugMode");

        // Iterate through all lines in the current map to find exits to replace
        for (int i = 0; i < level.Lines.Size(); i++)
        {
            Line l = level.Lines[i];
            int s = l.special;
            // Exit_Normal
            switch (s)
            {
            case 243:
            {
                // 80 = ACS_Execute
                l.special = 80;
                l.args[0] = 30000;
                l.args[1] = 0;
                l.args[2] = 0;
                l.args[3] = 0;
                l.args[4] = 0;
                // Must be repeatable for DRPG things
                l.flags |= Line.ML_REPEAT_SPECIAL;
            }
            break;
            // Exit_Secret
            case 244:
            {
                // 80 = ACS_Execute
                l.special = 80;
                l.args[0] = 30000;
                l.args[1] = 0;
                l.args[2] = 1;
                l.args[3] = 0;
                l.args[4] = 0;
                // Must be repeatable for DRPG things
                l.flags |= Line.ML_REPEAT_SPECIAL;
            }
            break;
            // Teleport_NewMap
            case 74:
            {
                // Save args
                int map = l.args[0];
                int pos = l.args[1];
                int face = l.args[2];
                // 80 = ACS_Execute
                l.special = 80;
                l.args[0] = 30001;
                l.args[1] = 0;
                l.args[2] = map;
                l.args[3] = pos;
                l.args[4] = face;
                // Must be repeatable for DRPG things
                l.flags |= Line.ML_REPEAT_SPECIAL;
            }
            break;
            }
        }
    }

    override void WorldThingDamaged(WorldEvent e)
    {
        if (e.Thing.Player)
        {
            int DamageSourceTID = 0;
            if (e.DamageSource)
                DamageSourceTID = e.DamageSource.TID;

            e.Thing.ACS_ScriptCall("PlayerDamage", DamageSourceTID, e.Damage);
        }

        if (e.Thing && e.DamageSource && e.Thing.bIsMonster)
        {
            int Damage = e.Damage;
            if (e.Thing.Health < 0)
            {
                Damage += e.Thing.Health;
            }
            e.Thing.ACS_ScriptCall("DamageNumbers", Damage, e.Thing.Health);
            e.Thing.ACS_ScriptCall("MonsterDamaged", e.DamageSource.TID, Damage);
        }
    }

    override void WorldThingRevived(WorldEvent e)
    {
        if (e.Thing.CheckInventory("DRPGMonsterInit", 1))
        {
            e.Thing.ACS_ScriptCall("MonsterRevive");
        }
    }

    override void WorldThingDied(WorldEvent e)
    {
        if (e.Thing.CheckInventory("DRPGMonsterInit", 1))
        {
            e.Thing.ACS_ScriptCall("MonsterDeathCheck");
        }
    }
}
