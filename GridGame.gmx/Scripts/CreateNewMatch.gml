newMatch = instance_create(0,0,mobj_newMatch);
newMatch.matchID = readbyte();
newMatch.Team = readbyte();
newMatch.MyTurn = readbyte();
newMatch.opponent = readstring();
newMatch.opponentTeam = readbyte();

ds_list_add(global.NewMatchList, newMatch);
return newMatch.matchID;
