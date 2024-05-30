/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
global.points = global.points + 100;

ds_list_add(global.partida_puntajes, score);

// Reiniciar el puntaje para la próxima partida (opcional)
score = 0;
