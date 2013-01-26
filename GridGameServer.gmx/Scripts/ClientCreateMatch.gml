match = argument0;

setnagle(match.player1Socket, false);
clearbuffer();
writebyte(GAME_MATCH_START);
writeshort(match.matchID);
writebyte(match.player1Team);
writebyte(true); // My Turn
writestring(match.player2Username);
writebyte(match.player2Team);
sendmessage(match.player1Socket);

setnagle(match.player2Socket, false);
clearbuffer();
writebyte(GAME_MATCH_START);
writeshort(match.matchID);
writebyte(match.player2Team);
writebyte(false); // My Turn
writestring(match.player1Username);
writebyte(match.player1Team);
sendmessage(match.player2Socket);

