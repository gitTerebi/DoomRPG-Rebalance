#ifndef DOOMRPG_STRUCTS_H
#define DOOMRPG_STRUCTS_H

AddressSpace extern MapArraySpace       RPGMap;
AddressSpace extern WorldArraySpace     RPGWorld;
AddressSpace extern GlobalArraySpace    RPGGlobal;

// --------------------------------------------------
// Common Structures
//

// Generic

struct DynamicArray_S
{
    str Name;
    int Position;
    int Size;
    int ItemSize;
    void *Data;
};

struct InterpData_S
{
    long Value;
    long OldValue;

    long StartValue;
    long DisplayValue;

    int Timer;
    int TimerMax;
    int TimerMaxCap;
};

struct Position_S
{
    fixed X;
    fixed Y;
    fixed Z;
    fixed Angle;
    fixed Pitch;
};

// Used by DropEntireInventory()
struct DroppedItem_S
{
    str Actor;
    bool NoDrop;
    bool TakeAll;
    int Max;
};

// Augmentations

struct AugInfo_S
{
    str Name;
    int MaxLevel;
    str Description[MAX_AUG_LEVEL];
    str TokenActor;
};

// Charsave

struct CharSaveInfo_S
{
    // Version / Compatibility Flag
    int Version;
    int CompatMode;

    // Level / Rank Level
    int Level;
    int RankLevel;

    // XP / Rank
    int XP;
    int Rank;

    // Stats
    int Stats[STAT_MAX];
    int StatsNat[STAT_MAX];

    // Skills
    int Skills[MAX_CATEGORIES][MAX_SKILLS];

    // Skill Wheel
    int SkillWheel[MAX_SKILLKEYS][2];

    // Augmentations
    int Augs[AUG_MAX];

    // Stims
    int Stims[STIM_MAX];

    // Turret Upgrades
    int TurretUpgrades[TU_MAX];

    // Misc
    int Credits;
    int Modules;
    int Medkit;
    int GoldChips;
    int PlatinumChips;
    int ShopCard;
    int Battery;
    int Toxicity;
    int ArenaWave;

    // Locker
    int Locker[ITEM_CATEGORIES][ITEM_MAX];
    int WeaponMods[ITEM_MAX][DRLA_MODPACK_SIZE];

    // Auto-Sell
    int ItemAutoMode[ITEM_CATEGORIES][ITEM_MAX];

    // ----- COMPATIBILITY EXTENSIONS -----

    // DRLA Tokens
    bool DRLATokens[DRLA_MAX_TOKENS];

    // ------------------------------------

    // Checksum
    unsigned int Checksum;
};

// Base GUI Data
struct GUIData_S
{
    bool Created;
    bool Open;
};

// Items

// Item Definition
struct ItemInfo_S
{
    str Actor;
    str Name;

    int Price;
    int Rank;
    int Rarity;

    // Sprite information
    struct
    {
        str Name;
        int XOff;
        int YOff;
    } Sprite;

    // Compat stuff.
    unsigned int CompatMods;
    int Category;
    int Index;
};

// Crates

struct HackNode_S
{
    bool Active;
    int Type;
    int Start;
    int End;
};

struct CrateInfo_S
{
    bool Generated;
    bool SupplyDrop;
    bool Firewall;
    bool Empty;
    int TID;
    int Amount;
    int Rarity;

    bool Active[CRATE_MAX_ITEMS];
    struct ItemInfo_S RPGGlobal *Item[CRATE_MAX_ITEMS];

    // Hacking Minigame
    bool HacksGenerated;
    int Hacking;
    int HackingCooldown;

    int Tries;

    int NodeMax[NODE_MAX];

    struct HackNode_S Nodes[MAX_NODES];
    int GenTotal;
    int GenType;
    int GenNodes[NODE_MAX];
};

// Skills

struct SkillLevelInfo_S
{
    int CurrentLevel;
    int Level;
};

typedef bool (*SkillUseScript)(struct SkillLevelInfo_S *, void *) NamedScript Console;

struct Skill_S
{
    str Name;
    int Cost;
    int MaxLevel;
    SkillUseScript Use;
    str Description[MAX_LEVELS];
    str Icon;
};

struct AuraInfo_S
{
    int Time;
    fixed Range;
    bool Team;
    bool DefenseBoost;

    struct
    {
        bool Active;
        int Level;
    } Type[AURA_MAX];
};

// Shield

struct ShieldPart_S
{
    str Actor;
    str Name;
    str Icon;

    int Capacity;
    int ChargeRate;
    fixed DelayRate;
};

