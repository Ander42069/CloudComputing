/// @description Insert description here
// You can write your code in this editor
timer--;

if (timer <= 0) { 
	obj_Camera.target = obj_Player;
	
	instance_destroy();
	
	
	}