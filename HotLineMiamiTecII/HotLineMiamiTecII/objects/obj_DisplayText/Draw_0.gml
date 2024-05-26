/// @description Insert description here
// You can write your code in this editor

var text = "Menue" + " \n" + " Setting" + " \n" + " quit ";
var scale = 3;

var text_1 = "Jugar";
var text_2 = "Login";




draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_1, text_1, 200,200, scale, scale, wiggle, color3,color3,color3,color3, 1 ); // black background
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_1, text_1, 200,200, scale, scale, wiggle, color2,color2,color2,color2, 1 );
draw_text_ext_transformed_color(grabCamera_Width-2, grabCamera_Height+ posY_1-2, text_1, 200,100, scale, scale, wiggle, color,color,color,color, blink ); // blink white


draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_2, text_2, 100,100, scale, scale, wiggle, color3,color3,color3,color3, 1 );
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_2, text_2, 100,100, scale, scale, wiggle, color2,color2,color2,color2, 1 );
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height+ posY_2, text_2, 100,100, scale, scale, wiggle, color,color,color,color, blink ); // blink





var posY_Selected = 1;
var text_Selected = text_1;

switch(selected){ 
	case 1:
	posY_Selected = posY_1;
    text_Selected = text_1; break;

	case 2:
	posY_Selected = posY_2;
    text_Selected = text_2; break;

	

	}


for (var i = 0; i < draw_Extra; i++ ) {
draw_text_ext_transformed_color(grabCamera_Width+i  , grabCamera_Height+ posY_Selected,    text_Selected, 200,200, scale, scale, wiggle, color3,color3,color3,color3, 1 );
draw_text_ext_transformed_color(grabCamera_Width+i  , grabCamera_Height+ posY_Selected,    text_Selected, 200,200, scale, scale, wiggle, color4,color4,color4,color4, 1 );
draw_text_ext_transformed_color(grabCamera_Width-2+i, grabCamera_Height+ posY_Selected-2,  text_Selected, 200,100, scale, scale, wiggle, color,color,color,color, blink ); // blink white

}