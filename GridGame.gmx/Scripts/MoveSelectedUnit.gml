with(SelectedUnit)
{
    //mp_linear_step(argument0,argument1,argument2,false);
    global.MoveLocationX = argument0;
    global.MoveLocationY = argument1;
    global.MoveSpeed = argument2;
    UnitState = "MovingState";
}
