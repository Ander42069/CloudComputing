instance_destroy(emote);

// create "dead" instance
var dead = instance_create_layer(x,y, "Instances_Dead", obj_enemy_Dead);
    dead.image_angle  = image_angle + 90;
    dead.sprite_index = sprite_whenDead; 
 
 // destroy path if there to free memory
 if (path_exists(path)) {  path_delete(path);    }



if (weapon_sprite != spr_Nothing) {
var spriteToPassIn = spr_Pickup_Pistol;
var ammoToPassIn = 0;

switch(weapon) {

 case "knife":      spriteToPassIn = spr_Pickup_Knife;   break;

 case "pistol":     spriteToPassIn = spr_Pickup_Pistol;   ammoToPassIn = obj_Control.ammo_Pistol;  break;

 case "smg":        spriteToPassIn = spr_Pickup_Smg;      ammoToPassIn = obj_Control.ammo_Smg;  break;
 case "uzi":        spriteToPassIn = spr_Pickup_Uzi;      ammoToPassIn = obj_Control.ammo_Uzi;  break;

 case "aka":        spriteToPassIn = spr_Pickup_Aka;      ammoToPassIn = obj_Control.ammo_Aka;  break;
 case "mg":         spriteToPassIn = spr_Pickup_Mg;       ammoToPassIn = obj_Control.ammo_Mg;  break;

 case "shotgun":    spriteToPassIn = spr_Pickup_Shotgun;  ammoToPassIn = obj_Control.ammo_Shotgun;  break


}


 var pickUp = instance_create_layer(x,y, "Instances", obj_Weapon_Pickup);
	pickUp.ammo = ammoToPassIn;
	pickUp.sprite_index = spriteToPassIn;
	
}


global.points = global.points +100;