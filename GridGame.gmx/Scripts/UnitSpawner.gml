with(instance_create(argument0 , argument1 , argument2))
{
    UnitOwner = argument3;
    if(global.InAction)
    {
        global.InAction = false;
    }
    return id;
}
