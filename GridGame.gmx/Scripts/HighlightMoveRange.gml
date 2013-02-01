var CurrentObject, MoveRangeFrontBack, MoveRangeUpDown, MoveRangeDiagonal, i;
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
CurrentObject.visible = true;
CurrentObject.ignoreBlock = true;
MoveRangeFrontBack = argument2;
MoveRangeUpDown = argument3;
MoveRangeDiagonal = argument4;

/*
//Right and Left Blocks
//for(i=1; i<=MoveRangeFrontBack; i++)
{
    with(pbobj_pathBlock)
    {
        if(row == CurrentObject.row)
        {
            if((column <= CurrentObject.column + MoveRangeFrontBack) && (column >= CurrentObject.column)) || ((column >= CurrentObject.column - MoveRangeFrontBack)) && (column <= CurrentObject.column)
            {
                if(!IsOccupied)
                {
                    visible = true;
                }
            }
        }
        
        if((column <= CurrentObject.column + MoveRangeDiagonal) && (column >= CurrentObject.column)) || ((column >= CurrentObject.column - MoveRangeDiagonal) && (column <= CurrentObject.column))
        {
            if((row <= CurrentObject.row + MoveRangeDiagonal) && (row >= CurrentObject.row)) || ((row >= CurrentObject.row - MoveRangeDiagonal) && (row <= CurrentObject.row))
            {
                if(!IsOccupied)
                {
                    visible = true;
                }
            }
        }
        
        if(column == CurrentObject.column)
        {
            if((row <= CurrentObject.row + MoveRangeUpDown) && (row >= CurrentObject.row)) || ((row >= CurrentObject.row - MoveRangeUpDown) && (row <= CurrentObject.row))
            {
                if(!IsOccupied)
                {
                    visible = true;
                }
            }
        }
    }
}

//Top and Bottom Blocks
//for(i=1; i<=MoveRangeUpDown; i++)
{
    with(pbobj_pathBlock)
    {
        
    }
}

//Diagonal Blocks
//for(i=1; i<=MoveRangeDiagonal; i++)
{
    with(pbobj_pathBlock)
    {
        
    }
}
*/

//Right Blocks
for(i=1; i<=MoveRangeFrontBack; i++)
{
    NextObject = instance_place(CurrentObject.x+89, CurrentObject.y, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}

//Left Blocks
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeFrontBack; i++)
{
    PreviousObject = instance_place(CurrentObject.x-89, CurrentObject.y, pbobj_pathBlock);
    CurrentObject = PreviousObject;
    CurrentObject.visible = true;
}

//Top Blocks
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeUpDown; i++)
{
    NextObject = instance_place(CurrentObject.x, CurrentObject.y-81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}

//Bottom Blocks
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeUpDown; i++)
{
    PreviousObject = instance_place(CurrentObject.x, CurrentObject.y+81, pbobj_pathBlock);
    CurrentObject = PreviousObject;
    CurrentObject.visible = true;
}

//Diagonal Blocks
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeDiagonal; i++)
{
    NextObject = instance_place(CurrentObject.x+89, CurrentObject.y+81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeDiagonal; i++)
{
    NextObject = instance_place(CurrentObject.x+89, CurrentObject.y-81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeDiagonal; i++)
{
    NextObject = instance_place(CurrentObject.x-89, CurrentObject.y+81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeDiagonal; i++)
{
    NextObject = instance_place(CurrentObject.x-89, CurrentObject.y-81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}

