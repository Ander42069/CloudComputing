var enter_key = vk_enter;

// Si se presiona "Enter" y la opción seleccionada es "start"
if (keyboard_check_pressed(enter_key) && selected == 1) {
    room_goto_next();  // Ir a la siguiente sala
} else {
    // No hacer nada si no se cumple la condición
    return;
}