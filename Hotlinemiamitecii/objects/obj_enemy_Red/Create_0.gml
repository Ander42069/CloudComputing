
event_inherited();

// to set variables that are unique for this "type" of enemy

// sprite to read from
sprite_whenDead = spr_EnemyRed_Dead;
sprite_NotAggro = spr_EnemyRed_Walk;
sprite_Aggro    = spr_EnemyRed_Walk_Weapon;


// what weapon are is he holding
weapon = "aka";

// what values to read from when attacking
attackRange      = 50;
attackRangeBreak = 150;

// how big is the sight angle/cone?
ai_I_See_you_Angle = 40;

// how fast is the enemy walking?
walkSpeed_Aggro_Checking = 2;
walkSpeed_Going_Back     = 0.75;