/// @description Insert description here
// You can write your code in this editor

if (control == "keyboard") { direction = point_direction(x,y, mouse_x, mouse_y);  }

if (control == "gamepad") { 
	var haxis = gamepad_axis_value(0, gp_axisrh  );
	var vaxis = gamepad_axis_value(0, gp_axisrv);	
	
	if (vaxis != 0 or haxis != 0 ) { direction = point_direction(0, 0, haxis, vaxis); last_Direction = direction;    }
	if (haxis == 0 and vaxis == 0 ) { direction = last_Direction; }
	}

image_angle_ = direction;



scr_Input();








//animation
if (xprevious == x and yprevious == y) {  image_speed = 0; walk_Timer = 0; }
    else {   image_speed = 1;  walk_Timer++;   }
	

// camera
if (keyboard_check(vk_shift)) {
	
	if (!instance_exists(obj_TargetDummy)) {  
		   targetDummy = instance_create_layer(mouse_x, mouse_y, "Instances", obj_TargetDummy);
                 obj_Camera.target = targetDummy;
		}
		var grabCamera_Width  = camera_get_view_width(view_camera[0]);
        var grabCamera_Height = camera_get_view_height(view_camera[0]);
		targetDummy.x = clamp(mouse_x,  x - ((grabCamera_Width/2)  -20) , x + ((grabCamera_Width/2)  -20)   ); 
		targetDummy.y = clamp(mouse_y,  y - ((grabCamera_Height/2) -20) , y + ((grabCamera_Height/2) -20)  );		

     obj_TargetDummy.timer = 5;
}

// fire left mouse button pressed
var fireWeapon = mouse_check_button(mb_left) or gamepad_button_check(0,gp_shoulderr);
if (fireWeapon and weapon_sprite != spr_Nothing and ammo > 0) { 
	
	

	
	
	// run down timer
	shoot_timer--;
	
	if (shoot_timer <= 0) {
		
		weapon_X = x + lengthdir_x(5, image_angle_ -180);
		weapon_Y = y + lengthdir_y(5, image_angle_ -180);		
		
		// get correct shot/muzzle position
		var shotX = 0;    
		var shotY = 0;  
		
	
	// create bullet(s) and muzzle
	switch(weapon) {
		
		 case "pistol": {
		 
		 shotX = x + lengthdir_x(12, image_angle_-25);    
		 shotY = y + lengthdir_y(12, image_angle_-25);  
		
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot);
		    shot.damage    = obj_Control.damage_Pistol;
		    shot.speed     = obj_Control.ShotSpeed_Pistol;
		    shot.friction  = obj_Control.friction_Pistol;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Pistol, obj_Control.spread_Pistol);			
			ammo -= 1; shoot_timer = obj_Control.shoot_timer_Pistol;
			
			var muzzle = instance_create_layer(shotX,shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;
			    muzzle.distance = 11;
				muzzle.extraAngle = 25;	
			
	      break; }

	 case "smg": {

		 shotX = x + lengthdir_x(14, image_angle_-22);    
		 shotY = y + lengthdir_y(14, image_angle_-22);  
		 
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot);
		    shot.damage   = obj_Control.damage_Smg;
		    shot.speed    = obj_Control.ShotSpeed_Smg;
		    shot.friction = obj_Control.friction_Smg;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Smg, obj_Control.spread_Smg);			
			ammo -= 1;  shoot_timer = obj_Control.shoot_timer_Smg;
			
			var muzzle = instance_create_layer(x,y, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;
			    muzzle.distance = 14;
				muzzle.extraAngle = 22;					
				
	      break; }


	 case "uzi": {

         shotX = x + lengthdir_x(16, image_angle_-16);    
		 shotY = y + lengthdir_y(16, image_angle_-16);  	
		 
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot);
		    shot.damage   = obj_Control.damage_Uzi;
		    shot.speed    = obj_Control.ShotSpeed_Uzi;
		    shot.friction = obj_Control.friction_Uzi;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Uzi, obj_Control.spread_Uzi);			
			ammo -= 1;  shoot_timer = obj_Control.shoot_timer_Uzi;
			
			var muzzle = instance_create_layer(shotX,shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;	
			    muzzle.distance = 16;
				muzzle.extraAngle = 16;						
	      break; }		  


	 case "aka": {
		 
         shotX = x + lengthdir_x(17, image_angle_-32);    
		 shotY = y + lengthdir_y(17, image_angle_-32); 		
		 
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot);
		    shot.damage   = obj_Control.damage_Smg;
		    shot.speed    = obj_Control.ShotSpeed_Smg;
		    shot.friction = obj_Control.friction_Pistol;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Aka, obj_Control.spread_Aka);				
			ammo -= 1;  shoot_timer = obj_Control.shoot_timer_Aka;
			
			var muzzle = instance_create_layer(shotX, shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;	
			    muzzle.distance = 18;
				muzzle.extraAngle = 15;					
				
	      break; }

	 case "mg": {

         shotX = x + lengthdir_x(16, image_angle_-22);    
		 shotY = y + lengthdir_y(16, image_angle_-22); 
		 
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot);
		    shot.damage   = obj_Control.damage_Mg;
		    shot.speed    = obj_Control.ShotSpeed_Mg;
		    shot.friction = obj_Control.friction_Mg;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Mg, obj_Control.spread_Mg);				
			ammo -= 1;  shoot_timer = obj_Control.shoot_timer_Mg;
			
			var muzzle = instance_create_layer(shotX,shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;		
			    muzzle.distance = 21;
				muzzle.extraAngle = 15;					
				
	      break; }



	 case "shotgun": {

         shotX = x + lengthdir_x(24, image_angle_-20);    
		 shotY = y + lengthdir_y(24, image_angle_-20); 
	
	for (var i = 0;  i < 6; i++ ){
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot);
		    shot.damage   = obj_Control.damage_Shotgun;
		    shot.speed    = obj_Control.ShotSpeed_Shotgun;
		    shot.friction = obj_Control.friction_Shotgun;
		    shot.direction = image_angle_ + i*obj_Control.spread_Shotgun;				
	}
	
	for (var i2 = 1;  i2 < 6; i2++ ){
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot);
		    shot.damage   = obj_Control.damage_Shotgun;
		    shot.speed    = obj_Control.ShotSpeed_Shotgun;
		    shot.friction = obj_Control.friction_Shotgun;
		    shot.direction = image_angle_ - i2*obj_Control.spread_Shotgun;				
	}	
	
	
	
	     ammo -= 1;  shoot_timer = obj_Control.shoot_timer_Shotgun;
			
			var muzzle = instance_create_layer(shotX,shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;		
			    muzzle.distance = 24;
				muzzle.extraAngle = 20;					
				
	      break; }



	
	   } // end of switch
	
	
	} // end of
} // end of left mouse button



