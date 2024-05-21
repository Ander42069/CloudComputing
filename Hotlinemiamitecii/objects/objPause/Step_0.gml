/// @description Insert description here
// You can write your code in this editor


//hover
if ( time < duration) { 
	
	blink = ease_in_and_out(time, start, dest - start, duration);
	time++;
	}
else { 
	
	var tempStart = start;
	start = dest;
	dest = tempStart;
	time = 0;
	}
	
	
// change palm rotation
//wiggle
if ( time2 < duration2) { 
	
	wiggle = ease_in_and_out(time2, start2, dest2 - start2, duration2);
	time2++;
	}
else { 
	
	var tempStart2 = start2;
	start2 = dest2;
	dest2 = tempStart2;
	time2 = 0;
	}
	

// input

var keyDown = keyboard_check_released(vk_down);
var keyUp = keyboard_check_released(vk_up);


if (keyDown == 1) { draw_Extra = 0;
switch(selected) {
 case 1: selected = 2; break;
 case 2: selected = 3; break;
 case 3: selected = 4; break;
 case 4: selected = 1; break;
}}




if (keyUp == 1) { draw_Extra = 0;
switch(selected) {
 case 1: selected = 4; break;
 case 2: selected = 1; break;
 case 3: selected = 2; break;
 case 4: selected = 3; break;
}}
