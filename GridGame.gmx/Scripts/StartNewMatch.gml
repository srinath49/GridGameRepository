mid = argument0;
matchController = instance_create(0,0,cobj_MatchController);
matchController.MatchID = mid;
for(i=0;i<ds_list_size(global.NewMatchList);i++)
{
    match = ds_list_find_value(global.NewMatchList, i);
    if(match.matchID == mid)
    {
        matchController.MyTurn = match.MyTurn;
        matchController.MatchState = MATCH_STATE_NEW;
        matchController.Team = match.Team;
        //show_message(global.username+"::StartNewMatch::Team::"+string(match.Team));
        //show_message(global.username+"::StartNewMatch::ControllerTeam::"+string(matchController.Team));
        ds_list_delete(global.NewMatchList, i);
        ds_list_add(global.MyMatchList, match);
        break;
    }
}
