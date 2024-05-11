/// @description Insert description here
//if (state == "idle") { exit; }


image_angle_ = lerp(image_angle_, direction, 0.1 );


/// ai
if (state == "check out"){ 
	event_user(0); state = "checking out";	emote.sprite_index = spr_Emote_Enemy_State_Roaming;
	}
	
if (state == "checking out"){ 
	if ( distance_to_point(position_Target_X,position_Target_Y) < 5) {
	       state = "nothing here";
		   emote.sprite_index = spr_Emote_Enemy_State_NothingThere;
	}	
}	


if (state == "nothing here"){
	ai_NothingHere_timer--;
	if (ai_NothingHere_timer <= 0){
	   ai_NothingHere_timer = ai_NothingHere_time;
	    state = "going back"; event_user(1);
		emote.sprite_index = spr_Emote_Enemy_State_Roaming;

        ai_I_See_you = 6;
	}
}


if (state == "going back"){ 
	if ( distance_to_point(position_Start_X,position_Start_Y) < 5) {
	       state = "idle";
		   	emote.sprite_index = spr_Emote_Enemy_State_Idle;
			
	    }			
	}
	
	
// new
if (state == "attack range"){
shoot_timer--;

 // turn towards player
image_angle_ = point_direction(x,y, obj_Player.x, obj_Player.y );

 // can attack? one check again
if (shoot_timer <= 0){

 if (distance_to_object(obj_Player) < attackRangeBreak) {
	 
	
#region // what kind of ranged weapon has the enemy?


		// get correct shot/muzzle position
		var shotX = 0;    
		var shotY = 0;  
		
	// create bullet(s) and muzzle
	switch(weapon) {
		
		 case "pistol": {
		 
		 shotX = x + lengthdir_x(12, image_angle_-25);    
		 shotY = y + lengthdir_y(12, image_angle_-25);  
		
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot_Enemy);
		    shot.damage    = obj_Control.damage_Pistol;
		    shot.speed     = obj_Control.ShotSpeed_Pistol;
		    shot.friction  = obj_Control.friction_Pistol;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Pistol, obj_Control.spread_Pistol);			
			shoot_timer = obj_Control.shoot_timer_Pistol;
			
			var muzzle = instance_create_layer(shotX,shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;
			    muzzle.distance = 11;
				muzzle.extraAngle = 25;	
			
	      break; }

	 case "smg": {

		 shotX = x + lengthdir_x(14, image_angle_-22);    
		 shotY = y + lengthdir_y(14, image_angle_-22);  
		 
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot_Enemy);
		    shot.damage   = obj_Control.damage_Smg;
		    shot.speed    = obj_Control.ShotSpeed_Smg;
		    shot.friction = obj_Control.friction_Smg;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Smg, obj_Control.spread_Smg);			
			shoot_timer = obj_Control.shoot_timer_Smg;
			
			var muzzle = instance_create_layer(x,y, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;
			    muzzle.distance = 14;
				muzzle.extraAngle = 22;					
				
	      break; }


	 case "uzi": {

         shotX = x + lengthdir_x(16, image_angle_-16);    
		 shotY = y + lengthdir_y(16, image_angle_-16);  	
		 
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot_Enemy);
		    shot.damage   = obj_Control.damage_Uzi;
		    shot.speed    = obj_Control.ShotSpeed_Uzi;
		    shot.friction = obj_Control.friction_Uzi;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Uzi, obj_Control.spread_Uzi);			
			shoot_timer = obj_Control.shoot_timer_Uzi;
			
			var muzzle = instance_create_layer(shotX,shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;	
			    muzzle.distance = 16;
				muzzle.extraAngle = 16;						
	      break; }		  


	 case "aka": {
		 
         shotX = x + lengthdir_x(17, image_angle_-32);    
		 shotY = y + lengthdir_y(17, image_angle_-32); 		
		 
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot_Enemy);
		    shot.damage   = obj_Control.damage_Smg;
		    shot.speed    = obj_Control.ShotSpeed_Smg;
		    shot.friction = obj_Control.friction_Pistol;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Aka, obj_Control.spread_Aka);				
			shoot_timer = obj_Control.shoot_timer_Aka;
			
			var muzzle = instance_create_layer(shotX, shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;	
			    muzzle.distance = 18;
				muzzle.extraAngle = 15;					
				
	      break; }

	 case "mg": {

         shotX = x + lengthdir_x(16, image_angle_-22);    
		 shotY = y + lengthdir_y(16, image_angle_-22); 
		 
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot_Enemy);
		    shot.damage   = obj_Control.damage_Mg;
		    shot.speed    = obj_Control.ShotSpeed_Mg;
		    shot.friction = obj_Control.friction_Mg;
		    shot.direction = image_angle_ + random_range(-obj_Control.spread_Mg, obj_Control.spread_Mg);				
			shoot_timer = obj_Control.shoot_timer_Mg;
			
			var muzzle = instance_create_layer(shotX,shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;		
			    muzzle.distance = 21;
				muzzle.extraAngle = 15;					
				
	      break; }



	 case "shotgun": {

         shotX = x + lengthdir_x(24, image_angle_-20);    
		 shotY = y + lengthdir_y(24, image_angle_-20); 
	
	for (var i = 0;  i < 6; i++ ){
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot_Enemy);
		    shot.damage   = obj_Control.damage_Shotgun;
		    shot.speed    = obj_Control.ShotSpeed_Shotgun;
		    shot.friction = obj_Control.friction_Shotgun;
		    shot.direction = image_angle_ + i*obj_Control.spread_Shotgun;				
	}
	
	for (var i2 = 1;  i2 < 6; i2++ ){
	 	var shot = instance_create_layer(shotX,shotY, "Instances", obj_Shot_Enemy);
		    shot.damage   = obj_Control.damage_Shotgun;
		    shot.speed    = obj_Control.ShotSpeed_Shotgun;
		    shot.friction = obj_Control.friction_Shotgun;
		    shot.direction = image_angle_ - i2*obj_Control.spread_Shotgun;				
	}	
	
	
	
	     shoot_timer = obj_Control.shoot_timer_Shotgun;
			
			var muzzle = instance_create_layer(shotX,shotY, "Instances", obj_Muzzle);
			    muzzle.instance_ToStickTo = id;		
			    muzzle.distance = 24;
				muzzle.extraAngle = 20;					
				
	      break; }



	
	   } // end of switch


#endregion
	
	
	
/*   // old version from video,  refined with muzzle ... see above	 
var shot = instance_create_layer(x,y, "Instances", obj_Shot_Enemy);
    shot.speed = 8;
    shot.direction = 	image_angle_;
 */
 
 
 
 
 
 } else {
 
 state = "check out"; 
 
   position_Target_X = obj_Player.x;
   position_Target_Y = obj_Player.y;
 
 }

}

}