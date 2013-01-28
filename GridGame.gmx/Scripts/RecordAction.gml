//RecordAction(controller, action, UnitToMove, Destination, movspeed);
//RecordAction(controller, action, attacker, defender);
//RecordAction(controller, action, creationPoint, unitToCreate, unitOwner);
var controller, action;
controller = argument0;
action = argument1;

if(++controller.CurrentAction <= MATCH_ACTIONS_PER_TURN)
{
    var actionList;
    var sourceList;
    sourceList = ds_list_find_index(controller.ActionsList, CurrentAction);
    ds_list_copy(actionList, sourceList);
    ds_list_add(actionList, MATCH_ACTION_ACTIONSTART);
    switch(action)
    {
        case MATCH_ACTION_MOVEUNIT:
            ds_list_add(actionList,argument2); //Unit To Move
            ds_list_add(actionList,argument3); //Destination
            ds_list_add(actionList,argument4); //Movement Speed
            break;
        case MATCH_ACTION_ATTACKUNIT:
            ds_list_add(actionList,argument2); //Attacker
            ds_list_add(actionList,argument3); //Defender
            break;
        case MATCH_ACTION_CREATEUNIT:
            ds_list_add(actionList,argument2.row); //Create Unit at this Row
            ds_list_add(actionList,argument2.column); //Create Unit at this Column
            ds_list_add(actionList,argument3); //Unit to Create
            ds_list_add(actionList,argument4); //Owner of this Unit
            break;
    }
    ds_list_add(actionList, MATCH_ACTION_ACTIONOVER);
}
else
{
    controller.CurrentAction = 0;
}
