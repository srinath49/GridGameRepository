var controller, matchId;
controller = argument0;
matchId = controller.Match;
show_message("ReadNextTurn::Hello");
with(controller)
{
    var action;
    do
    {
        action = real(readstring());
        switch(action)
        {
            case MATCH_ACTION_ACTIONSTART:
                show_message("ReadNextTurn::ACTIONSTAR::"+string(++(global.actionCount)));
                break;
            case MATCH_ACTION_ACTIONOVER:
                show_message("ReadNextTurn::ACTIONOVER::"+string(global.actionCount));
                break;
            case MATCH_ACTION_MOVEUNIT:
                //show_message("Client::ReadNextTurn::MoveUnit");
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
                //show_message("Client::ReadNextTurn::AttackUnit");
                {
                    var attacker, defender;
                    attacker = real(readstring());
                    defender = real(readstring());
                    PerformAction(false, id, MATCH_ACTION_ATTACKUNIT, attacker,defender);
                }
                break;
            case MATCH_ACTION_CREATEUNIT:
                //show_message("Client::ReadNextTurnCreateUnit");
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
    }until(action == MATCH_ACTION_ACTIONOVER) || (action == MATCH_MSG_TURNEND);
    if(action == MATCH_MSG_TURNEND)
    {
        MatchState = MATCH_STATE_MYTURN;
    }
}

