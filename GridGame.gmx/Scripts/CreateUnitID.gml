var uid;
var controller;
var match;
var j;

controller = argument0;
match = controller.Match;

for(i=1;true;i++)
{
    j = ds_list_find_index(match.MyUnitIDs, i);
    if(j == -1)
    {
        uid = i;
        ds_list_add(match.MyUnitIDs, uid);
        ds_list_sort(match.MyUnitIDs, true);
        return uid;
    }
}
return -999;
