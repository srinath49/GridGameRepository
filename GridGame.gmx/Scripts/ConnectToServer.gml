if(initiate()){
    //instance_change(obj_login,1);
    room_goto(rm_login);
}else{
    if (show_question("We coudn't connect to the server, want to retry?")==true){
        die();
        game_restart();
    }else{
        die();
        game_end();
    }
}