typedef void (*ShieldAccModScript)() NamedScript;
typedef void (*ShieldAccEquipScript)() NamedScript;
typedef void (*ShieldAccUnequipScript)(bool) NamedScript;
typedef void (*ShieldAccDamageScript)(int) NamedScript;
typedef void (*ShieldAccBreakScript)() NamedScript;
typedef int  (*ShieldAccChargeScript)(int) NamedScript;
typedef void (*ShieldAccOverchargeScript)(int) NamedScript;
typedef bool (*ShieldAccFastChargeScript)() NamedScript;
typedef void (*ShieldAccFullChargeScript)() NamedScript;

struct ShieldAccessory_S
{
    str Actor;
    str Name;
    str Icon;
    int Price;
    str Description;
    EShieldPassive PassiveEffect;

    ShieldAccModScript          Modifier;
    ShieldAccEquipScript        Equip;
    ShieldAccUnequipScript      Unequip;
    ShieldAccDamageScript       Damage;
    ShieldAccBreakScript        Break;
    ShieldAccChargeScript       Charge;
    ShieldAccOverchargeScript   Overcharge;
    ShieldAccFastChargeScript   FastCharge;
    ShieldAccFullChargeScript   FullCharge;
};

// Monsters

struct MonsterStats_S
{
    // Basic
    int TID;
    str Actor;
    str ReplaceActor;
    struct Position_S spawnPos;
    int Flags;
    int RenderStyle;
    int SpawnHealth;
    int HealthMax;
    int RegenHealth;

    // Properties
    fixed Speed;
    fixed Height;
    fixed Radius;

    // Flags
    bool Init;
    bool NeedReinit;
    bool HealthBar;
    bool Named;
    bool Reinforcement;
    bool MegaBoss;

    // Missions
    int Target;

    // Stats
    int Level;
    int Threat;
    int Strength;
    int Defense;
    int Vitality;
    int Energy;
    int Regeneration;
    int Agility;
    int Capacity;
    int Luck;

    // Auras
    struct AuraInfo_S Aura;
    bool HasAura;
    bool HasShadowAura;

    int LevelAdd;
    bool AuraAdd[AURA_MAX];

    int DamageTable[MAX_PLAYERS];
};

struct MonsterInfo_S
{
    str Actor;
    str Name;

    // This monster's relative threat level as a percentage
    int Difficulty;
    int ThreatLevel;
    // These guys are in short supply
    bool Boss;

    // Special event text for One Monster level events
    str Feeling;
};

struct MegabossInfo_S
{
    str Actor;
};

// Health Bars

struct HUDBarInfo_S
{
    int TID;

    // Is this referencing a player or enemy?
    bool IsPlayer;
    // Is the actor friendly?
    bool Friendly;

    // Basic
    str Actor;
    str NameColor;
    str Name;
    int Level;
    int Rank;
    int Flags;
    struct AuraInfo_S Aura;

    // Health, Armor, Shield
    int Health;
    int HealthMax;
    int SpawnHealth;
    int Armor;
    int ArmorMax;
    bool ShieldActive;
    int Shield;
    int ShieldMax;

    // Stats
    int Strength;
    int Defense;
    int Vitality;
    int Energy;
    int Regeneration;
    int Agility;
    int Capacity;
    int Luck;

    // Position
    fixed X;
    fixed Y;
    fixed Z;
    fixed Height;
};

// Missions

struct MissionInfo_S
{
    // Basic
    bool Active;
    int Type;
    int Difficulty;

    // Reward
    long int RewardXP;
    long int RewardRank;
    int RewardCredits;
    int RewardModules;
    struct ItemInfo_S RPGGlobal *RewardItem;

    // Mission Data
    struct ItemInfo_S RPGGlobal *Item;
    struct MonsterInfo_S const *Monster;
    int Current;
    int Amount;
};

// Minigames

struct MinigameData_S
{
    bool Ingame;
};

// Turret

struct TurretUpgrade_S
{
    str Name;
    int MaxLevel;
    int Cost;

    str Description;
    str UpgradeInfo;
    str CommandInfo;

    struct TurretUpgrade_S *Prereq;
};

// Map

struct LevelInfo_S
{
    // MAPINFO Level Number
    int LevelNum;

    // If we start in the Outpost, we set this on MAP01 to tell ourselves that
    // we need to replace the placeholder info with real info.
    bool NeedsRealInfo;

    // Map is an Outpost or an Arena
    bool UACBase;
    bool UACArena;

    // Name data
    str LumpName;
    str NiceName;

    // Level stats
    bool Completed;

