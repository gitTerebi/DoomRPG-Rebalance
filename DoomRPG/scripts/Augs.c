#include "RPG.h"

#include "Arena.h"
#include "Augs.h"
#include "Outpost.h"
#include "Map.h"
#include "Shield.h"
#include "Stats.h"
#include "Skills.h"
#include "Utils.h"

AugInfo RPGMap AugData[AUG_MAX] =
{
    // Name, Max Level, Description...

    // Augs
    {
        .Name = "Muscle Replacer",
        .MaxLevel = 6,
        .Description =
        {
            "+10% Damage",
            "+15% Damage",
            "+20% Damage",
            "+30% Damage",
            "+40% Damage",
            "+50% Damage"
        },
        .TokenActor = "DRPGAugTokenStrength"
    },
    {
        .Name = "Dermal Armor",
        .MaxLevel = 5,
        .Description =
        {
            "5% Damage Reduction",
            "10% Damage Reduction",
            "15% Damage Reduction",
            "20% Damage Reduction",
            "25% Damage Reduction"
        },
        .TokenActor = "DRPGAugTokenDefense"
    },
    {
        .Name = "Pain Inhibitor",
        .MaxLevel = 6,
        .Description =
        {
            "+50% HP Regen Amounts",
            "+25% Max HP Amounts",
            "+50% Max HP Amounts",
            "+15% Status Effect Resist",
            "+20% Status Effect Resist",
            "+25% Status Effect Resist"
        },
        .TokenActor = "DRPGAugTokenVitality"
    },
    {
        .Name = "Psi Projector",
        .MaxLevel = 8,
        .Description =
        {
            "+50% EP Regen Amounts",
            "+25% Max EP Amounts",
            "+50% Max EP Amounts",
            "+50% Aura Timer",
            "+10% Skill Cost Refund",
            "+15% Skill Cost Refund",
            "+20% Skill Cost Refund",
            "+25% Skill Cost Refund"
        },
        .TokenActor = "DRPGAugTokenEnergy"
    },
    {
        .Name = "Adrenaline Booster",
        .MaxLevel = 8,
        .Description =
        {
            "+25% HP Regen Speed",
            "+25% EP Regen Speed",
            "+50% HP Regen Amounts",
            "+50% EP Regen Amounts",
            "-5 Seconds Toxicity Timer",
            "-10 Seconds Toxicity Timer",
            "-15 Seconds Toxicity Timer",
            "-20 Seconds Toxicity Timer"
        },
        .TokenActor = "DRPGAugTokenRegen"
    },
    {
        .Name = "Wired Reflexes",
        .MaxLevel = 5,
        .Description =
        {
            "+5% Weapon Speed and +2% Survival Chance",
            "+10% Weapon Speed and +4% Survival Chance",
            "+15% Weapon Speed and +6% Survival Chance",
            "+20% Weapon Speed and +8% Survival Chance",
            "+25% Weapon Speed and +10% Survival Chance"
        },
        .TokenActor = "DRPGAugTokenAgility"
    },
    {
        .Name = "Weight Distributor",
        .MaxLevel = 3,
        .Description =
        {
            "+25% Ammo Limits",
            "+50% Ammo Limits",
            "+100% Ammo Limits"
        },
        .TokenActor = "DRPGAugTokenCapacity"
    },
    {
        .Name = "Precognition Unit",
        .MaxLevel = 4,
        .Description =
        {
            "+50% Luck Drop Chances",
            "+100% Luck Drop Chances",
            "+200% Luck Drop Chances",
            "+300% Luck Drop Chances"
        },
        .TokenActor = "DRPGAugTokenLuck"
    },
    {
        .Name = "AUG Battery",
        .MaxLevel = 8,
        .Description =
        {
            "Capacity +25%  and Recharge Rate +5%",
            "Capacity +50%  and Recharge Rate +10%",
            "Capacity +75%  and Recharge Rate +20%",
            "Capacity +100% and Recharge Rate +30%",
            "Capacity +125% and Recharge Rate +40%",
            "Capacity +150% and Recharge Rate +50%",
            "Capacity +175% and Recharge Rate +75%",
            "Capacity +200% and Recharge Rate +100%"
        },
        .TokenActor = "DRPGAugTokenBattery"
    },
    {
        .Name = "Commanding abilities",
        .MaxLevel = 8,
        .Description =
        {
            "Increase Vitality of Summoned (depending on your Energy)",
            "Increase Defense of Summoned (depending on your Energy)",
            "Increase Strenght of Summoned (depending on your Energy)",
            "Increase Life Regeneration of Summoned",
            "+10% Extra Power of Summoned and +10% Reduces Cost for Summoning",
            "+15% Extra Power of Summoned and +15% Reduces Cost for Summoning",
            "+20% Extra Power of Summoned and +20% Reduces Cost for Summoning",
            "+25% Extra Power of Summoned and +25% Reduces Cost for Summoning"
        },
        .TokenActor = "DRPGAugTokenSummoner"
    }
};

