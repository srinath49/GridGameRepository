// Login
a = 0;
global.username = get_string("Username" , "");
a = 1;
global.password = get_string("Password" , "");
a = 2;
setnagle(global.socket, false);

//Send Login Details
clearbuffer();
writebyte(1); // 1 = Login
writestring(global.username,true);
writestring(global.password,true);
//send_msg(); Implement this later
sendmessage(global.socket);
a = 3;
//room_goto(rm_mainMenu);
