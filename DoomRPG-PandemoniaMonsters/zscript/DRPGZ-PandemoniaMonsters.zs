// DOOMRPG COMPATIBILITY
// --------------------------------------------------

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


//Monsters Things (damage types etc.)

//Zombies
Class PistolZombieRPG : PistolZombie replaces PistolZombie {}

Class LaserRifleZombieRPG : LaserRifleZombie replaces LaserRifleZombie
{
  Default
  {
	DamageType "Plasma";
  }
}

Class PlasmaPistolZombieRPG : PlasmaPistolZombie replaces PlasmaPistolZombie
{
  Default
  {
	DamageType "Plasma";
  }
}

Class SpecOpsRiflemanRPG : SpecOpsRifleman replaces SpecOpsRifleman
{
  Default
  {
	DamageType "Plasma";
  }
}

//Shotgunners
Class AutoShotgunZombieRPG : AutoShotgunZombie replaces AutoShotgunZombie {}
Class RocketZombieRPG : RocketZombie replaces RocketZombie {}
Class ShotgunAdmiralRPG : ShotgunAdmiral replaces ShotgunAdmiral {}
Class NewShotgunguyRPG : NewShotgunguy replaces NewShotgunguy {}
Class SlugShotgunZombieRPG : SlugShotgunZombie replaces SlugShotgunZombie {}
Class SpecOpsShotgunnerRPG : SpecOpsShotgunner replaces SpecOpsShotgunner {}
Class SuperShotgunZombieRPG : SuperShotgunZombie replaces SuperShotgunZombie {}

Class ChaosWarriorRPG : ChaosWarrior replaces ChaosWarrior
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

//Chaingunners
Class AssaultGunnerRPG : AssaultGunner replaces AssaultGunner {}
Class ChaingunZombieRPG : ChaingunZombie replaces ChaingunZombie {}
Class NailborgCommandoRPG : NailborgCommando replaces NailborgCommando {}
Class SpecOpsGunnerRPG : SpecOpsGunner replaces SpecOpsGunner {}
Class SpecOpsLieutenantRPG : SpecOpsLieutenant replaces SpecOpsLieutenant {}

Class ChaosDeathmarkRPG : ChaosDeathmark replaces ChaosDeathmark
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}
Class DeathmarkPuffDRPG : DeathmarkPuff replaces DeathmarkPuff
{
  Default
  {
  DamageType "Radiation";
  }
}

Class PlasmaRifleZombieRPG : PlasmaRifleZombie replaces PlasmaRifleZombie
{
  Default
  {
	DamageType "Plasma";
  }
}

Class BFG10kWarriorRPG : BFG10kWarrior replaces BFG10kWarrior
{
  Default
  {
	DamageType "Plasma";
  }
}

Class BFGCommandoRPG : BFGCommando replaces BFGCommando
{
  Default
  {
	DamageType "Plasma";
  }
}

//Imps
Class DarkImpRPG : DarkImp replaces DarkImp {}
Class DevilRPG : Devil replaces Devil {}
Class HarvesterRPG : Harvester replaces Harvester {}
Class NewImpRPG : NewImp replaces NewImp {}
Class PhaseImpRPG : PhaseImp replaces PhaseImp {}
Class ScoundrelRPG : Scoundrel replaces Scoundrel {}

Class ChaosImpRPG : ChaosImp replaces ChaosImp
{
  Default
  {
	DamageType "Radiation";
	DamageFactor "Radiation", 0;
  }
}

Class PlaguelingRPG : Plagueling replaces Plagueling
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

//Pinkys
Class MagmaDemonRPG : MagmaDemon replaces MagmaDemon {}
Class PandMaulerRPG : PandMauler replaces PandMauler {}
Class MechDemonRPG : MechDemon replaces MechDemon {}
Class NewDemonRPG : NewDemon replaces NewDemon {}

Class BloodFiendRPG : BloodFiend replaces BloodFiend 
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

