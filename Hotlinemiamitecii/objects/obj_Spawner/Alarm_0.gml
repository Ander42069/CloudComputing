/// @description Insert description here
// You can write your code in this editor

var  grabCamera_X = camera_get_view_x(view_camera[0]);
var  grabCamera_Y = camera_get_view_y(view_camera[0]);

var grabCamera_Width  = camera_get_view_width(view_camera[0])/2;
var grabCamera_Height = camera_get_view_height(view_camera[0])/2;



var distance = 40;
var left =  instance_create_layer(grabCamera_X+grabCamera_Width-distance, grabCamera_Y+grabCamera_Height, "Instances_OnTop", obj_PalmTree);
    left.direction = 180;
	left.speed = 3;
	
	
var right =  instance_create_layer(grabCamera_X+grabCamera_Width+distance, grabCamera_Y+grabCamera_Height, "Instances_OnTop", obj_PalmTree);
    right.direction = 0;
	right.speed = 3;	
	

	
	alarm_set(0, reset_Time);