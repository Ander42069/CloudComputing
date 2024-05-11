/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
/// @description Insert description here
// You can write your code in this editor

draw_text(20, 20, "Salud: " + string(health));
draw_sprite_ext(sprite_index, image_index, x,y, image_xscale, image_yscale, image_angle_, c_white, image_alpha);


if (walk_Timer > 5) { 
	draw_sprite_ext(spr_Feet, image_index, x,y, image_xscale, image_yscale, image_angle_, c_white, image_alpha);
	}
	

// draw weapon
draw_sprite_ext(weapon_sprite, image_index, weapon_X,weapon_Y, image_xscale, image_yscale, image_angle_, c_white, image_alpha);



// debug checking
if (obj_Control.debug == true) {
	draw_set_halign(fa_center);

 var text_1 = "Ammo: " + string(ammo);
//  draw_text_transformed(x,y-40, text_1, 1,1, 0 );

 var text_2 = weapon;
//  draw_text_transformed(x,y-60, text_2, 1,1, 0 );
/*
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
draw_set_alpha(0.5);
draw_circle(x,y , ai_Circle_Range,0 );
draw_set_alpha(1);
*/
}
