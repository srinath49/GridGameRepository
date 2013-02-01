var range, object;
object = instance_position(x,y,pbobj_pathBlock);
range = argument0;

with(pbobj_pathBlock)
{
    if((row <= object.row+range)&&(row >= object.row-range)) && ((column <= object.column+range)&&(column >= object.column-range))
    {
        if(IsOccupied)
        {
            enemy = instance_position(x,y,uobj_unit);
            with(enemy)
            {
                if(UnitOwner != global.username)
                {
                    UnitState = UNIT_STATE_INATTACKRANGE;
                    InAttackRange = true;
                }
            }
        }
    }
}
