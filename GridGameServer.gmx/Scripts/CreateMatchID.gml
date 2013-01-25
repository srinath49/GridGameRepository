var mid;

for(i=1;true;i++)
{
    j = ds_list_find_index(global.matchIdList, i);
    if(j == -1)
    {
        mid = i;
        ds_list_add(global.matchIdList, mid);
        return mid;
    }
}