    int MaxMonstersKilled;
    int MaxTotalMonsters;
    int MaxMonsterPercentage;
    int MaxItemsFound;
    int MaxTotalItems;
    int MaxItemPercentage;
    int MaxSecretsFound;
    int MaxTotalSecrets;
    int MaxSecretPercentage;
    int ShortestTime;
    int UniqueSecrets;

    // Par/Sucks time
    int Par;
    int Sucks;

    // 100% Bonuses
    bool KillBonus;
    bool ItemsBonus;
    bool SecretsBonus;
    bool AllBonus;
    bool ParBonus;

    // Miscellaneous
    int AdditionalMonsters;
    bool SecretMap;
    bool BadMap;
    bool Init;

    // Event stuff
    struct DynamicArray_S MonsterPositions;
    unsigned int Event;
    bool EventCompleted;

    // Megaboss Event
    struct MegabossInfo_S const *MegabossActor;

    // Environmental Hazard Event
    int HazardLevel;
    int RadLeft;
    int GeneratorFuel;

    // Thermonuclear Bomb event
    int BombTime;
    bool BombExplode;
    bool BombAnnouncing;
    bool BombKeyActive[MAX_NUKE_KEYS];
    bool BombKeyDisarming[MAX_NUKE_KEYS];
    int BombKeyTimer[MAX_NUKE_KEYS];

    // Low Power Event
    bool PowerGeneratorActive;

    // One Monster Event
    struct MonsterInfo_S const *SelectedMonster;

    // Hell Unleashed Event
    int HellUnleashedActive;
    int PandoraBoxTID;
    fixed LevelAdd;
    fixed RareAdd;

    // Harmonized Destruction event
    int AuraType;

    // Doomsday Event
    int DoomTime;
};

// RPG

struct PlayerData_S
{
    int TID;
    int PlayerView;

    // Revive stuff
    int BodyTID;
    int ReviveKeyTimer;
    int ReviverTID;
    int ReviveeNum;

    // Flags
    bool FirstRun;
    bool InMenu;
    bool InShop;
    bool InMinigame;
    bool CrateOpen;
    bool CanSurvive;    // You're about to die, do something about it!

    // Primary Stats
    int Strength;       // Increases Damage
    int Defense;        // Reduces Damage taken
    int Vitality;       // Increases max Health and HP regen rate
    int PrevVitality;   // Player's Vitality from last tic
    int Energy;         // Increases max EP and EP regen rate
    int PrevEnergy;     // Player's Energy from last tic
    int Regeneration;   // Increases both HP/EP regen rate
    int Agility;        // Increases movement speed, jump height and survival bonus (and optionally weapon speed)
    int Capacity;       // Increases max ammo capacities
    int Luck;           // Increases drop chances
    int ActualHealth;   // The player's real, actual Health
    int HealthMax;      // Max player Health
    int PrevHealth;     // Player's Health from last tic
    int PrevCredits;    // Player's held Credits from last tic

    // Natural Stat Increases
    int StrengthNat;
    int DefenseNat;
    int VitalityNat;
    int EnergyNat;
    int RegenerationNat;
    int AgilityNat;
    int CapacityNat;
    int LuckNat;

    // Souls Count
    int SoulRedCount;
    int SoulGreenCount;
    int SoulWhiteCount;
    int SoulPinkCount;
    int SoulBlueCount;
    int SoulPurpleCount;
    int SoulOrangeCount;
    int SoulDarkBlueCount;
    int SoulYellowCount;
    fixed SoulsCount;

    // Total Stat Values
    int StrengthTotal;
    int DefenseTotal;
    int VitalityTotal;
    int EnergyTotal;
    int RegenerationTotal;
    int AgilityTotal;
    int CapacityTotal;
    int LuckTotal;

    // Stat Bonuses
    int StrengthBonus;
    int DefenseBonus;
    int VitalityBonus;
    int EnergyBonus;
    int RegenerationBonus;
    int AgilityBonus;
    int CapacityBonus;
    int LuckBonus;

    // Compatibility Handling - DoomRL Arsenal Extended
    int NomadLuckBonus;

    // Stat XP Levels
    long int StrengthXP;
    long int DefenseXP;
    long int VitalityXP;
    long int EnergyXP;
    long int RegenerationXP;
    long int AgilityXP;
    long int CapacityXP;
    long int LuckXP;

    // Stat Perks
    bool Perks[STAT_MAX];
    int AgilityTimer;

