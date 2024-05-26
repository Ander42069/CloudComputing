/// @description Adds a "Score" button to the existing menu with animation and effects.

// Define text and scale
var text = "Menue" + " \n" + " Setting" + " \n" + " quit ";
var scale = 3;

// Define texts for buttons
var text_1 = "Jugar";
var text_2 = "Login";
var text_3 = "Score";

// Define positions for buttons
var posY_1 = 50;
var posY_2 = 100;
var posY_3 = 150;

// Draw "Jugar" button
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height + posY_1, text_1, 200, 200, scale, scale, wiggle, color3, color3, color3, color3, 1); // black background
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height + posY_1, text_1, 200, 200, scale, scale, wiggle, color2, color2, color2, color2, 1);
draw_text_ext_transformed_color(grabCamera_Width - 2, grabCamera_Height + posY_1 - 2, text_1, 200, 100, scale, scale, wiggle, color, color, color, color, blink); // blink white

// Draw "Login" button
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height + posY_2, text_2, 100, 100, scale, scale, wiggle, color3, color3, color3, color3, 1);
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height + posY_2, text_2, 100, 100, scale, scale, wiggle, color2, color2, color2, color2, 1);
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height + posY_2, text_2, 100, 100, scale, scale, wiggle, color, color, color, color, blink); // blink

// Draw "Score" button
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height + posY_3, text_3, 150, 150, scale, scale, wiggle, color3, color3, color3, color3, 1); // black background
draw_text_ext_transformed_color(grabCamera_Width, grabCamera_Height + posY_3, text_3, 150, 150, scale, scale, wiggle, color2, color2, color2, color2, 1);
draw_text_ext_transformed_color(grabCamera_Width - 2, grabCamera_Height + posY_3 - 2, text_3, 150, 150, scale, scale, wiggle, color, color, color, color, blink); // blink white

// Define selected button variables
var posY_Selected = posY_1;
var text_Selected = text_1;

// Switch to select button
switch (selected) { 
    case 1:
        posY_Selected = posY_1;
        text_Selected = text_1;
        break;
    case 2:
        posY_Selected = posY_2;
        text_Selected = text_2;
        break;
    case 3:
        posY_Selected = posY_3;
        text_Selected = text_3;
        break;
}

// Draw selected button with extra effect
for (var i = 0; i < draw_Extra; i++) {
    draw_text_ext_transformed_color(grabCamera_Width + i, grabCamera_Height + posY_Selected, text_Selected, 200, 200, scale, scale, wiggle, color3, color3, color3, color3, 1);
    draw_text_ext_transformed_color(grabCamera_Width + i, grabCamera_Height + posY_Selected, text_Selected, 200, 200, scale, scale, wiggle, color4, color4, color4, color4, 1);
    draw_text_ext_transformed_color(grabCamera_Width - 2 + i, grabCamera_Height + posY_Selected - 2, text_Selected, 200, 100, scale, scale, wiggle, color, color, color, color, blink); // blink white
}
