// DOOMRPG COMPATIBILITY
// --------------------------------------------------

// Calling the ACS MonsterInit script for monsters
class Pandemonia_MonsterInit : EventHandler
{
    override void WorldThingSpawned(WorldEvent e)
    {
        if (e.Thing && e.Thing.bIsMonster)
        {
			 static const string PandemoniaMonsters[] =
            {
                "LaserRifleZombieDRPG", "PistolZombie", "PlasmaPistolZombieDRPG",								//Zombies
				"SpecOpsRiflemanDRPG", 					
				
                "AutoShotgunZombie", "ChaosWarriorDRPG", "RocketZombie", "ShotgunAdmiral", "NewShotgunguy",		//Shotgunners
				"SlugShotgunZombie", "SpecOpsShotgunner", "SuperShotgunZombie",
				
				"AssaultGunner", "BFG10kWarriorDRPG", "BFGCommandoDRPG", "ChaingunZombie", 						//Commandos
				"ChaosDeathmarkDRPG", "NailborgCommando", "PlasmaRifleZombieDRPG", "SpecOpsGunner", 
				"SpecOpsLieutenant",
				
				"ChaosImpDRPG",	"DarkImp", "Devil",	"Harvester", "NewImp", "PhaseImp", "PlaguelingDRPG",		//Imps
				"Scoundrel",
				
				"BloodFiendDRPG", "ChaosFlayerDRPG", "MagmaDemon", "PandMauler", "MechDemon", "NewDemon",		//Pinkys
				
				"ChaosOphydianDRPG", "Darkbeast", "Delusion", "NightmareDemon",	"NewSpectre", "Wretch",			//Spectres
				
				"ChaosHollowDRPG", "DarkRevenant", "MissileRevenant", "NewRevenant", "PandSentinel", "Sentry",	//Revevants
				
				"Agathodemon", "Cacobot", "NewCacodemon", "Crackodemon", "DarkCacodemon", "WitherdemonDRPG",	//Cacodemons
				
				"Corpulent", "Hectebus", "Mafibus", "Mancubus", "Maxibus", "Tankubus",							//Mancubuses
				
				"CyberHellKnight", "CyberHellViscount", "NewHellKnight", "HellViscount", "HellWarden",			//Knights
				"Infernoble", 
				
				"Afrit", "ArchonOfHell", "NewBaronOfHell", "BruiserDemon", "Cyberwarden", "Cybruiser",			//Barons
				"DarkCybruiser", "Pyrobruiser", 
				
				"NewArchvile", "CryptekDRPG", "DarkVile", "Diabolist", "Distortionist", "Infernalist",			//Arch-Viles
				
				"Arachknight", "NewArachnotron", "AugmentedArachnotron", "ChaosObserverDRPG", 					//Arachnotrons
				"FusionArachnotron", "NailgunArachnotron", "Widow", 
				
				"ChaosBeholderDRPG", "DarkElementalDRPG", "HadesElemental", "NewPainElemental", 				//Pain Elementals
				"PlasmaticElemental",	
				
				"ChaosUmbra", "Electrosoul", "NewLostSoul", "Phantasm", "SoullessDrone", "PandWraith",			//Lost Souls
				
				"Epic2Alien", "Epic2Keen", "Scythe2Afrit", "Scythe2Marine"										//Patch
            };
			
            static const string PandemoniaBosses[] =
            {
                "Annihilator", "NewCyberdemon", "DarkCardinal", "DarkCyberdemon", "DreamweaverDRPG", 			//Cyberdemons
				"Eradicator", "Plamexis", "Terminator", 
				
				"Arachnophyte", "ChaosMonolithDRPG", "Demolisher", "NewSpiderMastermind", "SpiderMasterspark",	//Masterminds
				
				"Myrkura", "GeneralRoasterock"																	//Other Bosses
			};

			static const string PandemoniaOtherThings[] =
            {
                "Sayori"																						//Other Things
            };

            for (int i = 0; i < PandemoniaMonsters.size(); i++)
            {
                if (e.Thing.GetClassName() == PandemoniaMonsters[i])
                {
                    if (e.Thing.master is "ChaosMonolith")                        
						e.Thing.ACS_ScriptCall("MonsterInit", MF_NOXP | MF_NOAURA | MF_NODROPS);
                    else
                        e.Thing.ACS_ScriptCall("MonsterInit", 0);
                }
            }
				
			for (int i = 0; i < PandemoniaBosses.size(); i++)
				if (e.Thing.GetClassName() == PandemoniaBosses[i])
					e.Thing.ACS_ScriptCall("MonsterInit", MF_BOSS);
					
			for (int i = 0; i < PandemoniaOtherThings.size(); i++)
				if (e.Thing.GetClassName() == PandemoniaOtherThings[i])
					e.Thing.ACS_ScriptCall("MonsterInit", MF_NOXP | MF_NOAURA | MF_NODROPS);
        }
    }
}

