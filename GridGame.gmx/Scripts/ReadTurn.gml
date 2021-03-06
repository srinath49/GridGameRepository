var controller, matchId;
//show_message(global.username+"::ReadTurn::Hi");
matchId = readshort();
//show_message(global.username+"::MatchID::"+string(matchId));
controller = noone;

with(cobj_MatchController/*.MatchID == matchID*/)
{
    //show_message(global.username+"::ReadTurn::Controller::MatchID::"+string(MatchID));
    if(MatchID == matchId)
    {
        controller = id;
        //show_message(global.username+"::ReadTurn::ControllerFound::MatchID::"+string(controller.MatchID));
    }
}

if(controller == noone)
{
    //show_message(global.username+"::ReadTurn::NoController");
    return false;
}

with(controller)
{
    //show_message(global.username+"::ReadTurn::WithController::MatchID::"+string(MatchID));
    var action;
    do
    {
        action = real(readstring());
        show_message("Client::ReadTurn::ActionNumber::"+string(action));
        switch(action)
        {
            case MATCH_ACTION_ACTIONSTART:
            case MATCH_ACTION_ACTIONOVER:
                break;
            case MATCH_ACTION_MOVEUNIT:
                show_message("Client::ReadTurn::ActionName::MoveUnit");
                {
                    var UnitToMoveID, Destination, Speed;
                    UnitToMoveID = real(readstring());
                    DestinationX = real(readstring());
                    DestinationY = real(readstring());
                    Speed = real(readstring());
                    PerformAction(false, id, MATCH_ACTION_MOVEUNIT, UnitToMoveID, DestinationX, DestinationY, Speed);
                }
                break;
            case MATCH_ACTION_ATTACKUNIT:
                show_message("Client::ReadTurn::ActionName::AttackUnit");
                {
                    var attacker, defender;
                    attacker = real(readstring());
                    defender = real(readstring());
                    PerformAction(false, id, MATCH_ACTION_ATTACKUNIT, attacker,defender);
                }
                break;
            case MATCH_ACTION_CREATEUNIT:
                show_message("Client::ReadTurn::ActionName::CreateUnit");
                {
                    var unitToCreate, unitOwner, createX, createY, match;
                    createX = real(readstring());
                    createY = real(readstring());
                    unitToCreate = real(readstring());
                    unitOwner = readstring();
                    unitID = readstring();
                    PerformAction(false, id, MATCH_ACTION_CREATEUNIT, createX, createY, unitToCreate, unitOwner, unitID);
                    AddUnitID(id, unitID);
                }
                break;
        }
    }until(action == MATCH_MSG_TURNEND);
    MatchState = MATCH_STATE_MYTURN;
}

