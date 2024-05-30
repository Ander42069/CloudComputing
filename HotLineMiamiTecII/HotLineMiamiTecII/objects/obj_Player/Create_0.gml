/// @description Insert description here
// You can write your code in this editor
walkSpeed = 2;

walk_Timer = 0;

targetDummy = noone;


// weapon
weapon_sprite = spr_Nothing;
weapon = "";
ammo = 0;

shoot_timer = 0;

// weapon animation
weapon_X = x;
weapon_Y = y;

image_angle_ = 0;


/// input
control = "keyboard";
last_Direction = 0;
gamepad_set_axis_deadzone(0, 0.3);



/// activate Ai of enemies
ai_Refresh = 10;
alarm[0] = ai_Refresh;

ai_Circle_Range = 100;


health = 1;
global.points = 0;

// Evento Create de obj_Player
is_attacking = false;
attack_damage = 10; // El daño que el cuchillo hará a los enemigos
