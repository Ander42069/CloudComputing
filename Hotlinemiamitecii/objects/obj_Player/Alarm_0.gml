/// @description Insert description here

var _list = ds_list_create();
var _num = collision_circle_list(x, y, ai_Circle_Range, obj_enemy_Parent, false, true, _list, false);
if _num > 0
    {
    for (var i = 0; i < _num; ++i;)
        {
			
		// there is an ememy, is he seeing us?			
		var sight_line = collision_line(x,y,  _list[| i].x, _list[| i].y, obj_Wall, 0,0);
		
		// is there a wall blocking the sight? no -> have a delay on activating the ai
		if (sight_line == noone){ 
			
	// get perfect line of sight			
	var get_perfectLineDirection = 	point_direction(_list[| i].x, _list[| i].y,  x,y );	
			
	// check if enemy's cone of sight is in the perfect line of sighst			
	var angleDiff = abs(angle_difference(get_perfectLineDirection, _list[| i].image_angle_  ));

	if (angleDiff <= _list[| i].ai_I_See_you_Angle){
			_list[| i].ai_I_See_you -= 1; }
						
			}
		
		// else memory hole the "seeing the player"		
         else { _list[| i].ai_I_See_you = 6; }


		// is the enemy seeing the player for a second or longer? activate his ai!
   if (_list[| i].ai_I_See_you <= 0){
   
   
     // new	 
 if (_list[| i].state == "idle") {
    _list[| i].state = "check out";
	
    _list[| i].position_Target_X = x;
    _list[| i].position_Target_Y = y;
 }

if ( distance_to_object(_list[| i]) < _list[| i].attackRange  and
    _list[| i].state != "attack range"){

	   // get rid of path if exists
if (path_exists(_list[| i].path)) {  path_delete(_list[| i].path);    }

       // put in attack state
_list[| i].state = "attack range";

		_list[| i].emote.sprite_index = spr_Emote_Enemy_State_Attacking;

}
	   


   }
   

        }
    }
ds_list_destroy(_list);





// refresh
alarm[0] = ai_Refresh;