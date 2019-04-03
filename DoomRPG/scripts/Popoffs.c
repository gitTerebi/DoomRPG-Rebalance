#include "RPG.h"

#include "Monsters.h"
#include "Popoffs.h"
#include "Shield.h"
#include "Utils.h"

// Handles Damage Numbers
NamedScript DECORATE void DamageNumbers(int Damage, int Health)
{
    int Color;

    if (!GetCVar("drpg_damagenumbers"))
        return;

    if (Damage >= Health) // Critical
        Color = DNUM_CRITICAL;
    else // Normal
        Color = DNUM_NORMAL;

    // Damage Popoff
    Popoff(0, Damage, Color, "DRPGDigit", true);
}

// Handles informational popoffs
NamedScript void InfoPopoffs()
{
    int BeforeCredits;
    int AfterCredits;
    int BeforeEP;
    int AfterEP;
    int SpawnHealth = GetActorProperty(0, APROP_SpawnHealth);
    int Health;
    int Shield;
    int Color;

Start:

    while (GetCVar("drpg_popoffs"))
    {
        // Before Checks
        BeforeCredits = CheckInventory("DRPGCredits");
        BeforeEP = Player.EP;

        // Health 'n Shield
        Health = GetActorProperty(0, APROP_Health);
        Shield = Player.Shield.Charge;

        Delay(1);

        // After Checks
        AfterCredits = CheckInventory("DRPGCredits");
        AfterEP = Player.EP;

        // Health 'n Shield
        Health = Health - GetActorProperty(0, APROP_Health);
        Shield = Shield - Player.Shield.Charge;

        // Credits Popoffs
        if (AfterCredits > BeforeCredits)
            Popoff(Player.TID, AfterCredits - BeforeCredits, DNUM_CREDGAIN, "DRPGDigit", true);
        if (AfterCredits < BeforeCredits)
            Popoff(Player.TID, AfterCredits - BeforeCredits, DNUM_CREDLOSS, "DRPGDigit", true);

        // EP Popoffs
        if (AfterEP > BeforeEP)
            Popoff(Player.TID, AfterEP - BeforeEP, DNUM_EPGAIN, "DRPGDigit", true);
        if (AfterEP < BeforeEP)
            Popoff(Player.TID, AfterEP - BeforeEP, DNUM_EPLOSS, "DRPGDigit", true);

        // Damage Popoff
        if (Health != 0 || Shield != 0)
        {
            if (Health >= SpawnHealth) // Critical
                Color = DNUM_CRITICAL;
            else if (Health < 0 && !Player.Shield.Active) // Healed
                Color = DNUM_HEAL;
            else if (Health == 1) // Scratch
                Color = DNUM_SCRATCH;
            else if (Player.Shield.Active && Shield > 0) // Shield Loss
                Color = DNUM_SHIELDLOSS;
            else if (Player.Shield.Active && Shield < 0) // Shield Gain
                Color = DNUM_SHIELDGAIN;
            else // Normal
                Color = DNUM_NORMAL;

            if (Player.Shield.Active && Shield > 0)
                Popoff(0, Shield, Color, "DRPGDigit", true);
            else
                Popoff(0, Health, Color, "DRPGDigit", true);
        }

        // Terminate if the Player is dead
        if (GetActorProperty(0, APROP_Health) <= 0) return;
    }

    Delay(1);
    goto Start;
}

// Spawns digits for Module pickups
NamedScript DECORATE void ModulePopoffs()
{
    int DrawDist = GetCVar("drpg_popoffs_drawdistance");
    bool CloseToPlayers;

    while (!(ClassifyActor(0) == ACTOR_WORLD))
    {
        // Standby loop.
        while (!GetCVar("drpg_modulenumbers")) Delay(35);

        // Distance 'n sight checks
        for (int i = 0; i < MAX_PLAYERS; i++)
        {
            if (!PlayerInGame(i))
                continue;

            if (Distance(Players(i).TID, 0) < DrawDist)
                CloseToPlayers = true;
            else
            {
                CloseToPlayers = false;
                break;
            }

            if (CheckSight(Players(i).TID, 0, CSF_NOBLOCKALL))
                break;
        }

        if (!CloseToPlayers)
        {
            Delay(35);
            continue;
        }

        Popoff(0, GetUserVariable(0, "user_amount"), 0, "DRPGDigitalDigit", false);
        Delay(1);
    }
}

// Spawn a popoff number
void Popoff(int TID, int Value, int Color, str DigitType, bool FloatAway)
{
    int DigitTID = UniqueTID();
    int DigitPos = 1;
    fixed X = GetActorX(TID);
    fixed Y = GetActorY(TID);
    fixed Z = GetActorZ(TID);

    // Handling for height
    if (ClassifyActor(TID) & ACTOR_MONSTER)
        Z += Monsters[GetMonsterID(TID)].Height;
    else
        Z += GetActorPropertyFixed(TID, APROP_Height);

    // Ceiling monsters need special Z calculations
    if (CheckFlag(TID, "CEILINGHUGGER"))
        Z = GetActorZ(TID) - Monsters[GetMonsterID(TID)].Height;

    if (Value < 0)
        Value *= -1;

    // Prevent digit overflow
    if (Value > 9999999)
        Value = 9999999;

    while (Value > 0)
    {
        Spawn(StrParam("%S%dNum%d", DigitType, DigitPos, Value % 10), X, Y, Z, DigitTID, 0);
        Value /= 10;
        DigitPos++;
    }

    // Color
    if (Color > 0)
        Thing_SetTranslation(DigitTID, Color);

    // Set Fade Speed
    SetUserVariable(DigitTID, "user_fade", GetCVar("drpg_damagenumbers_fade"));

    // Float away
    if (FloatAway)
    {
        if (CheckFlag(TID, "CEILINGHUGGER"))
            SetActorVelocity(DigitTID, RandomFixed(-1.0, 1.0), RandomFixed(-1.0, 1.0), -0.5, 0, 0);
        else
            SetActorVelocity(DigitTID, RandomFixed(-1.0, 1.0), RandomFixed(-1.0, 1.0), 0.5, 0, 0);
    }
}
