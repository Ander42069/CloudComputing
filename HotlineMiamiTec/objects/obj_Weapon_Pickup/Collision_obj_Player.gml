/// @description Insert description here
// You can write your code in this editor

var pickUpWeapon = mouse_check_button_released(mb_right) or gamepad_button_check_released(0,gp_shoulderl);
if (pickUpWeapon) {



#region weapon equipped? throw it

if (other.weapon_sprite != spr_Nothing) { 
	
	
	
	}

#endregion



#region  grab this "new" weapon 
 switch(sprite_index) {
	 case spr_Pickup_Knife:       other.weapon = "knife";   other.weapon_sprite = spr_AttachedWeapon_Knife;    other.sprite_index = spr_PlayerWalk_Weapon;  break;

     case spr_Pickup_Pistol:      other.weapon = "pistol";  other.weapon_sprite = spr_AttachedWeapon_Pistol;   other.sprite_index = spr_PlayerWalk_Weapon;  break;
	 case spr_Pickup_Smg:         other.weapon = "smg";     other.weapon_sprite = spr_AttachedWeapon_Smg;      other.sprite_index = spr_PlayerWalk_Weapon;  break;
	 case spr_Pickup_Uzi:         other.weapon = "uzi";     other.weapon_sprite = spr_AttachedWeapon_Uzi;      other.sprite_index = spr_PlayerWalk_Weapon;  break;	 
	 case spr_Pickup_Aka:         other.weapon = "aka";     other.weapon_sprite = spr_AttachedWeapon_Aka;      other.sprite_index = spr_PlayerWalk_Weapon;  break;
	 case spr_Pickup_Mg:          other.weapon = "mg";      other.weapon_sprite = spr_AttachedWeapon_Mg;       other.sprite_index = spr_PlayerWalk_Weapon;  break;	 
	 case spr_Pickup_Shotgun:     other.weapon = "shotgun"; other.weapon_sprite = spr_AttachedWeapon_ShotGun;  other.sprite_index = spr_PlayerWalk_Weapon;  break;
   }
other.ammo = ammo;
other.shoot_timer = 0;
#endregion






instance_destroy();
}