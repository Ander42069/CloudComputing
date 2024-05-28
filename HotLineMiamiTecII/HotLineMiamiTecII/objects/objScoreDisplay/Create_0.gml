/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
// Event: Game Start (obj_game_start)
if (!variable_global_exists("partida_puntajes")) {
    global.partida_puntajes = ds_list_create();
}