Class ChaosFlayerRPG : ChaosFlayer replaces ChaosFlayer
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

//Spectres
Class DarkbeastRPG : Darkbeast replaces Darkbeast {}
Class DelusionRPG : Delusion replaces Delusion {}
Class NightmareDemonRPG : NightmareDemon replaces NightmareDemon {}
Class NewSpectreRPG : NewSpectre replaces NewSpectre {}
Class WretchRPG : Wretch replaces Wretch {}

Class ChaosOphydianRPG : ChaosOphydian replaces ChaosOphydian
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

//Lost Souls
Class NewLostSoulRPG : NewLostSoul replaces NewLostSoul
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

Class PhantasmRPG : Phantasm replaces Phantasm
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

Class SoullessDroneRPG : SoullessDrone replaces SoullessDrone
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

Class PandWraithRPG : PandWraith replaces PandWraith
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

Class ChaosUmbraRPG : ChaosUmbra replaces ChaosUmbra
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

Class ElectrosoulRPG : Electrosoul replaces Electrosoul
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

//Revevants
Class DarkRevenantRPG : DarkRevenant replaces DarkRevenant {}
Class MissileRevenantRPG : MissileRevenant replaces MissileRevenant {}
Class NewRevenantRPG : NewRevenant replaces NewRevenant {}
Class PandSentinelRPG : PandSentinel replaces PandSentinel {}
Class SentryRPG : Sentry replaces Sentry {}

Class ChaosHollowRPG : ChaosHollow replaces ChaosHollow
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

//Cacos
Class AgathodemonRPG : Agathodemon replaces Agathodemon {}
Class CacobotRPG : Cacobot replaces Cacobot {}
Class NewCacodemonRPG : NewCacodemon replaces NewCacodemon {}
Class CrackodemonRPG : Crackodemon replaces Crackodemon {}
Class DarkCacodemonRPG : DarkCacodemon replaces DarkCacodemon {}

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

Class WitherdemonRPG : Witherdemon replaces Witherdemon
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

//Arachnotrons
Class ArachknightRPG : Arachknight replaces Arachknight {}
Class NewArachnotronRPG : NewArachnotron replaces NewArachnotron {}
Class AugmentedArachnotronRPG : AugmentedArachnotron replaces AugmentedArachnotron {}
Class FusionArachnotronRPG : FusionArachnotron replaces FusionArachnotron {}
Class NailgunArachnotronRPG : NailgunArachnotron replaces NailgunArachnotron {}
Class WidowRPG : Widow replaces Widow {}

Class ChaosObserverRPG : ChaosObserver replaces ChaosObserver
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

//PainElementals
Class HadesElementalRPG : HadesElemental replaces HadesElemental {}
Class NewPainElementalRPG : NewPainElemental replaces NewPainElemental {}
Class PlasmaticElementalRPG : PlasmaticElemental replaces PlasmaticElemental {}

Class ChaosBeholderRPG : ChaosBeholder replaces ChaosBeholder
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

Class DarkElementalRPG : DarkElemental replaces DarkElemental
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

//Mancubuses
Class CorpulentRPG : Corpulent replaces Corpulent {}
Class HectebusRPG : Hectebus replaces Hectebus {}
Class MafibusRPG : Mafibus replaces Mafibus {}
Class MancubusRPG : Mancubus replaces Mancubus {}
Class MaxibusRPG : Maxibus replaces Maxibus {}
Class TankubusRPG : Tankubus replaces Tankubus {}

//Knights
Class CyberHellKnightRPG : CyberHellKnight replaces CyberHellKnight {}
Class CyberHellViscountRPG : CyberHellViscount replaces CyberHellViscount {}
Class NewHellKnightRPG : NewHellKnight replaces NewHellKnight {}
Class HellViscountRPG : HellViscount replaces HellViscount {}
Class HellWardenRPG : HellWarden replaces HellWarden {}
Class InfernobleRPG : Infernoble replaces Infernoble {}

