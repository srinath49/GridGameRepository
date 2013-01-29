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
    var action;
    var index = 1;
    MatchState = MATCH_STATE_RECEIVETURNINFO;
    do
    {
        action = readstring();
        switch(index)
        {
            case 1:
                ds_list_add(MatchEngine.Action1List, action);
                if(action == string(MATCH_ACTION_ACTIONOVER))
                {
                    //show_message("RECEIVETURN::Case::1");
                    index++;
                }
                break;
            case 2:
                ds_list_add(MatchEngine.Action2List, action);
                if(action == string(MATCH_ACTION_ACTIONOVER))
                {
                    //show_message("RECEIVETURN::Case::2");
                    index++;
                }
                break;
            case 3:
                ds_list_add(MatchEngine.Action3List, action);
                if(action == string(MATCH_ACTION_ACTIONOVER))
                {
                    //show_message("RECEIVETURN::Case::3");
                    index++;
                }
                break;
            case 4:
                if(action == string(MATCH_MSG_TURNEND))
                {
                    //show_message("RECEIVETURN::Case::4::2");
                    break;
                }
                ds_list_add(MatchEngine.Action4List, action);
                if(action == string(MATCH_ACTION_ACTIONOVER))
                {
                    //show_message("RECEIVETURN::Case::4::1");
                    index++;
                }
                break;
        }
    }until(action == string(MATCH_MSG_TURNEND));
    MatchState = MATCH_STATE_WAIT;
    ProcessNextTurn(id);
}