NamedScript DECORATE OptionalArgs(1) void DisableAugs(bool NoDrain)
{
    // Disable Augs and give tokens designating which Augs were disabled
    for (int i = 0; i < AUG_MAX; i++)
    {
        if (Player.Augs.Active[i])
        {
            // Disable Aug
            Player.Augs.Active[i] = false;
            SetInventory(AugData[i].TokenActor, Player.Augs.Level[i]);

            // Screen fuckery
            SetHudSize(640, 480, false);
            SetFont("AugDView");
            HudMessage("A");
            EndHudMessage(HUDMSG_FADEOUT | HUDMSG_ADDBLEND, 0, "Untranslated", 320.0, 240.0, 3.0, 0.5);
        }
    }

    // Reset Aug slots
    Player.Augs.SlotsUsed = 0;

    // Halve your current battery amount
    if (!NoDrain)
        Player.Augs.Battery /= 2;

    // Disabled sound
    ActivatorSound("aug/disable", 127);
}

NamedScript KeyBind void ReactivateDisabledAugs()
{
    // Check that we *can* activate augs.
    if (Player.StatusType[SE_EMP] || Player.Augs.Battery <= 0)
        return;

    for (int i = 0; i < AUG_MAX; i++)
    {
        // If there aren't enough slots left to equip any more augs, then don't try to activate any more.
        if (Player.Augs.SlotsUsed >= Player.Augs.Slots)
            break;

        if (CheckInventory(AugData[i].TokenActor) && !Player.Augs.Active[i] && Player.Augs.Level[i] > 0)
            EquipAug(i);
    }

    ClearDisabledAugs();
}

void ClearDisabledAugs()
{
    for (int i = 0; i < AUG_MAX; i++)
        TakeInventory(AugData[i].TokenActor, AugData[i].MaxLevel);
}

NamedScript DECORATE void AddBattery(int Amount)
{
    int PrevBattery = Player.Augs.Battery;

    Player.Augs.Battery += Amount;

    if (Player.Augs.Battery > Player.Augs.BatteryMax)
        Player.Augs.Battery = Player.Augs.BatteryMax;

    if (PrevBattery != Player.Augs.Battery)
        DrawBattery();
}

void CheckAugSlots()
{
    Player.Augs.Slots = Player.Augs.BaseSlots + CheckInventory("DRPGAugSlotUpgrade");

    // AW-G01 Accessory handling
    if (Player.Shield.Accessory && Player.Shield.Accessory->PassiveEffect == SHIELD_PASS_AUGSLOT && Player.Shield.Active)
        Player.Augs.Slots++;

    // Cap max Aug slots at the max amount of available Augs
    if (Player.Augs.Slots > AUG_MAX) Player.Augs.Slots = AUG_MAX;

    // Unequip Augs if you pass the limit (sell a slot upgrade, change difficulty, etc)
    if (Player.Augs.SlotsUsed > Player.Augs.Slots)
        for (int i = AUG_MAX - 1; i >= 0 && Player.Augs.SlotsUsed > Player.Augs.Slots; i--)
            if (Player.Augs.Active[i])
            {
                Player.Augs.Active[i] = false;
                Player.Augs.SlotsUsed--;
                break;
            }
}

