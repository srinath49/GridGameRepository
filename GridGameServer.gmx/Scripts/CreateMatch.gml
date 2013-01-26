newMatch = instance_create(5,5,obj_match);
newMatch.matchID = CreateMatchID();

newMatch.player1Username = argument0.username;
newMatch.player1Team = argument0.team;
newMatch.player1Socket = argument0.socket;
newMatch.player1UnitList = ds_list_create();

newMatch.player2Username = argument1.username;
newMatch.player2Team = argument1.team;
newMatch.player2Socket = argument1.socket;
newMatch.player2UnitList = ds_list_create();

ds_list_add(global.matchesList, newMatch);
return newMatch;
