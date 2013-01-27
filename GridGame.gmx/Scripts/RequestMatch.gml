//show_message(global.username+"::RequestMatch::Team::"+string(global.NewMatchTeam));
setnagle(global.socket, false);
clearbuffer();
writebyte(GAME_MATCH_REQUEST);
writebyte(global.NewMatchTeam);
sendmessage(global.socket);
