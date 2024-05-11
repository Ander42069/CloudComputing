/// @description Set timers/variables once


#region // what kind of ranged weapon has the enemy? -> set cooldown for shooting and sprite when aggro

		
	// create bullet(s) and muzzle
	switch(weapon) {
		
		 case "pistol": {
		 			
			shoot_timer   = obj_Control.shoot_timer_Pistol;
            weapon_sprite = spr_AttachedWeapon_Pistol;
			
	      break; }

	 case "smg": {
		 
		shoot_timer = obj_Control.shoot_timer_Smg;		
            weapon_sprite = spr_AttachedWeapon_Smg;		
	      break; }


	 case "uzi": {
		
			shoot_timer = obj_Control.shoot_timer_Uzi;
	            weapon_sprite = spr_AttachedWeapon_Uzi;							
	      break; }		  


	 case "aka": {
		 				
			shoot_timer = obj_Control.shoot_timer_Aka;						
            weapon_sprite = spr_AttachedWeapon_Aka;				
	      break; }

	 case "mg": {
				
			shoot_timer = obj_Control.shoot_timer_Mg;				
            weapon_sprite = spr_AttachedWeapon_Mg;				
	      break; }

	 case "shotgun": {	
	
	     shoot_timer = obj_Control.shoot_timer_Shotgun;
            weapon_sprite = spr_AttachedWeapon_ShotGun;							
				
	      break; }
	
	   } // end of switch


#endregion

