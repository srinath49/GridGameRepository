with(pbobj_pathBlock)
{
    if(IsOccupied)
    {
        enemy = instance_position(x,y,uobj_unit);
        with(enemy)
        {
            if(UnitOwner != global.username)
            {
                UnitState = UNIT_STATE_INATTACKRANGE;
            }
        }
    }
}
