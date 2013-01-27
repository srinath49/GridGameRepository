for(i=1;true;i++)
{
    j = ds_list_find_index(global.RequestIdList, i);
    if(j == -1)
    {
        mid = i;
        ds_list_add(global.RequestIdList, mid);
        return mid;
    }
}
