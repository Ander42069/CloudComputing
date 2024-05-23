/// @description Insert description here
// You can write your code in this editor


var grabCamera_Width  = camera_get_view_width(view_camera[0]);
var grabCamera_Height = camera_get_view_height(view_camera[0]);
var grabCamera_X      = camera_get_view_x(view_camera[0] );
var grabCamera_Y      = camera_get_view_y(view_camera[0] );

if (instance_exists(target)) {


	// get x and y position of target and don't show anything outside of room
	var cameraX =  clamp(target.x - grabCamera_Width/2,     0, room_width  - grabCamera_Width  );
	var cameraY =  clamp(target.y - grabCamera_Height/2,    0, room_height - grabCamera_Height );	


	
	camera_set_view_pos(view_camera[0], 
	                  lerp(  grabCamera_X, cameraX, 0.1),
	                  lerp(  grabCamera_Y, cameraY, 0.1));

	
}	

var middlePointX = room_width/2;

   // get 0-100%
    perc  = point_distance(obj_Player.x, obj_Player.y, middlePointX, obj_Player.y ) / middlePointX;
   var flip = 1;
   if (obj_Player.x > middlePointX ) {  flip = -1; }
   if (obj_Player.x < middlePointX ) {  flip =  1; }  
   var bufferX = 100;
    if (obj_Player.x < (middlePointX + bufferX)  and obj_Player.x > (middlePointX - bufferX)  ) {  
	flip = 0;	
	}
   
   var angleOld = (perc * amount) * flip;
	endResult  =  lerp(endResult, angleOld,0.01 );
	
	camera_set_view_angle(view_camera[0], endResult );

