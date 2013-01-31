var CurrentObject, MoveRangeFrontBack, MoveRangeUpDown, MoveRangeDiagonal, i;
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
CurrentObject.visible = true;
CurrentObject.ignoreBlock = true;
MoveRangeFrontBack = argument2;
MoveRangeUpDown = argument3;
MoveRangeDiagonal = argument4;

//Right and Left Blocks
for(i=1; i<=MoveRangeFrontBack; i++)
{
    with(pbobj_pathBlock)
    {
        if(row == CurrentObject.row) && ((column == CurrentObject.column + i) || (column == CurrentObject.column - i))
        {
            if(!IsOccupied)
            {
                visible = true;
            }
        }
    }
}

//Top and Bottom Blocks
for(i=1; i<=MoveRangeUpDown; i++)
{
    with(pbobj_pathBlock)
    {
        if(column == CurrentObject.column) && ((row == CurrentObject.row + i) || (row == CurrentObject.row - i))
        {
            if(!IsOccupied)
            {
                visible = true;
            }
        }
    }
}

//Diagonal Blocks
for(i=1; i<=MoveRangeDiagonal; i++)
{
    with(pbobj_pathBlock)
    {
        if(column == CurrentObject.column + i) || (column == CurrentObject.column - i)
        {
            if(row == CurrentObject.row + i) || (row == CurrentObject.row - i)
            {
                if(!IsOccupied)
                {
                    visible = true;
                }
            }
        }
    }
}

/*
//Right Blocks
for(i=1; i<=MoveRangeFrontBack; i++)
{
    NextObject = instance_place(CurrentObject.x+89, CurrentObject.y, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}

//Left Blocks
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeFrontBack; i+=1)
{
    PreviousObject = instance_place(CurrentObject.x-89, CurrentObject.y, pbobj_pathBlock);
    CurrentObject = PreviousObject;
    CurrentObject.visible = true;
}

//Top Blocks
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeUpDown; i+=1)
{
    NextObject = instance_place(CurrentObject.x, CurrentObject.y-81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}

//Bottom Blocks
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeUpDown; i+=1)
{
    PreviousObject = instance_place(CurrentObject.x, CurrentObject.y+81, pbobj_pathBlock);
    CurrentObject = PreviousObject;
    CurrentObject.visible = true;
}

//Diagonal Blocks
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeDiagonal; i+=1)
{
    NextObject = instance_place(CurrentObject.x+89, CurrentObject.y+81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeDiagonal; i+=1)
{
    NextObject = instance_place(CurrentObject.x+89, CurrentObject.y-81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeDiagonal; i+=1)
{
    NextObject = instance_place(CurrentObject.x-89, CurrentObject.y+81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}
CurrentObject = instance_place(argument0,argument1,pbobj_pathBlock);
for(i=0; i<MoveRangeDiagonal; i+=1)
{
    NextObject = instance_place(CurrentObject.x-89, CurrentObject.y-81, pbobj_pathBlock);
    CurrentObject = NextObject;
    CurrentObject.visible = true;
}
*/