void CheckAugs()
{
    // Sanity check to prevent negative slots used
    if (Player.Augs.SlotsUsed < 0)
        Player.Augs.SlotsUsed = 0;

    // Determine max Battery
    Player.Augs.BatteryMax = 100;

    // Battery Aug
    if (Player.Augs.Active[AUG_BATTERY])
    {
        if (Player.Augs.Level[AUG_BATTERY] == 1)
            Player.Augs.BatteryMax += 25;
        if (Player.Augs.Level[AUG_BATTERY] == 2)
            Player.Augs.BatteryMax += 50;
        if (Player.Augs.Level[AUG_BATTERY] == 3)
            Player.Augs.BatteryMax += 75;
        if (Player.Augs.Level[AUG_BATTERY] == 4)
            Player.Augs.BatteryMax += 100;
        if (Player.Augs.Level[AUG_BATTERY] == 5)
            Player.Augs.BatteryMax += 125;
        if (Player.Augs.Level[AUG_BATTERY] == 6)
            Player.Augs.BatteryMax += 150;
        if (Player.Augs.Level[AUG_BATTERY] == 7)
            Player.Augs.BatteryMax += 175;
        if (Player.Augs.Level[AUG_BATTERY] >= 8)
            Player.Augs.BatteryMax += 200;
    }

    // Play energy drained sound
    if (Player.Augs.Battery <= 0 && Player.Augs.SlotsUsed > 0)
        ActivatorSound("aug/dead", 127);

    // Disable Augs if your battery is dead
    if (Player.Augs.Battery <= 0)
    {
        for (int i = 0; i < AUG_MAX; i++)
            if (Player.Augs.Active[i])
                Player.Augs.Active[i] = false;

        // Reset the amount of slots used
        Player.Augs.SlotsUsed = 0;
    }

    // Battery Handling
    if ((!CurrentLevel->UACBase || ArenaActive || MarinesHostile) && !CheckInventory("PowerTimeFreezer"))
    {
        // Reset drain
        Player.Augs.BatteryDrain = 0;

        // Calculate Battery Drain
        for (int i = 0; i < AUG_MAX; i++)
            if (Player.Augs.Active[i] && i != AUG_BATTERY)
                Player.Augs.BatteryDrain += Player.Augs.Level[i];

        // Decrease Battery
        if (Player.Augs.SlotsUsed > 0 && (Timer() % 35) == 0)
        {
            Player.Augs.Battery -= (Player.Augs.BatteryDrain * 0.055);
            DrawBattery();
        }

        // Permanently Display battery amount on the HUD if CVAR is set
        if ((Player.Augs.SlotsUsed > 0 && GetActivatorCVar("drpg_aug_alwaysshow")) || GetActivatorCVar("drpg_hud_preview"))
            DrawBattery();
    }

    // Sanity check to prevent battery from going negative
    if (Player.Augs.Battery < 0)
        Player.Augs.Battery = 0;

    // Sanity check to prevent Battery from exceeding max amount
    if (Player.Augs.Battery > Player.Augs.BatteryMax)
        Player.Augs.Battery = Player.Augs.BatteryMax;

    // Battery Recharging
    if ((!CurrentLevel->UACBase || ArenaActive || MarinesHostile) && Player.Augs.Active[AUG_BATTERY] && Player.Augs.Battery > 0 && Player.Augs.Battery < Player.Augs.BatteryMax)
        if ((Timer() % 35) == 0)
        {
            fixed Charge;
            if (Player.Augs.Level[AUG_BATTERY] == 1)
                Charge = 0.05;
            else if (Player.Augs.Level[AUG_BATTERY] == 2)
                Charge = 0.10;
            else if (Player.Augs.Level[AUG_BATTERY] == 3)
                Charge = 0.20;
            else if (Player.Augs.Level[AUG_BATTERY] == 4)
                Charge = 0.30;
            else if (Player.Augs.Level[AUG_BATTERY] == 5)
                Charge = 0.40;
            else if (Player.Augs.Level[AUG_BATTERY] == 6)
                Charge = 0.50;
            else if (Player.Augs.Level[AUG_BATTERY] == 7)
                Charge = 0.75;
            else if (Player.Augs.Level[AUG_BATTERY] >= 8)
                Charge = 1.00;

            if (GetCVar("drpg_regen_movement") && IsPlayerMoving())
                Charge += GetCVar("drpg_move_aug_battery_regen") / 100.0;

            Player.Augs.Battery += Charge;
            DrawBattery();
        }

    // Strength Aug
    if (Player.Augs.Active[AUG_STRENGTH])
    {
        if (Player.Augs.Level[AUG_STRENGTH] == 1)
            Player.DamageMult += 0.101;
        if (Player.Augs.Level[AUG_STRENGTH] == 2)
            Player.DamageMult += 0.151;
        if (Player.Augs.Level[AUG_STRENGTH] == 3)
            Player.DamageMult += 0.201;
        if (Player.Augs.Level[AUG_STRENGTH] == 4)
            Player.DamageMult += 0.301;
        if (Player.Augs.Level[AUG_STRENGTH] == 5)
            Player.DamageMult += 0.401;
        if (Player.Augs.Level[AUG_STRENGTH] >= 6)
            Player.DamageMult += 0.501;
    }

    // Defense Aug
    if (Player.Augs.Active[AUG_DEFENSE])
        Player.DamageFactor -= (fixed)Player.Augs.Level[AUG_DEFENSE] / 20.0;
    //Player.DamageFactor *= (1.0 - (fixed)Player.Augs.Level[AUG_DEFENSE] * 0.05);

    // Vitality Aug
    if (Player.Augs.Active[AUG_VITALITY])
    {
        if (Player.Augs.Level[AUG_VITALITY] >= 1)
            Player.HPAmount *= 1.5;
        if (Player.Augs.Level[AUG_VITALITY] == 2)
            Player.HealthMax *= 1.25;
        if (Player.Augs.Level[AUG_VITALITY] >= 3)
            Player.HealthMax *= 1.5;
        if (Player.Augs.Level[AUG_VITALITY] == 4)
            Player.StatusEffectResist += 15;
        if (Player.Augs.Level[AUG_VITALITY] == 5)
            Player.StatusEffectResist += 20;
        if (Player.Augs.Level[AUG_VITALITY] >= 6)
            Player.StatusEffectResist += 25;
    }

    // Energy Aug
    if (Player.Augs.Active[AUG_ENERGY])
    {
        if (Player.Augs.Level[AUG_ENERGY] >= 1)
            Player.EPAmount *= 1.5;
        if (Player.Augs.Level[AUG_ENERGY] == 2)
            Player.EPMax *= 1.25;
        if (Player.Augs.Level[AUG_ENERGY] >= 3)
            Player.EPMax *= 1.5;
    }
    if (Player.Augs.Active[AUG_ENERGY] && Player.Augs.Level[AUG_ENERGY] >= 4)
        Player.AuraBonus = true;
    else
        Player.AuraBonus = false;

    // Regeneration Aug
    if (Player.Augs.Active[AUG_REGENERATION])
    {
        if (Player.Augs.Level[AUG_REGENERATION] >= 1)
        {
            Player.HPTime *= 0.75;
        }
        if (Player.Augs.Level[AUG_REGENERATION] >= 2)
        {
            Player.EPTime *= 0.75;
        }
        if (Player.Augs.Level[AUG_REGENERATION] >= 3)
        {
            Player.HPAmount *= 1.5;
        }
        if (Player.Augs.Level[AUG_REGENERATION] >= 4)
        {
            Player.EPAmount *= 1.5;
        }
        if (Player.Augs.Level[AUG_REGENERATION] == 5)
            Player.ToxicityRegenBonus += 5;
        if (Player.Augs.Level[AUG_REGENERATION] == 6)
            Player.ToxicityRegenBonus += 10;
        if (Player.Augs.Level[AUG_REGENERATION] == 7)
            Player.ToxicityRegenBonus += 15;
        if (Player.Augs.Level[AUG_REGENERATION] >= 8)
            Player.ToxicityRegenBonus += 20;
    }

    // Agility Aug
    if (Player.Augs.Active[AUG_AGILITY])
    {
        if (Player.Augs.Level[AUG_AGILITY] == 1)
        {
            Player.WeaponSpeed += 5;
            Player.SurvivalBonus += 2.0;
        }
        if (Player.Augs.Level[AUG_AGILITY] == 2)
        {
            Player.WeaponSpeed += 10;
            Player.SurvivalBonus += 4.0;
        }
        if (Player.Augs.Level[AUG_AGILITY] == 3)
        {
            Player.WeaponSpeed += 15;
            Player.SurvivalBonus += 6.0;
        }
        if (Player.Augs.Level[AUG_AGILITY] == 4)
        {
            Player.WeaponSpeed += 20;
            Player.SurvivalBonus += 8.0;
        }
        if (Player.Augs.Level[AUG_AGILITY] >= 5)
        {
            Player.WeaponSpeed += 25;
            Player.SurvivalBonus += 10.0;
        }
    }

    // Capacity Aug
    if (Player.Augs.Active[AUG_CAPACITY])
    {
        fixed AmmoMult;

        if (Player.Augs.Level[AUG_CAPACITY] == 1)
            AmmoMult = 1.25;
        if (Player.Augs.Level[AUG_CAPACITY] == 2)
            AmmoMult = 1.5;
        if (Player.Augs.Level[AUG_CAPACITY] >= 3)
            AmmoMult = 2;

        SetAmmoCapacity("Clip", (60 + Player.CapacityTotal * 10) * AmmoMult);
        SetAmmoCapacity("Shell", (20 + Player.CapacityTotal * 2) * AmmoMult);
        SetAmmoCapacity("RocketAmmo", (2 + Player.CapacityTotal * 0.6) * AmmoMult);
        SetAmmoCapacity("Cell", (Player.CapacityTotal * 10) * AmmoMult);
    }

    // Luck Aug
    if (Player.Augs.Active[AUG_LUCK])
    {
        fixed LuckMult;

        if (Player.Augs.Level[AUG_LUCK] == 1)
            LuckMult = 1.5;
        if (Player.Augs.Level[AUG_LUCK] == 2)
            LuckMult = 2;
        if (Player.Augs.Level[AUG_LUCK] == 3)
            LuckMult = 3;
        if (Player.Augs.Level[AUG_LUCK] >= 4)
            LuckMult = 4;

        Player.HealthChance *= LuckMult;
        Player.EPChance *= LuckMult;
        Player.ArmorChance *= LuckMult;
        Player.WeaponChance *= LuckMult;
        Player.PowerupChance *= LuckMult;
        Player.ModuleChance *= LuckMult;
        Player.AugChance *= LuckMult;
        Player.ShieldChance *= LuckMult;
        Player.StimChance *= LuckMult;
    }
}

