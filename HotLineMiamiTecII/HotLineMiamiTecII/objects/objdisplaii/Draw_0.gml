/// @description Inserte aquí la descripción
// Dibuja la puntuación obtenida en la victoria

var points = 0;

// Cargar la puntuación desde el archivo
if (file_exists("score.sav")) {
    var file = file_text_open_read("score.sav");
    points = real(file_text_read_string(file));
    file_text_close(file);
}

// Prepara el texto a mostrar
var display_text = "Puntuación obtenida: " + string(points);
