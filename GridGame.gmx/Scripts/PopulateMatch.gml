new = argument0;
controller = argument1;

switch(controller.Team)
{
    case GAME_TEAM_STARKS:
        with(uiobj_UI)
        {
            if(Team == GAME_TEAM_STARKS)
            {
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
        break;
    case GAME_TEAM_LANNISTER:
        with(uiobj_UI)
        {
            if(Team == GAME_TEAM_LANNISTER)
            {
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
        break;
    case GAME_TEAM_TARGARYEN:
        break;
    case GAME_TEAM_GREYJOY:
        break;
    case GAME_TEAM_BARATHEON:
        break;
    case GAME_TEAM_ARRYN:
        break;
    case GAME_TEAM_TYRELL:
        break;
    case GAME_TEAM_MARTELL:
        break;
}
