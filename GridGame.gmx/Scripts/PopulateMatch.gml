var new, controller;
new = argument0;
controller = argument1;
with(instance_create(0,0,cobj_MatchEngine))
{
    MatchController = other.controller;
}

if(instance_number(uiobj_UI) > 0)
{
    //show_message(global.username+"::PopulateMatch::1");
    with(uiobj_UI)
    {
        //show_message(global.username+"::PopulateMatch::2");
        //show_message(global.username+"::PopulateMatch::Team::"+string(Team));
        //show_message(global.username+"::PopulateMatch::ControllerTeam::"+string(other.controller.Team));
        if(Team == other.controller.Team)
        {
            //show_message(global.username+"::PopulateMatch::3");
            visible = true;
        }
        else
        {
            //show_message(global.username+"::PopulateMatch::4");
            instance_destroy();
        }
    }
}
