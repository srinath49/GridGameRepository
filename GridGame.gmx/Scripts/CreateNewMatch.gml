requestId = readbyte();
mID = readbyte();
Team = readbyte();
MyTurn = readbyte();
opponent = readstring();
opponentTeam = readbyte();

if(instance_number(mobj_matchRequest) > 0)
{
    with(mobj_matchRequest)
    {
        if(requestId == other.requestId)
        {
            newMatch = instance_create(0,0,mobj_newMatch);
            newMatch.matchID = other.mID;
            newMatch.Team = other.Team;
            newMatch.MyTurn = other.MyTurn;
            newMatch.opponent = other.opponent;
            newMatch.opponentTeam = other.opponentTeam;
            
            if(newMatch.Team != team)
            {
                newMatch.Team = team;
                show_message(global.username+"::CreateNewMatch::RequestTeam::"+string(team));
                show_message(global.username+"::CreateNewMatch::Team::"+string(newMatch.Team));
            }
            deleteMe = true;
            ds_list_add(global.NewMatchList, newMatch);
            return newMatch.matchID;
        }
    }
}
return -1;
