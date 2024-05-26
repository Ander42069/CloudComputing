/// @description Insert description here
// You can write your code in this editor
draw_self();



if (obj_Control.debug == true) {

var text = "Can touch this: " + string(canTouchThis);
draw_text(x,y-40, text);


var text2 = "doorSpeed: " + string(doorSpeed);
draw_text(x,y-60, text2);


var absoluteAngle = image_angle;

 while (absoluteAngle < 0) {  absoluteAngle += 360; }
 
 
draw_text(x,y-80, absoluteAngle);

}