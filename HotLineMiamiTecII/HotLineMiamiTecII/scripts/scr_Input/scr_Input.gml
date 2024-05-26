// Skriptelemente wurden für v2.3.0 geändert, weitere Informationen sind unter
// https://help.yoyogames.com/hc/en-us/articles/360005277377 verfügbar
function scr_Input(){

// input + movement
var left  = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up    = keyboard_check(ord("W"));
var down  = keyboard_check(ord("S"));

// are we using the keyboard?
if (left == 1 or right == 1 or up == 1 or down == 1 or left == 1 ) { control = "keyboard";  }

var horizontalSpeed = right - left;
var verticalSpeed   = down - up;


// or are we over riding to use the gamepad
	var haxis = gamepad_axis_value(0, gp_axislh);
	var vaxis = gamepad_axis_value(0, gp_axislv);

if (haxis == 1 or vaxis == 1) {  control = "gamepad";  }

if (control == "gamepad") {
 horizontalSpeed = haxis;
 verticalSpeed   = vaxis;
}


var result_h = (horizontalSpeed) * (walkSpeed+1);
var result_v = (verticalSpeed)   * (walkSpeed+1);
 
if ( !place_meeting(x+ result_h, y, obj_Wall )) {
x += horizontalSpeed * walkSpeed; 
}


if ( !place_meeting(x,y+result_v, obj_Wall )) {
y += verticalSpeed   * walkSpeed; 
    }


} // end script