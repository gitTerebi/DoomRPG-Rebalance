class DRPGZShieldDamageHandler : Inventory
{
    override void AbsorbDamage(int damage, Name damageType, out int newdamage)
    {
        if (damageType == "Slime")
            owner.ACS_ScriptCall("SetDamageType", DT_TOXIC);
        else if (damageType == "Radiation")
            owner.ACS_ScriptCall("SetDamageType", DT_RADIATION);
        else if (damageType == "Melee")
            owner.ACS_ScriptCall("SetDamageType", DT_MELEE);
        else if (damageType == "Fire")
            owner.ACS_ScriptCall("SetDamageType", DT_FIRE);
        else if (damageType == "Plasma")
            owner.ACS_ScriptCall("SetDamageType", DT_PLASMA);
        else if (damageType == "Electric")
            owner.ACS_ScriptCall("SetDamageType", DT_LIGHTNING);
        else
            owner.ACS_ScriptCall("SetDamageType", DT_NORMAL);

        newdamage = owner.ACS_ScriptCall("PlayerDamage", 0, damage, true);
    }
}
