
// dont place in room!

//depth = -500;
image_speed = 0;

// weapon
weapon_sprite = spr_Nothing;
weapon = "";
alarm[0] = 3; // reset timers after 3 steps

image_angle_ = 0;


// ai state machine
sightMAX = 120;

state = "idle";
//emote_Index = 0; old not used variable

aggroState = false; // is trigger when attacking and chasing, then enemy carry a weapon


// sprite to read from
sprite_whenDead = spr_EnemyRed_Dead;
sprite_NotAggro = spr_EnemyRed_Walk;
sprite_Aggro    = spr_EnemyRed_Walk_Weapon;

// ai
emote  = instance_create_layer(x,y-15, layer, obj_Enemy_State_Emote );
emote.instanceToFollow = id;


// pathfinding
path = path_add();
position_Start_X = x;
position_Start_Y = y;

position_Target_X = x;
position_Target_Y = y;


walkSpeed_Aggro_Checking = 2;
walkSpeed_Going_Back     = 0.75;




ai_NothingHere_time = 180;
ai_NothingHere_timer = ai_NothingHere_time;


ai_I_See_you = 6;


ai_I_See_you_Angle = 15;

attackRange      = 50;
attackRangeBreak = 150;

// old, changed so it has same code like in obj player
//attack_Time  = 60;
//attack_Timer = attack_Time;
shoot_time  = 30;
shoot_timer = shoot_time;

// used for animation of the feet
walk_Timer = 0;