Class PyrobruiserCometDRPGFix : PyrobruiserComet replaces PyrobruiserComet 										//Fix for Pyrobruiser Comet with DRLA i think
{
  States
  {
  Spawn:
    ZCOM AABB 2 Bright Light("Comet1")
		{
		A_SpawnItemEx("AfritCometTrail",0,0,0,frandom(-0.5,0),frandom(-0.5,-0.5),frandom(0,0.5));
		A_SpawnItemEx("FireProjectileTrail",frandom(-6,0),frandom(-6,6),frandom(-2,6),0,frandom(2,2),frandom(0,3));
		A_SpawnItemEx("FireProjectileTrail2",frandom(-6,0),frandom(-6,6),frandom(-2,6),0,frandom(1,1),frandom(0,5));
		for(user_fx = 0;user_fx<=2;user_fx++)
			A_SpawnParticle(GetParticleColor(),SPF_FULLBRIGHT|SPF_RELATIVE,random(14,22),frandom(10,14),0,frandom(-8,0),frandom(-8,8),frandom(-8,8),frandom(-4,0),frandom(-1,1),frandom(0,4),0,0,-0.03,1,-1,-0.8);
		}
    Loop;
	}
}


//-------------------------------Monsters Things (damage types etc.)----------------------------------

//Zombies-------------------------------------------------------------------------------------
Class LaserRifleZombieDRPG : LaserRifleZombie replaces LaserRifleZombie
{
  Default
  {
	DamageType "Plasma";
  }
}

Class PlasmaPistolZombieDRPG : PlasmaPistolZombie replaces PlasmaPistolZombie
{
  Default
  {
	DamageType "Plasma";
  }
}

Class SpecOpsRiflemanDRPG : SpecOpsRifleman replaces SpecOpsRifleman
{
  Default
  {
	DamageType "Plasma";
  }
}

//Shotgunners--------------------------------------------------------------------------------
Class ChaosWarriorDRPG : ChaosWarrior replaces ChaosWarrior
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class ChaosWarriorProjectileDRPG : ChaosWarriorProjectile replaces ChaosWarriorProjectile
{
  Default
  {
  Damagetype "Radiation";
  }
}

//Chaingunners--------------------------------------------------------------------------------
Class ChaosDeathmarkDRPG : ChaosDeathmark replaces ChaosDeathmark
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class DeathmarkPuffDRPG : DeathmarkPuff replaces DeathmarkPuff //man bro I hate working with puffs
{
  Default
  {
  DamageType "Radiation";
  }
}

Class PlasmaRifleZombieDRPG : PlasmaRifleZombie replaces PlasmaRifleZombie
{
  Default
  {
	DamageType "Plasma";
  }
}

Class BFG10kWarriorDRPG : BFG10kWarrior replaces BFG10kWarrior
{
  Default
  {
	DamageType "Plasma";
  }
}

Class BFGCommandoDRPG : BFGCommando replaces BFGCommando
{
  Default
  {
	DamageType "Plasma";
  }
}

//Imps--------------------------------------------------------------------------------
Class ChaosImpDRPG : ChaosImp replaces ChaosImp
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}