//Barons
Class AfritRPG : Afrit replaces Afrit {}
Class ArchonOfHellRPG : ArchonOfHell replaces ArchonOfHell {}
Class NewBaronOfHellRPG : NewBaronOfHell replaces NewBaronOfHell {}
Class BruiserDemonRPG : BruiserDemon replaces BruiserDemon {}
Class CyberwardenRPG : Cyberwarden replaces Cyberwarden {}
Class CybruiserRPG : Cybruiser replaces Cybruiser {}
Class DarkCybruiserRPG : DarkCybruiser replaces DarkCybruiser {}
Class PyrobruiserRPG : Pyrobruiser replaces Pyrobruiser {}

//Viles
Class NewArchvileRPG : NewArchvile replaces NewArchvile {}
Class DarkVileRPG : DarkVile replaces DarkVile {}
Class DiabolistRPG : Diabolist replaces Diabolist {}
Class DistortionistRPG : Distortionist replaces Distortionist {}
Class InfernalistRPG : Infernalist replaces Infernalist {}

Class CryptekRPG : Cryptek replaces Cryptek
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

//Patch
Class Epic2AlienRPG : Epic2Alien replaces Epic2Alien {}
Class Epic2KeenRPG : Epic2Keen replaces Epic2Keen {}
Class Scythe2AfritRPG : Scythe2Afrit replaces Scythe2Afrit {}
Class Scythe2MarineRPG : Scythe2Marine replaces Scythe2Marine {}


//Cybies
Class AnnihilatorRPG : Annihilator replaces Annihilator {}
Class NewCyberdemonRPG : NewCyberdemon replaces NewCyberdemon {}
Class DarkCardinalRPG : DarkCardinal replaces DarkCardinal {}
Class DarkCyberdemonRPG : DarkCyberdemon replaces DarkCyberdemon {}
Class EradicatorRPG : Eradicator replaces Eradicator {}
Class PlamexisRPG : Plamexis replaces Plamexis {}
Class TerminatorRPG : Terminator replaces Terminator {}

Class DreamweaverRPG : Dreamweaver replaces Dreamweaver //I dreamt about a fucking blue Terminator, one year later and it's in Pandemonia now
{
  Default
  {
  DamageFactor "Fire", 1.5;
  }
}

//Masterminds
Class ArachnophyteRPG : Arachnophyte replaces Arachnophyte {}
Class DemolisherRPG : Demolisher replaces Demolisher {}
Class NewSpiderMastermindRPG : NewSpiderMastermind replaces NewSpiderMastermind {}
Class SpiderMastersparkRPG : SpiderMasterspark replaces SpiderMasterspark {}

Class ChaosMonolithRPG : ChaosMonolith replaces ChaosMonolith
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

//SpecialsBosses
Class GeneralRoasterockRPG : GeneralRoasterock replaces GeneralRoasterock {}
Class MyrkuraRPG : Myrkura replaces Myrkura {}




