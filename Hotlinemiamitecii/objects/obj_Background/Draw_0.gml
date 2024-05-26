

var grabCamera_X = camera_get_view_x(view_camera[0]);
var grabCamera_Y = camera_get_view_y(view_camera[0]);

var grabCamera_Width  = camera_get_view_width(view_camera[0]);
var grabCamera_Height = camera_get_view_height(view_camera[0]);
var buffer_ = 60;


hue += 0.2;
if (hue > 255) { hue = 0;  }


color1 = make_color_hsv(hue, 120,120);

draw_rectangle_color(grabCamera_X-buffer_, grabCamera_Y-buffer_, 
                     grabCamera_X+grabCamera_Width+buffer_, grabCamera_Y+grabCamera_Height+buffer_,
					 color1, color1, color2,color2, 0); 

