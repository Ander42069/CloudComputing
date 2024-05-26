

if (canTouchThis == true) {
	canTouchThis = false;
	
	
	// check where we "touched" the door		
var doorYY = y + lengthdir_y(12, image_angle);	
	
 //  make the angle normalised (0 to 360), add up if value is below 0
 var normalisedAngle = image_angle;	
	 while( normalisedAngle < 0) { normalisedAngle += 360; }
	
	
		// player is below door
	if (other.y > doorYY ){
	  if ( normalisedAngle >= 0 and normalisedAngle <= 90)    { doorSpeed   =  doorSpeedStart;   } 
	  if (normalisedAngle > 90  and normalisedAngle <=  180)  { doorSpeed   = -doorSpeedStart;   } 	

	  if (normalisedAngle > 180  and normalisedAngle <=  270) { doorSpeed = -doorSpeedStart;  }			
	  if (normalisedAngle > 270  and normalisedAngle <   360) { doorSpeed =  doorSpeedStart;  }
	}
	
	
		// player is on top of door
	    if (other.y < doorYY ) { 			
			if (normalisedAngle >= 0  and normalisedAngle <=   90)  { doorSpeed =  -doorSpeedStart; }
			if (normalisedAngle > 90  and normalisedAngle <=  180)  { doorSpeed =   doorSpeedStart; }	
			
			if (normalisedAngle > 180  and normalisedAngle <=  270) { doorSpeed =  doorSpeedStart;  }			
			if (normalisedAngle > 270  and normalisedAngle <   360) { doorSpeed = -doorSpeedStart;  }				
		}



}