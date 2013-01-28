var enemy, attacker;
attacker = argument0;
defender = argument1;

with(attacker)
{
    UnitState = UNIT_STATE_ATTACKING;
}

with(defender)
{
    UnitState = UNIT_STATE_TAKEHIT;
}

with(uobj_unit.UnitOwner != attacker.UnitOwner)
{
    if(id != other.defender.id)
    {
        if(UnitState != UNIT_STATE_IDLE)
        {
            UnitState = UNIT_STATE_IDLE;
        }
    }
}

PerformAttack(attacker, defender);
