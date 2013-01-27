match = argument0;

//show_message("Server::ClientCreateMatch::MatchTeam1::"+string(match.player1Team));
//show_message("Server::ClientCreateMatch::MatchTeam2::"+string(match.player2Team));

setnagle(match.player1Socket, false);
clearbuffer();
writebyte(GAME_MATCH_START);
writebyte(match.player1RequestId);
writeshort(match.matchID);
writebyte(match.player1Team);
writebyte(true); // My Turn
writestring(match.player2Username);
writebyte(match.player2Team);
sendmessage(match.player1Socket);

setnagle(match.player2Socket, false);
clearbuffer();
writebyte(GAME_MATCH_START);
writebyte(match.player2RequestId);
writeshort(match.matchID);
writebyte(match.player2Team);
writebyte(false); // My Turn
writestring(match.player1Username);
writebyte(match.player1Team);
sendmessage(match.player2Socket);

