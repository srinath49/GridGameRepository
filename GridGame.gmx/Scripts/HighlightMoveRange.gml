var CurrentObject, MoveRangeFrontBack, MoveRangeUpDown, MoveRangeDiagonal, i, j;
CurrentObject = instance_position(argument0,argument1,pbobj_pathBlock);
MoveRangeFrontBack = argument2;
MoveRangeUpDown = argument3;
MoveRangeDiagonal = argument4;
CurrentObject.visible = true;
CurrentObject.ignoreBlock = true;

/*
show_message((CurrentObject.column));
show_message((MoveRangeFrontBack));
show_message((CurrentObject.column - MoveRangeFrontBack));
show_message((CurrentObject.column + MoveRangeFrontBack));
*/

for(i = CurrentObject.column - MoveRangeFrontBack; i <= CurrentObject.column + MoveRangeFrontBack;i++)
{
    with(pbobj_pathBlock)
    {
        if(row == CurrentObject.row)
        {
            if(column >= (CurrentObject.column - MoveRangeFrontBack))
            {
                if(column <= (CurrentObject.column + MoveRangeFrontBack))
                {
                    visible = true;
                }
            }
        }
    }
}

for(i = CurrentObject.row - MoveRangeUpDown; i <= CurrentObject.row + MoveRangeUpDown;i++)
{
    with(pbobj_pathBlock)
    {
        if(column == CurrentObject.column)
        {
            if(row >= (CurrentObject.row - MoveRangeUpDown))
            {
                if(row <= (CurrentObject.row + MoveRangeUpDown))
                {
                    visible = true;
                }
            }
        }
    }
}

for(i = CurrentObject.column - MoveRangeDiagonal; i <= CurrentObject.column + MoveRangeDiagonal;i++)
{
    for(j = CurrentObject.row - MoveRangeDiagonal; j <= CurrentObject.row + MoveRangeDiagonal;j++)
    {
        with(pbobj_pathBlock)
        {
            if(column >= (CurrentObject.column - MoveRangeDiagonal))
            {
                if(column <= (CurrentObject.column + MoveRangeDiagonal))
                {
                    if(row >= (CurrentObject.row - MoveRangeDiagonal))
                    {
                        if(row <= (CurrentObject.row + MoveRangeDiagonal))
                        {
                            visible = true;
                        }
                    }
                }
            }
        }
    }
}

/*
//Right Blocks
for(i=0; i<MoveRangeFrontBack; i++)
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
*/
