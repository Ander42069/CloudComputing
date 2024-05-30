/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (time < duration) {
    blink = ease_in_and_out(time, start, dest - start, duration);
    time++;
} else {
    var tempStart = start;
    start = dest;
    dest = tempStart;
    time = 0;
}

if (time2 < duration2) {
    wiggle = ease_in_and_out(time2, start2, dest2 - start2, duration2);
    time2++;
} else {
    var tempStart2 = start2;
    start2 = dest2;
    dest2 = tempStart2;
    time2 = 0;
}

// Manejo de entrada del teclado
var keyDown = keyboard_check_released(vk_down);
var keyUp = keyboard_check_released(vk_up);
var keyEnter = keyboard_check_pressed(vk_enter); // Detectar tecla Enter

if (keyDown) {
    draw_Extra = 0;
    switch (selected) {
        case 1: selected = 2; break;
        case 2: selected = 3; break;
        case 3: selected = 4; break;
        case 4: selected = 1; break;
    }
}

if (keyUp) {
    draw_Extra = 0;
    switch (selected) {
        case 1: selected = 4; break;
        case 2: selected = 1; break;
        case 3: selected = 2; break;
        case 4: selected = 3; break;
    }
}

// Ejecutar acción basada en la opción seleccionada
if (keyEnter) {
    switch (selected) {
        case 1:
            victory = false; // Continuar
            if (surface_exists(victorySurface)) {
                surface_free(victorySurface);
            }
            instance_activate_all();
            room_goto(level3); // Reiniciar la sala actual
            break;
        case 2:
            room_goto(Room_Gameplay); // Volver al menú
            break;
        case 3:
            room_goto(Menu); // Ir al siguiente nivel (asegúrate de que NextLevel es el nombre correcto de la sala)
            break;
    }
}