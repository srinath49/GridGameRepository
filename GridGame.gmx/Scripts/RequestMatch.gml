request = instance_create(0,0,mobj_matchRequest);
request.requestId = GetRequestId();
//show_message(global.username+"::RequestMatch::Team::"+string(global.NewMatchTeam));
request.team = global.NewMatchTeam;
ds_list_add(global.NewMatchRequest, request);
//show_message(global.username+"::RequestMatch::RequestTeam::"+string(request.team));
setnagle(global.socket, false);
clearbuffer();
writebyte(GAME_MATCH_REQUEST);
writebyte(request.team);
writebyte(request.requestId);
SendMsg(global.socket);

