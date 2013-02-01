var attacker; // Attacking Unit
var defender; // Attacked Unit
var damage;
var attack, armour;

attacker = argument0;
defender = argument1;

with(attacker)
{
    attack = UnitAttack;
}
with(defender)
{
    armour = UnitArmour;
}
damage = attack - armour;
if(damage < 1)
{
    damage = 1;
}

defender.UnitHealth -= damage;
