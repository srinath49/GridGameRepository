mid = argument0;
matchController = instance_create(0,0,cobj_MatchController);
matchController.MatchID = mid;
for(i=0;i<ds_list_size(global.NewMatchList);i++)
{
    match = ds_list_find_value(global.NewMatchList, i);
    if(match.matchID == mid)
    {
        var mymatch;
        //show_message("StartNewMatch::Match::MatchID::"+string(match.matchID));
        matchController.MyTurn = match.MyTurn;
        matchController.MatchState = MATCH_STATE_NEW;
        matchController.Team = match.Team;
        matchController.Opponent = match.opponent;
        matchController.Match = match;
        mymatch = matchController.Match;
        //show_message("StartNewMatch::Controller::Match::MatchID::"+string(mymatch.matchID));
        ds_list_add(global.MyMatchList, match);
        ds_list_delete(global.NewMatchList, i);
        break;
    }
}
