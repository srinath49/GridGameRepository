var myAction, action, controller;
myAction = argument0;
controller = argument1;
action = argument2;

global.InAction = true;
if(myAction)
{
    if(controller.ActionsLeft <= 0)
    {
        controller.ActionsLeft = 0;
        controller.MatchState = MATCH_STATE_WAIT;
        return noone;
    }
    controller.MatchState = MATCH_STATE_INACTION;
}
else
{
    controller.MatchState = MATCH_STATE_INENEMYACTION;
}

switch(action)
{
    case MATCH_ACTION_MOVEUNIT:
        {   
            //=====================================================================================================//
            var CurrentObject;
            var UnitToMove, uid;
            var xx, yy, movspeed;
            var match;
            uid = argument3;
            xx = argument4;
            yy = argument5;
            movspeed = argument6;
            UnitToMove = noone;
            CurrentObject = noone;
            match = controller.Match;
            for(i=0;i<ds_list_size(match.MyUnitIDs);i++)
            {
                if(uid == ds_list_find_value(match.MyUnitIDs, i))
                {
                    with(uobj_unit)
                    {
                        //show_message("WithUnit::UID::"+string(uid));
                        //show_message("WithUnit::UnitID::"+string(UnitID));
                        if(real(UnitID) == real(uid))
                        {
                            //show_message("WithUnit::Hello");
                            UnitToMove = id;
                        }
                    }
                    break;
                }
            }
            if(UnitToMove != noone)
            {
                CurrentObject = instance_position(UnitToMove.x,UnitToMove.y,pbobj_pathBlock);
                MoveUnit(UnitToMove,xx,yy,movspeed);
                CurrentObject.IsOccupied = false;
                CurrentObject = instance_position(xx,yy,pbobj_pathBlock);
                CurrentObject.IsOccupied = true;
                //================================================================================================//
                if(myAction)
                {
                    RecordAction(controller, action, uid, xx, yy, movspeed);
                }
                //================================================================================================//
            }
            //====================================================================================================//
        }
        break;
    case MATCH_ACTION_ATTACKUNIT:
        {
            //====================================================================================================//
            var attacker, defender;
            attacker = argument3;
            defender = argument4;
            AttackEnemyUnit(attacker, defender);
            //====================================================================================================//
            if(myAction)
            {
                RecordAction(controller, action, attacker.UnitID, defender.UnitID);
            }
            //====================================================================================================//
        }
        break;
    
    case MATCH_ACTION_CREATEUNIT:
        {
            //====================================================================================================//
            var creationPoint, unitToCreate, unitOwner, unitID, createdUnit;
            creationPointX = argument3;
            creationPointY = argument4;
            unitToCreate = argument5;
            unitOwner = argument6;
            unitID = argument7;
            createdUnit = UnitSpawner(creationPointX, creationPointY, unitToCreate, unitOwner, unitID);
            createdUnit.RightFacing = controller.RightFacing;
            with(createdUnit)
            {
                if(!RightFacing)
                {
                    //===================Sprites=================//
                    CreatedSprite = LCreated;
                    StillSprite = LStill;
                    IdleSprite = LIdle;
                    InRangeSprite = LInRange;
                    ForwardMoveSprite = LForwardMove
                    BackMoveSprite = LBackMove
                    ForwardAttackSprite = LForwardAttack;
                    BackAttackSprite = LBackAttack;
                    TakeHitSprite = LTakeHit;
                    DieSprite = LDie;
                    DeadSprite = LDead;
                    //===================Sprites=================//
                }
            }
            //====================================================================================================//
            if(myAction)
            {
                RecordAction(controller, action, creationPointX, creationPointY, unitToCreate, unitOwner, unitID);
            }
            //====================================================================================================//
        }
        break;
}
