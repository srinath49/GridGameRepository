var myAction, action;
myAction = argument0;
action = argument1;
controller = argument2;

if(MyAction)
{
    global.InAction = true;
    controller.MatchState = MATCH_STATE_INACTION;
}

switch(action)
{
    case MATCH_ACTION_MOVEUNIT:
        {   
            //================================================================================================//
            var CurrentObject;
            var UnitToMove;
            var Destination;
            var xx, yy, movspeed;
            UnitToMove = argument3;
            Destination = argument4;
            xx = Destination.x;
            yy = Destination.y;
            movspeed = argument5;
            CurrentObject = instance_position(UnitToMove.x,UnitToMove.y,pbobj_pathBlock);
            MoveUnit(UnitToMove,xx,yy,movspeed);
            //show_message(CurrentObject.IsOccupied);
            CurrentObject.IsOccupied = false;
            //show_message(CurrentObject.IsOccupied);
            Destination.IsOccupied = true;
            //================================================================================================//
            if(myAction)
            {
                RecordAction(controller, action, UnitToMove, Destination, movspeed);
            }
            //================================================================================================//
        }
        break;
    case MATCH_ACTION_ATTACKUNIT:
        {
            //================================================================================================//
            var attacker, defender;
            attacker = argument3;
            defender = argument4;
            AttackEnemyUnit(attacker, defender);
            //================================================================================================//
            if(myAction)
            {
                RecordAction(controller, action, attacker, defender);
            }
            //================================================================================================//
        }
        break;
    
    case MATCH_ACTION_CREATEUNIT:
        {
            //================================================================================================//
            var creationPoint, unitToCreate, unitOwner;
            creationPoint = argument3;
            unitToCreate = argument4;
            unitOwner = argument5;
            UnitSpawner(creationPoint.x, creationPoint.y, unitToCreate, unitOwner);
            //================================================================================================//
            if(myAction)
            {
                RecordAction(controller, action, creationPoint, unitToCreate, unitOwner);
            }
            //================================================================================================//
        }
        break;
}