    // Secondary Stats
    int LevelDamage;            // Damage dependent on the player's level
    int BonusDamage;            // Damage bonus given by the Strength stat
    fixed DamageMult;           // Damage multiplier from Red Aura and Strength Aug
    int TotalDamage;            // Combined LevelDamage and BonusDamage
    fixed DamageFactor;         // General damage the player will defend against
    int Mass;                   // Player mass, for preventing knockback
    fixed StatusEffectResist;   // Chance to resist a status effect
    int AuraRange;              // The reach of your auras to affect other players
    int ToxicityRegenBonus;     // Speed at which Toxicity dissipates over time
    fixed Speed;                // Movement Speed
    fixed JumpHeight;           // Jump Height
    int WeaponSpeed;            // Weapon Speed Increase bsed on Agility
    int SurvivalBonus;          // Chance that you will survive a fatal hit
    int InvItems;               // How many inventory items you are currently carrying
    int MedkitMax;              // THe total amount of healing your Medkit can hold
    int StatCap;                // Current Stat Cap

    // Energy Points (EP)
    int EP;
    int EPMax;

    // Level
    int Level;
    long int XP;
    long int XPNext;
    int XPPercent;

    // Rank
    str RankString;
    int RankLevel;
    long int Rank;
    long int RankNext;
    int RankPercent;

    // Combo System
    int Combo;
    int ComboTimer;
    int BonusGained;
    int XPGained;
    int RankGained;

    // HP/EP Regen Timers
    int HPRate;
    int HPTime;
    int HPAmount;
    int EPRate;
    int EPTime;
    int EPAmount;
    int RegenBoostTimer;
    bool MovementRegenDelay;

    // Can Drop / Drop Chance Percentages
    bool HealthDrop;
    bool EPDrop;
    bool AmmoDrop;
    bool TurretDrop;
    bool ModuleDrop;
    bool ArmorDrop;
    bool WeaponDrop;
    bool ShieldDrop;
    bool AugDrop;
    fixed HealthChance;
    fixed EPChance;
    fixed AmmoChance;
    fixed TurretChance;
    fixed ModuleChance;
    fixed ArmorChance;
    fixed WeaponChance;
    fixed ShieldChance;
    fixed AugChance;

    // Menu Data
    bool MenuBlock;
    int Menu;
    int OutpostMenu;
    int MenuIndex;
    int StatPage;
    int SkillPage;
    int ShieldPage;
    bool NewShieldParts[3][MAX_PARTS];
    bool NewShieldAccessoryParts[MAX_ACCESSORIES];
    int StimSelected;
    int TurretPage;
    int ShopIndex;
    int ShopPage;

    // Map Packs (WadSmoosh, Lexicon and etc.)
    int SelectedMapPack;

    // Skill Info
    struct SkillLevelInfo_S SkillLevel[MAX_CATEGORIES][MAX_SKILLS];
    struct AuraInfo_S Aura;
    bool AuraBonus;
    fixed SkillRefundMult;
    bool SkillWheelOpen;
    int WheelSelection;
    int SkillSelected;
    int SkillCategory[MAX_SKILLKEYS];
    int SkillIndex[MAX_SKILLKEYS];
    int Summons;
    int SummonTID[MAX_SUMMONS];
    bool SoulActive[SOUL_MAX];
    bool OverHeal;
    int SkillCostMult;
    int SkillPowerupCooldown;
    int SkillSupplyCooldown;
    bool EPPadCooldown;
    int EPPadCooldownTimer;
    bool Focusing;
    int FocusingCooldown;
    bool Overdrive;

    // Status Effects
    bool StatusType[SE_MAX];
    int StatusTypeHUD;
    int StatusIntensity[SE_MAX];
    int StatusTimer[SE_MAX];
    int StatusTimerMax[SE_MAX];
    int Toxicity;

    // Locker
    bool LockerMode;
    int Locker[ITEM_CATEGORIES][ITEM_MAX];
    struct
    {
        int Total;
        int Power;
        int Bulk;
        int Agility;
        int Technical;
        int Sniper;
        int Firestorm;
        int Nano;
        int Artifacts;
    } WeaponMods[ITEM_MAX];

    // Medkit
    int Medkit;

    // GUI
    struct GUIData_S GUI;

    //GUI Stats Order Form
    struct
    {
        int ChangeLevels;
        int ChangeCost;
        str ChangeString;
    } OrderForm[STAT_MAX];

    // Auto-Sell/Auto-Store
    int ItemAutoMode[ITEM_CATEGORIES][ITEM_MAX];
    bool ItemKeep[ITEM_CATEGORIES][ITEM_MAX];
    struct DynamicArray_S AutoSellList;
    struct DynamicArray_S AutoStoreList;

