new = argument0; // Is New Match?
controller = argument1; // MatchController object of this match

with(instance_create(0,0,cobj_MatchEngine))
{
    MatchController = other.controller;
    MatchController.MatchEngine = id;
}

if(instance_number(uiobj_UI) > 0)
{
    with(uiobj_UI)
    {
        if(Team == other.controller.Team)
        {
            visible = true;
        }
        else
        {
            instance_destroy();
        }
    }
}
if(controller.MyTurn)
{
    controller.MatchState = MATCH_STATE_MYTURN;
}
