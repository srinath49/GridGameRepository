var j, controller, uid;
controller = argument0;
uid = argument1;

match = controller.Match;
ds_list_add(match.MyUnitIDs, uid);
ds_list_sort(match.MyUnitIDs, true);