    // Toxicity Meter
    int ToxicTimer;
    int ToxicOffset;
    int ToxicStage;

    // Crate
    int CrateID;
    int CrateIndex;
    bool CrateHacking;

    // Damage
    int DamageTID;
    int DamageType;

    // Misc
    int StimImmunity;
    int ShopDiscount;
    int ShopCard;
    bool AutosaveTimerReset;
    bool SeenEventTip[MAPEVENT_MAX];

    // Nomad
    str NomadBasicItems[30];
    str NomadModPacks[30];
    int NomadAmountModPacks[30];
    bool NomadModPacksSave;

    // Phase Sisters
    // Portia
    struct
    {
        // Current Parts
        struct ShieldPart_S const *Body;
        struct ShieldPart_S const *Battery;
        struct ShieldPart_S const *Capacitor;
        struct ShieldAccessory_S const *Accessory;

        // Flags
        bool Active;
        bool Full;

        // Stats
        int Charge;
        int Capacity;
        int Interval;
        int ChargeRate;
        fixed DelayRate;
        int Timer;

        // Accessories
        int AccessoryBattery;
        int AccessoryTimer;
        struct Position_S AccessoryPosition;
    } PortiaShield;

    // Terri
    struct
    {
        // Current Parts
        struct ShieldPart_S const *Body;
        struct ShieldPart_S const *Battery;
        struct ShieldPart_S const *Capacitor;
        struct ShieldAccessory_S const *Accessory;

        // Flags
        bool Active;
        bool Full;

        // Stats
        int Charge;
        int Capacity;
        int Interval;
        int ChargeRate;
        fixed DelayRate;
        int Timer;

        // Accessories
        int AccessoryBattery;
        int AccessoryTimer;
        struct Position_S AccessoryPosition;
    } TerriShield;

    // Associated Drops
    struct DynamicArray_S DropTID;

    // Structception
    struct
    {
        fixed Battery;
        fixed BatteryMax;
        fixed BatteryDrain;
        int BaseSlots;
        int Slots;
        int SlotsUsed;
        bool Active[AUG_MAX];
        int CurrentLevel[AUG_MAX];
        int Level[AUG_MAX];
    } Augs;

    struct
    {
        // Current Parts
        struct ShieldPart_S const *Body;
        struct ShieldPart_S const *Battery;
        struct ShieldPart_S const *Capacitor;
        struct ShieldAccessory_S const *Accessory;

        // Flags
        bool Active;
        bool Full;

        // Stats
        int Charge;
        int Capacity;
        int Interval;
        int ChargeRate;
        fixed DelayRate;
        int Timer;

        // Accessories
        int AccessoryBattery;
        int AccessoryTimer;
        struct Position_S AccessoryPosition;
    } Shield;

    struct
    {
        int Vials[STIM_MAX];
        bool ActiveBonus[STIM_MAX];
        int Current[STIM_MAX];
        int Last[STIM_MAX];

        int PowerupTimer[STIM_MAX];
        int PowerupTimerMax[STIM_MAX];

        bool Active;
        int Size;
        int Amount;
        int Capacity;
        int VialMax;
        int Timer;
        int TimerMax;
        int Toxicity;
    } Stim;


    struct
    {
        // Flags
        bool Init;
        bool Active;
        bool Destroyed;
        bool Maintenance;
        bool PaidForRepair;

        // TID
        int TID;

        // Command Wheel
        bool WheelOpen;
        int WheelCommand;

        // Upgrades
        int Upgrade[MAX_UPGRADES];

        // Health
        int Health;
        int HealthMax;

        // Weapons/Ammo
        int Weapon;
        int BulletAmmo;
        int BulletAmmoMax;
        int ShellAmmo;
        int ShellAmmoMax;
        int RocketAmmo;
        int RocketAmmoMax;
        int PlasmaAmmo;
        int PlasmaAmmoMax;
        int RailAmmo;
        int RailAmmoMax;
        bool Autoload;

        // Command
        int Command;

        // Battery
        int Battery;
        int BatteryMax;
        bool AugBattery;

        // Timers
        int HitTimer;
        //int TeleportTimer;
        int ChargeTimer;
        int RepairTimer;
        int RefitTimer;

        // Offsets
        fixed AngleOffset;
        fixed DistanceOffset;
        fixed HeightOffset;
    } Turret;

    struct MissionInfo_S Mission;
};

//LegenDoom
struct LegendaryDef_S
{
    str Effect;
    str Image;
};

#endif // DOOMRPG_STRUCTS_H
