var controller;
controller = argument0;
//=========================================================================//
setnagle(global.socket, false);
clearbuffer();
writebyte(MATCH_MSG_TURNSUBMIT);
writebyte(controller.MatchID);
for(i=0;i<ds_list_size(controller.ActionsList); i++)
{
    var actionlist;
    actionlist = ds_list_find_value(controller.ActionsList, i);
    if(ds_list_empty(actionList))
    {
        continue;
    }
    
    for(j=0; j<ds_list_size(actionList); j++)
    {
        writestring(string(ds_list_find_value(actionList, l)));
    }
}
writebyte(MATCH_MSG_TURNEND);
sendmessage(global.socket);
//=========================================================================//
for(i=0;i<ds_list_size(controller.ActionsList); i++)
{
    var actionlist;
    actionlist = ds_list_find_value(controller.ActionsList, i);
    ds_list_clear(actionList);
}
//=========================================================================//