void AugDamage(int Amount)
{
    // Lightning damage type increases your Battery
    if (Player.DamageType == DT_LIGHTNING && Amount / 50 > 0)
        AddBattery(Amount / 50);
}

void EquipAug(int Aug)
{
    // If you don't have this aug yet, return
    if (Player.Augs.Level[Aug] == 0)
    {
        PrintError("This aug has not been activated yet");
        ActivatorSound("menu/error", 127);
        return;
    }

    // If battery is dead, return
    if (Player.Augs.Battery <= 0)
    {
        PrintError("Your aug battery is depleted");
        ActivatorSound("menu/error", 127);
        return;
    }

    if (Player.Augs.Level[Aug] > 0)
    {
        if (Player.Augs.Active[Aug])
        {
            ActivatorSound("aug/equip", 127);
            Player.Augs.SlotsUsed--;
            Player.Augs.Active[Aug] = false;
        }
        else
        {
            Player.Augs.SlotsUsed++;

            if (Player.Augs.SlotsUsed > Player.Augs.Slots)
            {
                PrintError("You are already using all of your aug slots");
                ActivatorSound("menu/error", 127);
                Player.Augs.SlotsUsed--;
            }
            else
            {
                ActivatorSound("aug/equip", 127);
                Player.Augs.Active[Aug] = true;
            }
        }
    }
}

void LevelUpAug(int AugIndex)
{
    if (Player.Augs.Level[AugIndex] < AugData[AugIndex].MaxLevel)
    {
        bool CanLevel = true;

        if (Player.Augs.Level[AugIndex] == 0)
        {
            if (CheckInventory("DRPGAugCanister"))
            {
                ActivatorSound("aug/levelup", 127);
                TakeInventory("DRPGAugCanister", 1);
            }
            else
                CanLevel = false;
        }
        else
        {
            if (CheckInventory("DRPGAugCanister") && CheckInventory("DRPGAugUpgradeCanister") >= Player.Augs.Level[AugIndex] + 1)
            {
                ActivatorSound("aug/levelup", 127);
                TakeInventory("DRPGAugCanister", 1);
                TakeInventory("DRPGAugUpgradeCanister", Player.Augs.Level[AugIndex] + 1);
            }
            else
                CanLevel = false;
        }

        if (!CanLevel)
        {
            PrintError("You cannot upgrade this aug");
            ActivatorSound("menu/error", 127);
            return;
        }

        Player.Augs.Level[AugIndex]++;
    }
}