Class PlaguelingDRPG : Plagueling replaces Plagueling
{
  Default
  {
	DamageType "Slime";
	DamageFactor "Slime", 0;
  }
}
Class PlaguelingBallDRPG : PlaguelingBall replaces PlaguelingBall
{
  Default
  {
	DamageType "Slime";
  }
}
Class PlaguelingPoisonPodDRPG : PlaguelingPoisonPod replaces PlaguelingPoisonPod
{
  Default
  {
	DamageType "Slime";
  }
}

//Spectres--------------------------------------------------------------------------------
Class ChaosOphydianDRPG : ChaosOphydian replaces ChaosOphydian
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class OphydianHomingFluxDRPG : OphydianHomingFlux replaces OphydianHomingFlux
{
  Default
  {
	DamageType "Radiation";
  }
}

//Pinkys--------------------------------------------------------------------------------
Class BloodFiendDRPG : BloodFiend replaces BloodFiend 
{
  Default
  {
	DamageType "Slime";
  }
}
Class BloodFiendBileDRPG : BloodFiendBile replaces BloodFiendBile
{
  Default
  {
	DamageType "Slime";
  }
}

Class ChaosFlayerDRPG : ChaosFlayer replaces ChaosFlayer
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class ChaosFlayerProjectileDRPG : ChaosFlayerProjectile replaces ChaosFlayerProjectile
{
  Default
  {
	DamageType "Radiation";
  }
}

//-------------------------------Lost Souls Things----------------------------------------------------
Class NewDRPGLostSoul : NewLostSoul replaces NewLostSoul
{
  States
  {
  Spawn:
  	TNT1 A 0 NoDelay 
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol.
						ClearCounters();
					}
					}
	TNT1 A 0 
		{
		A_SpawnItemEx("LostSoulFireSpawner",0,0,0,0,0,0,0,SXF_SETMASTER);
		soul_firespawned = 1;
		}
  Idle:
		SKUL AB 2 A_Look();
		Goto Super::Idle;
  See:
  	TNT1 A 0 
					{
					if ( GetLevelSpawnTime() == 0 ) {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);
						ClearCounters();
					}
					}
		SKUL AB 2 A_Chase();
		Goto Super::See;
  }
}

Class PhantasmDRPG : Phantasm replaces Phantasm
{
  States
  {
  Spawn:
    TNT1 A 0 NoDelay 
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
	TNT1 A 0
		{
		A_SpawnItemEx("PhantasmFireSpawner",0,0,0,0,0,0,0,SXF_SETMASTER);
		soul_firespawned = 1;
		}
  Idle:
    PHNT AB 2 A_Look;
    Loop;
  See:
    TNT1 A 0 
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
	PHNT AB 2 A_Chase();
    Loop;
  }
}

Class SoullessDRPGDrone : SoullessDrone replaces SoullessDrone
{
  States
  {
  Spawn:
    TNT1 A 0 NoDelay 
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
	TNT1 A 0
		{
		A_SpawnItemEx("SoullessDroneEffectSpawner",0,0,0,0,0,0,0,SXF_SETMASTER);
		soul_firespawned = 1;
		}
  Idle:
    DRON A 2 A_Look;
    Loop;
  See:
    TNT1 A 0 
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
    DRON A 2 A_Chase();
    Loop;
  }
}

Class PandDRPGWraith : PandWraith replaces PandWraith
{
  States
  {
  Spawn:
    TNT1 A 0 NoDelay 
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
	TNT1 A 0
		{
		A_SpawnItemEx("WraithEffectSpawner",0,0,0,0,0,0,0,SXF_SETMASTER);
		soul_firespawned = 1;
		}
  Idle:
    WRTH ABCD 2 A_Look;
    Loop;
  See:
    TNT1 A 0
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
    WRTH ABCD 2 
		{
		A_Chase();
		if(A_Jump(2,"Null")) { return ResolveState("GoPhase"); } return ResolveState(null);
		}
    Loop;
  }
}

