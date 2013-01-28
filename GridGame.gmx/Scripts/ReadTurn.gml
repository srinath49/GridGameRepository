matchID = readbyte();

with(cobj_MatchController.MatchID == matchID)
{
    var action;
    do
    {
        action = readbyte();
        switch(action)
        {
            case MATCH_ACTION_ACTIONSTART:
            case MATCH_ACTION_ACTIONOVER:
                break;
            case MATCH_ACTION_MOVEUNIT:
                {
                    var UnitToMove, Destination, Speed;
                    UnitToMove = real(readstring());
                    Destination = real(readstring());
                    Speed = real(readstring());
                    PerformAction(false, id, MATCH_ACTION_MOVEUNIT, UnitToMove, Destination, Speed);
                }
                break;
            case MATCH_ACTION_ATTACKUNIT:
                {
                    var attacker, defender;
                    attacker = real(readstring());
                    defender = real(readstring());
                    PerformAction(false, id, MATCH_ACTION_ATTACKUNIT, attacker,defender);
                }
                break;
            case MATCH_ACTION_CREATEUNIT:
                {
                    var creationPoint, unitToCreate, unitOwner, destRow, destColumn;
                    destRow = real(readstring());
                    destColumn = real(readstring());
                    unitToCreate = real(readstring());
                    unitOwner = readstring();
                    with(pbobj_pathBlock)
                    {
                        if (row == destRow) && (column == destColumn)
                        {
                            creationPoint = id;
                        }
                    }
                    PerformAction(false, id, MATCH_ACTION_CREATEUNIT, creationPoint, UnitToCreate, unitOwner);
                }
                break;
        }
    }until(action == MATCH_MSG_TURNEND);
    MatchState = MATCH_STATE_MYTURN;
}

