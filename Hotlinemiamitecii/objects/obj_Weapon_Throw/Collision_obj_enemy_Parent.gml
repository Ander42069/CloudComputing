/// @description Insert description here


instance_destroy(other.id);


var pickUp = instance_create_layer(x,y, "Instances", obj_Weapon_Pickup);
pickUp.ammo = ammoLeft;
pickUp.sprite_index = sprite_index;
	
instance_destroy();
