/// @description Inserte aquí la descripción

if (pause) {
    if (!surface_exists(pauseSurface)) {
        pauseSurface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
        surface_set_target(pauseSurface);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();

        instance_deactivate_all(true);
    }

    draw_surface(pauseSurface, 0, 0);

    var text_1 = "CONTINUAR";
    var text_2 = "MENU";

    var scale = 1.5;
    var wiggle = 0;
    var color3 = c_black;
    var color2 = c_gray;
    var color = c_white;
    var color4 = c_red;
    var blink = 1;

    var surfaceWidth = surface_get_width(pauseSurface);
    var surfaceHeight = surface_get_height(pauseSurface);

    // Calcula las posiciones centradas para los textos
    var posX_1 = (surfaceWidth - string_width(text_1) * scale) / 2;
    var posY_1 = (surfaceHeight - string_height(text_1) * scale) / 2 - 50;

    var posX_2 = (surfaceWidth - string_width(text_2) * scale) / 2;
    var posY_2 = (surfaceHeight - string_height(text_2) * scale) / 2 + 50;

    // Dibuja el texto en el centro de la superficie
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
} else {
    if (surface_exists(pauseSurface)) {
        surface_free(pauseSurface);
    }
    instance_activate_all();
    draw_text(1200, 64, string(score));
}
