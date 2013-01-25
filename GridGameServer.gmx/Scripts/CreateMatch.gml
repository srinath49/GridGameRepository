newMatch = instance_create(5,5,obj_match);
newMatch.matchID = CreateMatchID();
newMatch.player1 = argument0.player;
newMatch.player1Team = argument0.team;
newMatch.player2 = argument1.player;
newMatch.player2Team = argument1.team;
newMatch.player1UnitList = ds_list_create();
newMatch.player2UnitList = ds_list_create();

ds_list_add(global.matchesList, newMatch);
