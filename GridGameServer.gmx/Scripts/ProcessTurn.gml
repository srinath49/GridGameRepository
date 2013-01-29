//===================================================================//
var matchId;
var Action1List;
var Action2List;
var Action3List;
var Action4List;
var sender;
var receiver;
//===================================================================//
matchId = readshort();
sender = readstring();
Action1List = ds_list_create();
Action2List = ds_list_create();
Action3List = ds_list_create();
Action4List = ds_list_create();
receiver = -1;
//show_message("Server::ProcessTurn::MatchID::"+string(matchId));
//===================================================================//
for(i=0;i<ds_list_size(global.matchesList);i++)
{
    with(ds_list_find_value(global.matchesList, i))
    {
        if(matchID == matchId)
        {
            if(sender == player1Username)
            {
                receiver = player2Socket;
            }
            else
            {
                receiver = player1Socket;
            }
            break;
        }
    }
}
//show_message("Server::ProcessTurn::Socket::"+string(receiver));
//===================================================================//
{ 
    var action;
    do
    {
        var currentActionList;
        action = readstring();
        currentActionList = ds_list_create();
        //show_message("Server::ProcessTurn::ReadAction::"+action);
        while(action != string(MATCH_MSG_TURNEND))
        {
            ds_list_add(currentActionList, action);
            
            if(action == string(MATCH_ACTION_ACTIONOVER))
            {
                break;
            }
            action = readstring();
        }
        if(action != string(MATCH_MSG_TURNEND))
        {
            if(ds_list_empty(Action1List))
            {   
                ds_list_copy(Action1List, currentActionList);
            }
            else if(ds_list_empty(Action2List))
            {
                ds_list_copy(Action2List, currentActionList);
            }
            else if(ds_list_empty(Action3List))
            {
                ds_list_copy(Action3List, currentActionList);
            }
            else if(ds_list_empty(Action4List))
            {
                ds_list_copy(Action4List, currentActionList);
            }
            else
            {
                //Reserve case for future if we increase number of actions per turn.
            }
        }
        ds_list_clear(currentActionList);
        ds_list_destroy(currentActionList);
    }until(action == string(MATCH_MSG_TURNEND));
}
//===================================================================//
{
    //show_message("Server::ProcessTurn::SendingToSocket::"+string(receiver));
    if(receiver != -1)
    {
        setnagle(receiver, false);
        clearbuffer();
        writebyte(MATCH_MSG_TURNSUBMIT);
        writeshort(matchId);
        for(i=1;i<=MATCH_ACTIONS_PER_TURN; i++)
        {
            var actionList;
            actionList = ds_list_create();
            switch(i)
            {
                case 1:
                    ds_list_copy(actionList, Action1List);
                    break;
                case 2:
                    ds_list_copy(actionList, Action2List);
                    break;
                case 3:
                    ds_list_copy(actionList, Action3List);
                    break;
                case 4:
                    ds_list_copy(actionList, Action4List);
                    break;
            }
    
            if(ds_list_empty(actionList))
            {
                continue;
            }
            
            for(j=0; j<ds_list_size(actionList); j++)
            {
                writestring(ds_list_find_value(actionList, j));
            }
            ds_list_clear(actionList);
            ds_list_destroy(actionList);
        }
        writestring(string(MATCH_MSG_TURNEND));
        //show_message("Server::SendSize::"+string(sendmessage(receiver)));
        sendmessage(receiver);
    }
}
ds_list_clear(Action1List);
ds_list_destroy(Action1List);
ds_list_clear(Action2List);
ds_list_destroy(Action2List);
ds_list_clear(Action3List);
ds_list_destroy(Action3List);
ds_list_clear(Action4List);
ds_list_destroy(Action4List);
//===================================================================//
