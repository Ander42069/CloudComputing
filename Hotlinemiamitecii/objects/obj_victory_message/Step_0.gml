/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
// Evento Step de obj_victory_message
if (keyboard_check_pressed(vk_enter)) {
    room_goto(Room_Gameplay); // Reinicia la sala actual
    // o room_goto(sala_principal); // Cambia a la sala principal
}
