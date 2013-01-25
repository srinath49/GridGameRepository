//show_message("Client::Script::RequestMatch");
setnagle(global.socket, false);
clearbuffer();
writebyte(GAME_MATCH_REQUEST);
writebyte(global.NewMatchTeam);
sendmessage(global.socket);
