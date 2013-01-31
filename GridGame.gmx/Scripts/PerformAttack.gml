var attacker; // Attacking Unit
var defender; // Attacked Unit
var damage;

attacker = argument0;
defender = argument1;

damage = attacker.UnitAttack - defender.UnitArmour;
if(damage < 1)
{
    damage = 1;
}

defender.UnitHealth -= damage;
