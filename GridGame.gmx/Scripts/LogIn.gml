// Login
global.username = get_string("Username" , "");
global.password = get_string("Password" , "");

setnagle(global.socket, false);

//Send Login Details
clearbuffer();
writebyte(1); // 1 = Login
writestring(global.username,true);
writestring(global.password,true);
//send_msg(); Implement this later
sendmessage(global.socket);

//room_goto(rm_mainMenu);
