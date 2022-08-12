// Sings Zscript (Many thanks JSO_x for help))

class OutpostSignMissionBBS2: Actor {
	bool dynlight;

    Default	{
	Radius 16;
	Height 16;
	+SpawnCeiling;
    +NoGravity;
    +WALLSPRITE;
	}

    override void Tick() {

Super.Tick(); // Specifically here this call is not necessary and in general will slow down a little bit, but the bad habits of the lack of treatment of the parent method do not want to instill in anyone.

bool isVisibleToAnyPlayer = false;

for ( int i = 0; i < MAXPLAYERS; i++ ) {
    PlayerInfo pl = players[ i ];
	
    if ( !playeringame[ i ] || !pl || !pl.mo )
        continue;
		
	//if ( ( pl.MovingCamera && pl.MovingCamera.CheckSight( self ) ) || pl.mo.CheckSight( self ) )

    if ( pl.mo.CheckSight( self ) ) {
        isVisibleToAnyPlayer = true;
        break;
    }
}

if ( isVisibleToAnyPlayer ) {
    if ( !dynlight ) {
        SetStateLabel( "SpawnDL" );
        dynlight = true;
    }
} else if ( dynlight ) {
        SetStateLabel( "SpawnNoDL" );
    dynlight = false;
}

    }
    States {
	Spawn:
		OMRK A 0;
	SpawnNoDL:
        OMRK A -1;
        Stop;
      SpawnDL:
        OMRK A -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignShopS2: OutpostSignMissionBBS2 {

    Default	{
	+SpawnCeiling;
    +NoGravity;
    +WALLSPRITE;
	Scale 1.5;
	Radius 16;
	Height 16;
	}

    States {
	Spawn:
		OMRK B 0;
	 SpawnNoDL:
        OMRK B -1;
        Stop;
       SpawnDL:
        OMRK B -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignTransporter2: OutpostSignMissionBBS2 {

    Default	{
	+SpawnCeiling;
    +NoGravity;
    +WALLSPRITE;
	Scale 0.5;
	Radius 16;
	Height 16;
	}

    States {
	Spawn:
		OMRK C 0;
    SpawnNoDL:
        OMRK C -1;
        Stop;
      SpawnDL:
        OMRK C -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignSkillComputer2: OutpostSignMissionBBS2 {

    States {
	Spawn:
		OMRK D 0;
    SpawnNoDL:
        OMRK D -1;
        Stop;
      SpawnDL:
        OMRK D -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignRechargePads2: OutpostSignMissionBBS2 {

    States {
	Spawn:
		OMRK G 0;
    SpawnNoDL:
        OMRK G -1;
        Stop;
      SpawnDL:
        OMRK G -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignEastArea2: OutpostSignMissionBBS2 {

    States {
	Spawn:
		OMRK F 0;
    SpawnNoDL:
        OMRK F -1;
        Stop;
      SpawnDL:
        OMRK F -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignItemRoulette2: OutpostSignMissionBBS2 {

    States {
	Spawn:
		OMRK H 0;
    SpawnNoDL:
        OMRK H -1;
        Stop;
      SpawnDL:
        OMRK H -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignArena2: OutpostSignMissionBBS2 {

    States {
	Spawn:
		OMRK E 0;
    SpawnNoDL:
        OMRK E -1;
        Stop;
      SpawnDL:
        OMRK E -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignArenaFar2: OutpostSignMissionBBS2 {

    States {
	Spawn:
		OMRK E 0;
    SpawnNoDL:
        OMRK E -1;
        Stop;
      SpawnDL:
        OMRK E -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignArenaWS2: OutpostSignMissionBBS2 {

    Default	{
	+SpawnCeiling;
    +NoGravity;
    +WALLSPRITE;
	Scale 0.5;
	Radius 16;
	Height 16;
	}

    States {
	Spawn:
		OMRK I 0;
    SpawnNoDL:
        OMRK I -1;
        Stop;
      SpawnDL:
        OMRK I -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignArenaStart2: OutpostSignMissionBBS2 {

    States {
	Spawn:
		OMRK J 0;
    SpawnNoDL:
        OMRK J -1;
        Stop;
      SpawnDL:
        OMRK J -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignArenaReady2: OutpostSignMissionBBS2 {

    Default	{
	+SpawnCeiling;
    +NoGravity;
    +WALLSPRITE;
	Scale 0.5;
	Radius 16;
	Height 16;
	}

    States {
	Spawn:
		OMRK K 0;
    SpawnNoDL:
        OMRK K -1;
        Stop;
      SpawnDL:
        OMRK K -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignShootingRange2: OutpostSignMissionBBS2 {

    Default	{
	+SpawnCeiling;
    +NoGravity;
    +WALLSPRITE;
	Scale 0.5;
	Radius 16;
	Height 16;
	}

    States {
	Spawn:
		OMRK M 0;
    SpawnNoDL:
        OMRK M -1;
        Stop;
      SpawnDL:
        OMRK M -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignSale2: OutpostSignMissionBBS2 {

    Default	{
	+SpawnCeiling;
    +NoGravity;
    +WALLSPRITE;
	Scale 0.5;
	Radius 16;
	Height 16;
	}

    States {
	Spawn:
		OMRK N 0;
    SpawnNoDL:
        OMRK N -1;
        Stop;
      SpawnDL:
        OMRK N -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignSurgeonCapsule2: OutpostSignMissionBBS2 {

    Default	{
	+SpawnCeiling;
    +NoGravity;
    +WALLSPRITE;
	Scale 0.5;
	Radius 16;
	Height 16;
	}

    States {
	Spawn:
		OMRK O 0;
    SpawnNoDL:
        OMRK O -1;
        Stop;
      SpawnDL:
        OMRK O -1 Light("OUTPOSTSIGN");
        Stop;
    }
}

class OutpostSignDisassemblingDevice2: OutpostSignMissionBBS2 {

    Default	{
	+SpawnCeiling;
    +NoGravity;
    +WALLSPRITE;
	Scale 0.5;
	Radius 16;
	Height 16;
	}

    States {
	Spawn:
		OMRK P 0;
    SpawnNoDL:
        OMRK P -1;
        Stop;
      SpawnDL:
        OMRK P -1 Light("OUTPOSTSIGN");
        Stop;
    }
}