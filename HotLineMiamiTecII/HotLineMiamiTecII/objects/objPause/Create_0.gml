/// @description Inserte aquí la descripción
pause = false;
pauseSurface = noone;
selected = 1;

draw_set_font(Font_Menue);
draw_set_halign(fa_center);

grabCamera_Width  = camera_get_view_width(view_camera[0])/2;
grabCamera_Height = camera_get_view_height(view_camera[0])/2;

color = c_white;
color2 = c_aqua;
color3 = c_black;
color4 = c_fuchsia;

start = 0;
dest =  1;
duration = 60;
time = 0;

blink = 0;

start2 = -5;
dest2 =  5;
duration2 = 120;
time2 = 0;

wiggle = 0;

selected = 1;
posY_1 = 0;
posY_2 = 50;
posY_3 = 100;
posY_4 = 150;

animateTime = 4;
draw_Extra = 0;
draw_ExtraMax = 30;
Increase = true;

alarm[0] = animateTime;
