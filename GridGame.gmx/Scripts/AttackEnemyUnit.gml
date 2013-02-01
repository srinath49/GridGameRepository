var defender, attacker;
attacker = argument0;
defender = argument1;

with(attacker)
{
    UnitState = UNIT_STATE_ATTACKING;
}

with(uobj_unit)
{
    if(UnitState == UNIT_STATE_INATTACKRANGE) || (InAttackRange)
    {
        UnitState = UNIT_STATE_IDLE;
        InAttackRange = false;
    }
}

with(defender)
{
    UnitState = UNIT_STATE_TAKEHIT;
}

PerformAttack(attacker, defender);
