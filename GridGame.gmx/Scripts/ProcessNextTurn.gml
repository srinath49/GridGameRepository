var controller, matchId;
controller = argument0;
matchId = controller.Match;
//show_message("ProcessNextTurn::Hello");
with(controller)
{
    if(++CurrentAction <= MATCH_ACTIONS_PER_TURN)
    {
        var processList, action, index;
        processList = ds_list_create();
        switch(CurrentAction)
        {
            case 1:
                ds_list_copy(processList, MatchEngine.Action1List);
                break;
            case 2:
                ds_list_copy(processList, MatchEngine.Action2List);
                break;
            case 3:
                ds_list_copy(processList, MatchEngine.Action3List);
                break;
            case 4:
                ds_list_copy(processList, MatchEngine.Action4List);
                break;
        }
        index = 0;
        do
        {
            action = ds_list_find_value(processList, index++);
            switch(real(action))
            {
                case MATCH_ACTION_ACTIONSTART:
                    //show_message("ProcessNextTurn::ACTIONSTART::"+string(CurrentAction));
                    break;
                case MATCH_ACTION_ACTIONOVER:
                    //show_message("ProcessNextTurn::ACTIONOVER::"+string(CurrentAction));
                    break;
                case MATCH_ACTION_MOVEUNIT:
                    //show_message("Client::ReadNextTurn::MoveUnit");
                    {
                        var UnitToMoveID, Destination, Speed;
                        UnitToMoveID = real(ds_list_find_value(processList, index++));
                        DestinationX = real(ds_list_find_value(processList, index++));
                        DestinationY = real(ds_list_find_value(processList, index++));
                        Speed = real(ds_list_find_value(processList, index++));
                        PerformAction(false, id, MATCH_ACTION_MOVEUNIT, UnitToMoveID, DestinationX, DestinationY, Speed);
                    }
                    break;
                case MATCH_ACTION_ATTACKUNIT:
                    //show_message("Client::ReadNextTurn::AttackUnit");
                    {
                        var attacker, defender, attackerID, defenderID;
                        attackerID = real(ds_list_find_value(processList, index++));
                        defenderID = real(ds_list_find_value(processList, index++));
                        with(uobj_unit)
                        {
                            if(UnitID == attackerID)
                            {
                                attacker = id;
                            }
                            else if(UnitID == defenderID)
                            {
                                defender = id;
                            }
                        }
                        PerformAction(false, id, MATCH_ACTION_ATTACKUNIT, attacker,defender);
                    }
                    break;
                case MATCH_ACTION_CREATEUNIT:
                    //show_message("Client::ReadNextTurnCreateUnit");
                    {
                        var unitToCreate, unitOwner, createX, createY, match;
                        createX = real(ds_list_find_value(processList, index++));
                        createY = real(ds_list_find_value(processList, index++));
                        unitToCreate = real(ds_list_find_value(processList, index++));
                        unitOwner = ds_list_find_value(processList, index++);
                        unitID = real(ds_list_find_value(processList, index++));
                        PerformAction(false, id, MATCH_ACTION_CREATEUNIT, createX, createY, unitToCreate, unitOwner, unitID);
                        AddUnitID(id, unitID);
                    }
                    break;
            }
        }until(real(action) == MATCH_ACTION_ACTIONOVER);
        ds_list_clear(processList);
        ds_list_destroy(processList);
    }
    else
    {
        MatchState = MATCH_STATE_MYTURN;
    }
}