Class ChaosDRPGUmbra : ChaosUmbra replaces ChaosUmbra
{
	Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
  States
  {
  Spawn:
    TNT1 A 0 NoDelay 
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
  Idle:
    CHMB A 2 A_Look();
    Loop;
  See:
    TNT1 A 0
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
	TNT1 A 0 A_WeaveInit();
    CHMB A 2 A_UmbraChase();
    Wait;
  Dash:
	TNT1 A 0 
		{
		bNOPAIN = true;
		ThrustThing(Angle*256/360+randompick(64,192),16,0,0);
		}
	CHMB AAAAAAAAAAAAAAA 1 A_SpawnItemEx("GenericPhaseGhost",0,0,0,0,0,0,0,SXF_TRANSFERSCALE|SXF_TRANSFERSTENCILCOL|SXF_TRANSFERSPRITEFRAME);
	TNT1 A 0
		{
		bNOPAIN = false;
		A_Stop();
		}
	Goto See;
  }
}

Class ElectrosoulDRPG : Electrosoul replaces Electrosoul
{
 States
  {
  Spawn:
    TNT1 A 0 NoDelay 
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
	TNT1 A 0
		{
		A_SpawnItemEx("ElectrosoulEffectSpawner",0,0,0,0,0,0,0,SXF_SETMASTER);
		soul_firespawned = 1;
		}
  Idle:
	ELSL A 2 A_Look;
	Loop;
  See:
    TNT1 A 0
					{
					if ( GetLevelSpawnTime() == 0 ) {													//If LostSoul spawn on the map...
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOAURA | MF_NODROPS);				//...player got XP when kill it, else...
					} else {
						ACS_NamedExecuteAlways ("MonsterInit", 0, MF_NOXP | MF_NOAURA | MF_NODROPS);	//...don`t get XP lol
						ClearCounters();
					}
					}
	ELSL A 2 A_Chase();
	Loop;
  }
}

//Revs--------------------------------------------------------------------------------
Class ChaosHollowDRPG : ChaosHollow replaces ChaosHollow
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class HollowBallDRPG : HollowBall replaces HollowBall
{
  Default
  {
	DamageType "Radiation";
  }
}
Class HollowSkullBallDRPG : HollowSkullBall replaces HollowSkullBall
{
  Default
  {
	DamageType "Radiation";
  }
}

//Cacos--------------------------------------------------------------------------------
Class CacodemonBall2DRPG1 : PandProjectile
{
  Default
  {
  Radius 6;
  Height 8;
  Speed 15;
  FastSpeed 30;
  DamageFunction 20;
  Damagetype "Electric";
  Renderstyle "Add";
  PandProjectile.ParticleColors "FFD7BB", "FFA35B", "FF3F3F", "9F009B";
  SeeSound "Cacodemon/Ball";
  DeathSound "Cacodemon/BExplode";
  Decal "CacoScorch";
  }
  
  States
  {
  Spawn:
	BAL2 AABB 2 Bright 
		{
		A_SpawnItemEx("LightningProjectileTrail",frandom(-3,3),frandom(-3,3),frandom(-3,3),frandom(-2,2),frandom(-1,1),frandom(-1,1));
		A_SpawnItemEx("RedPlasmaLightningTrail",0,0,0,0,0,0,0,0,192);
		for(user_fx = 0;user_fx<=3;user_fx++)
			{
			A_SpawnParticle(GetParticleColor(),SPF_FULLBRIGHT|SPF_RELATIVE,random(7,15),frandom(6,8),0,frandom(-6,0),frandom(-6,6),frandom(-6,6),frandom(-2,2),frandom(-1,1),frandom(-1,1),0,0,0,1,-1,-1);
			}
		}
    Loop;
  Death:
	TNT1 A 0 
		{
		A_SpawnItemEx("LightningProjectileExplode");
		for(user_fx = 0;user_fx<=30;user_fx++)
			{
			A_SpawnParticle(GetParticleColor(),SPF_FULLBRIGHT|SPF_RELATIVE,random(10,17),frandom(12,14),random(0,360),frandom(0,6),0,frandom(-6,6),frandom(0,6),0,frandom(-6,6),0,0,0,1,-1,-1.2);
			}
		}
    BAL2 CDE 4 Bright;
    Stop;
	}
}
Class CacobotBallDRPG : CacodemonBall2DRPG1 replaces CacobotBall
{}

