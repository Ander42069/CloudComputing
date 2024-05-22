/// @description Inserte aquí la descripción
pause = !pause;

if (!pause) {
    if (surface_exists(pauseSurface)) {
        surface_free(pauseSurface);
    }
    instance_activate_all();
}
