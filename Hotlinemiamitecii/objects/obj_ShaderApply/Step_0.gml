/// @description Change value


var up   =  keyboard_check(ord("Q"));
var down =  keyboard_check(ord("E"));


if (up) { value +=0.01 }
if (down and value >0.01 ) { value -=0.01 }