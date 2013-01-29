newMatch = instance_create(5,5,obj_match);
newMatch.matchID = CreateMatchID();
//show_message("Server::CreateMatch::MatchID::"+string(newMatch.matchID));
newMatch.player1Username = argument0.username;
newMatch.player1Team = argument0.team;
//show_message("Server::CreateMatch::Team1::"+string(argument0.team));
//show_message("Server::CreateMatch::Player1Team::"+string(newMatch.player1Team));
newMatch.player1Socket = argument0.socket;
//show_message("Server::CreateMatch::Player1Socket::"+string(argument0.socket));
newMatch.player1RequestId = argument0.userRequestId;
newMatch.player1UnitList = ds_list_create();

newMatch.player2Username = argument1.username;
newMatch.player2Team = argument1.team;
//show_message("Server::CreateMatch::Team2::"+string(argument1.team));
//show_message("Server::CreateMatch::Player2Team::"+string(newMatch.player2Team));
newMatch.player2Socket = argument1.socket;
//show_message("Server::CreateMatch::Player2Socket::"+string(argument1.socket));
newMatch.player2RequestId = argument1.userRequestId;
newMatch.player2UnitList = ds_list_create();

ds_list_add(global.matchesList, newMatch);
return newMatch;
