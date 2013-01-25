match = argument0;

setnagle(match.player1.socket, false);
clearbuffer();
writebyte(GAME_MATCH_START);
writeshort(match.matchID);
writebyte(match.player1Team);
writebyte(true); // My Turn
writestring(match.player2.username);
writebyte(match.player2Team);
sendmessage(match.player1.socket);

setnagle(match.player2.socket, false);
clearbuffer();
writebyte(GAME_MATCH_START);
writeshort(match.matchID);
writebyte(match.player2Team);
writebyte(false); // My Turn
writestring(match.player1.username);
writebyte(match.player1Team);
sendmessage(match.player2.socket);
