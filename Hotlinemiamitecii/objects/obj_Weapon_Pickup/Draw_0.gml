/// @description Insert description here
// You can write your code in this editor

if (obj_Control.debug == true) {


draw_sprite(mask_index, 0, x,y );

}


draw_sprite_ext(sprite_index, 1, x,y, image_xscale, image_yscale,0, c_white, 0.5 ); // shadow
draw_sprite_ext(sprite_index, 0, x-hover,y-hover, image_xscale, image_yscale,0, c_white, 1 ); // real sprite
