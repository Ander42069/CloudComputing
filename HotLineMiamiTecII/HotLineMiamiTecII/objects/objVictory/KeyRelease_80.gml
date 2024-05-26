/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
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
