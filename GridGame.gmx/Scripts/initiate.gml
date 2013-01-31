dllinit(false,true,true);
global.socket=tcpconnect("127.0.0.1",56320,1);
//global.socket=tcpconnect("86.184.174.124",56320,1);
if (tcpconnected(global.socket)){
    return true;
}else{
    return false;
}
