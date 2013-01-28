var mid;

for(i=1;true;i++)
{
    j = ds_list_find_index(MyUnitIDs, i);
    if(j == -1)
    {
        mid = i;
        ds_list_add(MyUnitIDs, mid);
        return mid;
    }
}
