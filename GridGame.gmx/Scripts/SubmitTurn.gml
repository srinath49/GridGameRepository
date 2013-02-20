var controller;
var actionList;
controller = argument0;
actionList = ds_list_create();
//=========================================================================//
for(i=1;i<=MATCH_ACTIONS_PER_TURN; i++)
{
    switch(i)
    {
        case 1:
            for(j=0;j<ds_list_size(controller.MatchEngine.Action1List); j++)
            {
                ds_list_add(actionList, ds_list_find_value(controller.MatchEngine.Action1List, j));
            }
            //show_message("Submit::Case::1::"+string(ds_list_find_value(controller.MatchEngine.Action1List, j-1)));
            break;
        case 2:
            for(j=0;j<ds_list_size(controller.MatchEngine.Action2List); j++)
            {
                ds_list_add(actionList, ds_list_find_value(controller.MatchEngine.Action2List, j));
            }
            //show_message("Submit::Case::2::"+string(ds_list_find_value(controller.MatchEngine.Action2List, j-1)));
            break;
        case 3:
            for(j=0;j<ds_list_size(controller.MatchEngine.Action3List); j++)
            {
                ds_list_add(actionList, ds_list_find_value(controller.MatchEngine.Action3List, j));
            }
            //show_message("Submit::Case::3::"+string(ds_list_find_value(controller.MatchEngine.Action3List, j-1)));
            break;
        case 4:
            for(j=0;j<ds_list_size(controller.MatchEngine.Action4List); j++)
            {
                ds_list_add(actionList, ds_list_find_value(controller.MatchEngine.Action4List, j));
            }
            //show_message("Submit::Case::4::"+string(ds_list_find_value(controller.MatchEngine.Action4List, j-1)));
            break;
    }
}
//=========================================================================//
setnagle(global.socket, false);
clearbuffer();
writebyte(MATCH_MSG_TURNSUBMIT);
writeshort(controller.MatchID);
writestring(global.username);
for(j=0; j<ds_list_size(actionList); j++)
{
    //var value;
    //value = string(ds_list_find_value(actionList, j));
    //show_message("Client::SubmitTurn::Action::"+value);
    writestring(string(ds_list_find_value(actionList, j)));
}
writestring(string(MATCH_MSG_TURNEND));
SendMsg(global.socket);
//=========================================================================//
ds_list_clear(controller.MatchEngine.Action1List);
ds_list_clear(controller.MatchEngine.Action2List);
ds_list_clear(controller.MatchEngine.Action3List);
ds_list_clear(controller.MatchEngine.Action4List);
ds_list_clear(actionList);
ds_list_destroy(actionList);
clearbuffer();
//=========================================================================//
