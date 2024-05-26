
 
if (instance_ToStickTo != noone) {
  if (instance_exists(instance_ToStickTo)) {
image_angle = instance_ToStickTo.image_angle_;

x = instance_ToStickTo.x + lengthdir_x(distance, image_angle- extraAngle);    
y = instance_ToStickTo.y + lengthdir_y(distance, image_angle- extraAngle);
  }

}