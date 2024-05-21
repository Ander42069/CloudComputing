
event_inherited();

// to set variables that are unique for this "type" of enemy

// sprite to read from
sprite_whenDead = spr_EnemyWhite_Dead;
sprite_NotAggro = spr_EnemyWhite_Walk;
sprite_Aggro    = spr_EnemyWhite_Walk_Weapon;


// what weapon are is he holding
weapon = "pistol";

// what values to read from when attacking
attackRange      = 70;
attackRangeBreak = 100;


// how big is the sight angle/cone?
ai_I_See_you_Angle = 40;



// how fast is the enemy walking?
walkSpeed_Aggro_Checking = 1.5;
walkSpeed_Going_Back     = 0.5;