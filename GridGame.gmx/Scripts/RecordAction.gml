//RecordAction(controller, action, UnitToMove, Destination, movspeed);
//RecordAction(controller, action, attacker, defender);
//RecordAction(controller, action, creationPoint, unitToCreate, unitOwner);
var controller, action;
controller = argument0;
action = argument1;

with(controller)
{
    //show_message("CurrentAction::"+string(++CurrentAction));

    if(++CurrentAction <= MATCH_ACTIONS_PER_TURN)
    {
        var actionList;
        actionList = ds_list_create();
        ds_list_add(actionList, MATCH_ACTION_ACTIONSTART);
        switch(action)
        {
            case MATCH_ACTION_MOVEUNIT:
                ds_list_add(actionList,MATCH_ACTION_MOVEUNIT);
                ds_list_add(actionList,argument2); //Unit To Move UnitID
                ds_list_add(actionList,argument3); //Destination X
                ds_list_add(actionList,argument4); //Destination Y
                ds_list_add(actionList,argument5); //Movement Speed
                break;
            case MATCH_ACTION_ATTACKUNIT:
                ds_list_add(actionList,MATCH_ACTION_ATTACKUNIT);
                ds_list_add(actionList,argument2); //Attacker
                ds_list_add(actionList,argument3); //Defender
                break;
            case MATCH_ACTION_CREATEUNIT:
                ds_list_add(actionList,MATCH_ACTION_CREATEUNIT);
                ds_list_add(actionList,argument2); //Create Unit at this X
                ds_list_add(actionList,argument3); //Create Unit at this Y
                ds_list_add(actionList,argument4); //Unit to Create
                ds_list_add(actionList,argument5); //Owner of this Unit
                ds_list_add(actionList,argument6); //UnitID of this Unit
                break;
        }
        ds_list_add(actionList, MATCH_ACTION_ACTIONOVER);
        switch(CurrentAction)
        {
            case 1:
                //show_message("Record::Case::1");
                ds_list_copy(MatchEngine.Action1List, actionList);
                break;
            case 2:
                //show_message("Record::Case::2");
                ds_list_copy(MatchEngine.Action2List, actionList);
                break;
            case 3:
                //show_message("Record::Case::3");
                ds_list_copy(MatchEngine.Action3List, actionList);
                break;
            case 4:
                //show_message("Record::Case::4");
                ds_list_copy(MatchEngine.Action4List, actionList);
                break;
        }
        ds_list_clear(actionList);
        ds_list_destroy(actionList);
    }
    else
    {
        CurrentAction = 0;
    }
}
