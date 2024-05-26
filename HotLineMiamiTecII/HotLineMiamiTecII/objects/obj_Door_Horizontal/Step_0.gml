
if ((  abs(doorSpeed) > 0)  ){

image_angle += doorSpeed;

image_angle  = image_angle % 360; // failsave, mudolo to not go over 360



// max values -> swing back in opposite direction
if (image_angle  < -140 ){ image_angle = -140;  doorSpeed =  abs(doorSpeed);     }
if (image_angle  >  140 ){ image_angle =  140;  doorSpeed = -abs(doorSpeed);     }



// reduce the door speed
if (doorSpeed > 0.2) {  doorSpeed -= 0.2; } 
 else if (doorSpeed < -0.2) {  doorSpeed += 0.2;  }
 else { doorSpeed = 0;  }


}

if (doorSpeed == 0 ) {  canTouchThis = true; }