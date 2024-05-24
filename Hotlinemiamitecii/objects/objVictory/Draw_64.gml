if (victory) { // Cambio aquí: Verificar victoria
    if (!surface_exists(victorySurface)) {
        victorySurface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
        surface_set_target(victorySurface);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();

        instance_deactivate_all(true);
    }

    var text_title = "!VICTORY!";
    var text_1 = "REINICIAR";
    var text_2 = "MENU";

    var scale = 1.5;
    var wiggle = 0;
    var color3 = c_black;
    var color2 = c_gray;
    var color = c_white;
    var color4 = c_red;
    var blink = 1;

    var surfaceWidth = surface_get_width(victorySurface);
    var surfaceHeight = surface_get_height(victorySurface);

    // Calcula las posiciones centradas para los textos
    var posX_title = (surfaceWidth - string_width(text_title) * scale) / 2 + 250 ;
    var posY_title = (surfaceHeight - string_height(text_title) * scale) / 2 - 200;

    var posX_1 = (surfaceWidth - string_width(text_1) * scale) / 2 + 100;
    var posY_1 = (surfaceHeight - string_height(text_1) * scale) / 2 - 50;

    var posX_2 = (surfaceWidth - string_width(text_2) * scale) / 2 + 100;
    var posY_2 = (surfaceHeight - string_height(text_2) * scale) / 2 + 50;

    // Dibuja el texto de victoria con la fuente personalizada
    draw_set_font(font_victory); // Establece la fuente personalizada
    draw_text_ext_transformed_color(posX_title, posY_title, text_title, 200, 200, scale, scale, wiggle, color3, color3, color3, color3, 1);
    draw_text_ext_transformed_color(posX_title, posY_title, text_title, 200, 200, scale, scale, wiggle, color2, color2, color2, color2, 1);
    draw_text_ext_transformed_color(posX_title - 2, posY_title - 2, text_title, 200, 100, scale, scale, wiggle, color, color, color, color, blink);

    // Restablece la fuente por defecto antes de dibujar otros textos
   

    // Dibuja el texto en el centro de la superficie
	 draw_set_font(font_options);
    draw_text_ext_transformed_color(posX_1, posY_1, text_1, 200, 200, scale, scale, wiggle, color3, color3, color3, color3, 1);
    draw_text_ext_transformed_color(posX_1, posY_1, text_1, 200, 200, scale, scale, wiggle, color2, color2, color2, color2, 1);
    draw_text_ext_transformed_color(posX_1 - 2, posY_1 - 2, text_1, 200, 100, scale, scale, wiggle, color, color, color, color, blink);

    draw_text_ext_transformed_color(posX_2, posY_2, text_2, 100, 100, scale, scale, wiggle, color3, color3, color3, color3, 1);
    draw_text_ext_transformed_color(posX_2, posY_2, text_2, 100, 100, scale, scale, wiggle, color2, color2, color2, color2, 1);
    draw_text_ext_transformed_color(posX_2, posY_2, text_2, 100, 100, scale, scale, wiggle, color, color, color, color, blink);

    var posY_Selected = posY_1;
    var posX_Selected = posX_1;
    var text_Selected = text_1;

    switch (selected) {
        case 1:
            posY_Selected = posY_1;
            posX_Selected = posX_1;
            text_Selected = text_1;
            break;
        case 2:
            posY_Selected = posY_2;
            posX_Selected = posX_2;
            text_Selected = text_2;
            break;
    }

    for (var i = 0; i < draw_Extra; i++) {
        draw_text_ext_transformed_color(posX_Selected + i, posY_Selected, text_Selected, 200, 200, scale, scale, wiggle, color3, color3, color3, color3, 1);
        draw_text_ext_transformed_color(posX_Selected + i, posY_Selected, text_Selected, 200, 200, scale, scale, wiggle, color4, color4, color4, color4, 1);
        draw_text_ext_transformed_color(posX_Selected - 2 + i, posY_Selected - 2, text_Selected, 200, 100, scale, scale, wiggle, color, color, color, color, blink);
    }
} else 
  
/// @description Inserte aquí la descripción
victory = instance_number(obj_enemy_White) == 0 && instance_number(obj_enemy_Red) == 0; // Nueva condición

if (victory) {
    if (!surface_exists(victorySurface)) {
        victorySurface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
        surface_set_target(victorySurface);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();

        instance_deactivate_all(true);
    }
} else {
    if (surface_exists(victorySurface)) {
        surface_free(victorySurface);
    }
    instance_activate_all();
}