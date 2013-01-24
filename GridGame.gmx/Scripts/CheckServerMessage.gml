///Check if we have a new message and if the client is still connected
var size;
//Retrieve the amount of bytes that the buffer currently has
size=receivemessage(global.socket);
//If the amount of bytes is less than 0 exit, meaning that we don't have a new message
if (size<0)
{
    exit;
}
//If the amount of bytes is higher than 0 go and process the package, meaning that we have a new message
if (size>0)
{
    //messageString = "Client : size = " + string(size); 
    //show_message(messageString);
    matchMessage = readbyte();
    switch(matchMessage)
    {
        case MATCH_MSG_MYTURN:
            MatchState = MATCH_STATE_MYTURN;
            global.MyTurn = true;
            global.ActionsLeft = 4;
            break;
        case MATCH_MSG_ENEMYACTION;
            MatchState = MATCH_STATE_ENEMYACTION;
            break;
        case MATCH_MSG_WON;
            break;
        case MATCH_MSG_LOST;
            break;
    }
}
if (size=0)
{
}