/// recoil recovery
var amountLerp = 0.2;
weapon_X = lerp (x, weapon_X, amountLerp); 
weapon_Y = lerp (y, weapon_Y, amountLerp); 





// throw/ grab new weapon
var throwWeapon = mouse_check_button_released(mb_right) or gamepad_button_check_released(0,gp_shoulderl);
if (throwWeapon and weapon_sprite != spr_Nothing) { 
	
	 var throwWeapon = instance_create_layer(x,y,"Instances", obj_Weapon_Throw );
	     throwWeapon.direction = image_angle_;
	     throwWeapon.speed     = irandom_range(7,10);
		 throwWeapon.ammoLeft = ammo;
		 
		 switch(weapon) {
		  case "knife":  throwWeapon.sprite_index = spr_Pickup_Knife;       break;  
		  
		  case "pistol":   throwWeapon.sprite_index = spr_Pickup_Pistol;    break;		 
		  case "smg":      throwWeapon.sprite_index = spr_Pickup_Smg;       break;	
		  case "uzi":      throwWeapon.sprite_index = spr_Pickup_Uzi;       break;			  
		  case "aka":      throwWeapon.sprite_index = spr_Pickup_Aka;       break;	
		  case "mg":       throwWeapon.sprite_index = spr_Pickup_Mg;       break;			  
		  case "shotgun":  throwWeapon.sprite_index = spr_Pickup_Shotgun;   break;			  
   }
	
	// reset player weapon and regular sprite
	weapon_sprite = spr_Nothing;
	sprite_index = spr_PlayerWalk;
    weapon = "";
	ammo = 0;
	
	
	
	}




	
	

	