Class WitherdemonDRPG : Witherdemon replaces Witherdemon
{
  Default
  {
	DamageType "Slime";
  }
}
Class WitherdemonBallDRPG : WitherdemonBall replaces WitherdemonBall
{
  Default
  {
	DamageType "Slime";
  }
}
Class WitherdemonEyeProjectileDRPG : WitherdemonBallDRPG replaces WitherdemonEyeProjectile
{}
Class WitherdemonEyeProjectile2DRPG : WitherdemonEyeProjectileDRPG replaces WitherdemonEyeProjectile2
{}
Class WitherdemonCometDRPG : PlaguelingPoisonPodDRPG replaces WitherdemonComet
{}

//MiniSpiders--------------------------------------------------------------------------------
Class ChaosObserverDRPG : ChaosObserver replaces ChaosObserver
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class ObserverFluxDRPG : ObserverFlux replaces ObserverFlux
{
  Default
  {
	DamageType "Radiation";
  }
}

//PainElementals--------------------------------------------------------------------------------
Class ChaosBeholderDRPG : ChaosBeholder replaces ChaosBeholder
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class BeholderHomingBallDRPG : ChaosWarriorProjectileDRPG replaces BeholderHomingBall {}
Class BeholderMegaBallDRPG : BeholderMegaBall replaces BeholderMegaBall
{
  Default
  {
	DamageType "Radiation";
  }
}
Class BeholderStormBoltDRPG : BeholderStormBolt replaces BeholderStormBolt
{
  Default
  {
	DamageType "Radiation";
  }
}

Class DarkElementalDRPG : DarkElemental replaces DarkElemental
{
  Default
  {
	DamageType "Slime";
  }
}
Class DarkElementalBileDRPG : BloodFiendBileDRPG replaces DarkElementalBile
{}

Class HadesBallDRPG : CacodemonBall2DRPG1 replaces HadesBall {}
Class HadesBoltDRPG : HadesBallDRPG replaces HadesBolt {}
Class HadesBoltSmallDRPG : HadesBallDRPG replaces HadesBoltSmall {}
Class HadesSphereDRPG : HadesSphere replaces HadesSphere
{
  Default
  {
	Damagetype "Electric";
  }
}

//Viles--------------------------------------------------------------------------------
Class CryptekDRPG : Cryptek replaces Cryptek
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class CryptekEnergyBallDRPG : CryptekEnergyBall replaces CryptekEnergyBall
{
  Default
  {
	DamageType "Radiation";
  }
}
Class CryptekBigEnergyBallDRPG : CryptekEnergyBallDRPG replaces CryptekBigEnergyBall {}
Class CryptekElectricFieldDRPG : CryptekElectricField replaces CryptekElectricField
{
  Default
  {
	DamageType "Radiation";
  }
}

//Cybies--------------------------------------------------------------------------------++++++++++++++
Class DreamweaverDRPG : Dreamweaver replaces Dreamweaver //I dreamt about a fucking blue Terminator, one year later and it's in Pandemonia now
{
  Default
  {
  DamageFactor "Fire", 1.5;
  }
}

//Masterminds--------------------------------------------------------------------------------++++++++++++++
Class ChaosMonolithDRPG : ChaosMonolith replaces ChaosMonolith
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class MonolithHomingBFGDRPG : MonolithHomingBFG replaces MonolithHomingBFG
{
  Default
  {
  DamageType "Radiation";
  }
}
Class MonolithHomingBFG2DRPG : MonolithHomingBFGDRPG replaces MonolithHomingBFG2 {}
Class MonolithFluxBallDRPG : MonolithFluxBall replaces MonolithFluxBall
{
  Default
  {
  DamageType "Radiation";
  }
}
Class MonolithHomingFluxDRPG : MonolithFluxBallDRPG replaces MonolithHomingFlux {}

//SpecialsBosses--------------------------------------------------------------------------------++++++++++++++