// Calling the ACS MonsterInit script for monsters
class Pandemonia_MonsterInit : EventHandler
{
    override void WorldThingSpawned(WorldEvent e)
    {
        if (e.Thing && e.Thing.bIsMonster)
        {
			 static const string PandemoniaMonsters[] =
            {
                "LaserRifleZombieRPG", "PistolZombieRPG", "PlasmaPistolZombieRPG",								//Zombies
				"SpecOpsRiflemanRPG", 					
				
                "AutoShotgunZombieRPG", "ChaosWarriorRPG", "RocketZombieRPG", "ShotgunAdmiralRPG", 				//Shotgunners
				"NewShotgunguyRPG",	"SlugShotgunZombieRPG", "SpecOpsShotgunnerRPG", "SuperShotgunZombieRPG",
				
				"AssaultGunnerRPG", "BFG10kWarriorRPG", "BFGCommandoRPG", "ChaingunZombieRPG", 					//Commandos
				"ChaosDeathmarkRPG", "NailborgCommandoRPG", "PlasmaRifleZombieRPG", "SpecOpsGunnerRPG", 
				"SpecOpsLieutenantRPG",
				
				"ChaosImpRPG",	"DarkImpRPG", "DevilRPG", "HarvesterRPG", "NewImpRPG", "PhaseImpRPG", 			//Imps
				"PlaguelingRPG", "ScoundrelRPG",
				
				"BloodFiendRPG", "ChaosFlayerRPG", "MagmaDemonRPG", "PandMaulerRPG", "MechDemonRPG", 			//Pinkys
				"NewDemonRPG",
				
				"ChaosOphydianRPG", "DarkbeastRPG", "DelusionRPG", "NightmareDemonRPG",	"NewSpectreRPG", 		//Spectres
				"WretchRPG",
				
				"ChaosUmbraRPG", "ElectrosoulRPG", "NewLostSoulRPG", "PhantasmRPG", "SoullessDroneRPG",			//Lost Souls
				"PandWraithRPG",			
				
				"ChaosHollowRPG", "DarkRevenantRPG", "MissileRevenantRPG", "NewRevenantRPG", "PandSentinelRPG", //Revevants
				"SentryRPG",
				
				"AgathodemonRPG", "CacobotRPG", "NewCacodemonRPG", "CrackodemonRPG", "DarkCacodemonRPG", 		//Cacodemons
				"WitherdemonRPG",
				
				"ArachknightRPG", "NewArachnotronRPG", "AugmentedArachnotronRPG", "ChaosObserverRPG", 			//Arachnotrons
				"FusionArachnotronRPG", "NailgunArachnotronRPG", "WidowRPG", 
				
				"ChaosBeholderRPG", "DarkElementalRPG", "HadesElementalRPG", "NewPainElementalRPG", 			//Pain Elementals
				"PlasmaticElementalRPG",	
				
				"CorpulentRPG", "HectebusRPG", "MafibusRPG", "MancubusRPG", "MaxibusRPG", "TankubusRPG",		//Mancubuses
				
				"CyberHellKnightRPG", "CyberHellViscountRPG", "NewHellKnightRPG", "HellViscountRPG", 			//Knights
				"HellWardenRPG", "InfernobleRPG", 
				
				"AfritRPG", "ArchonOfHellRPG", "NewBaronOfHellRPG", "BruiserDemonRPG", "CyberwardenRPG", 		//Barons
				"CybruiserRPG",	"DarkCybruiserRPG", "PyrobruiserRPG", 
				
				"NewArchvileRPG", "CryptekRPG", "DarkVileRPG", "DiabolistRPG", "DistortionistRPG", 				//Arch-Viles
				"InfernalistRPG",
				
				"Epic2AlienRPG", "Scythe2AfritRPG", "Scythe2MarineRPG"											//Patch
            };
			
            static const string PandemoniaBosses[] =
            {
                "AnnihilatorRPG", "NewCyberdemonRPG", "DarkCardinalRPG", "DarkCyberdemonRPG", "DreamweaverRPG", //Cyberdemons
				"EradicatorRPG", "PlamexisRPG", "TerminatorRPG", 
				
				"ArachnophyteRPG", "ChaosMonolithRPG", "DemolisherRPG", "NewSpiderMastermindRPG", 				//Masterminds
				"SpiderMastersparkRPG",	
				
				"MyrkuraRPG", "GeneralRoasterockRPG"															//Special Bosses
			};

			static const string PandemoniaOtherThings[] =
            {
                "SayoriRPG", "Epic2KeenRPG"																		//Other Things
            };

            for (int i = 0; i < PandemoniaMonsters.size(); i++)
            {
                if (e.Thing.GetClassName() == PandemoniaMonsters[i])
                {
                    if (e.Thing.master is "ChaosMonolithRPG")                        
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
