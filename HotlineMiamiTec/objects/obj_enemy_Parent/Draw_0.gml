/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x,y, image_xscale, image_yscale, image_angle_, c_white, image_alpha);

// draw feet
if (walk_Timer > 5) { 
	draw_sprite_ext(spr_Feet, image_index, x,y, image_xscale, image_yscale, image_angle_, c_white, image_alpha);
	}

if (aggroState == true) {
// draw weapon
draw_sprite_ext(weapon_sprite, image_index, x,y, image_xscale, image_yscale, image_angle_, c_white, image_alpha);
}




// what sprite on each state
if (state == "attack range"){  aggroState = true;  sprite_index = sprite_Aggro;    image_speed = 0; walk_Timer = 0; }
if (state == "nothing here") { aggroState = false; sprite_index = sprite_NotAggro; image_speed = 0; walk_Timer = 0; }
if (state == "going back")   { aggroState = false; sprite_index = sprite_NotAggro; image_speed = 1; walk_Timer++;   }
if (state == "check out")    { aggroState = true;  sprite_index = sprite_Aggro;    image_speed = 1; walk_Timer++;   }
if (state == "idle")         { aggroState = false; sprite_index = sprite_NotAggro; image_speed = 0; walk_Timer = 0; }
	
	
	
// debugging

if (obj_Control.debug == true) {
draw_set_alpha(0.4);
draw_circle_color(position_Start_X , position_Start_Y , 3, c_orange, c_orange, 0);
draw_circle_color(position_Target_X, position_Target_Y, 3, c_red,   c_red,   0);
draw_set_alpha(1);


//draw_text(x,y+ 50, ai_I_See_you);
draw_text(x,y+ 50, image_angle_);

draw_set_alpha(0.1);
draw_circle_color(x,y,attackRange, c_red, c_red, 0 );

draw_circle_color(x,y,attackRangeBreak, c_blue, c_blue, 0 );
draw_set_alpha(1);


// draw_line_width_color(x,y, x + lengthdir_x(sightMAX,image_angle_ ), y + lengthdir_y(sightMAX,image_angle_ ) , 1.5, c_purple,c_purple  );
var lineLength = 100;
var get_lineMiddle_X = x + lengthdir_x(lineLength, image_angle_);
var get_lineMiddle_Y = y + lengthdir_y(lineLength, image_angle_);

var angleDiff = ai_I_See_you_Angle;
var get_lineAbove_X = x + lengthdir_x(lineLength, image_angle_ -angleDiff);
var get_lineAbove_Y = y + lengthdir_y(lineLength, image_angle_ -angleDiff);

var get_lineBelow_X = x + lengthdir_x(lineLength, image_angle_ +angleDiff);
var get_lineBelow_Y = y + lengthdir_y(lineLength, image_angle_ +angleDiff);

 draw_line_width_color(x,y,get_lineMiddle_X, get_lineMiddle_Y, 2, c_orange, c_orange);
 draw_line_width_color(x,y,get_lineAbove_X, get_lineAbove_Y, 1, c_blue,c_blue);
 draw_line_width_color(x,y,get_lineBelow_X, get_lineBelow_Y, 1, c_blue,c_blue);

}
