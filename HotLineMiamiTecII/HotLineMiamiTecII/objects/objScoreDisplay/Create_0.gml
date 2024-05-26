/// Evento Draw de objScoreDisplay
if (variable_instance_exists(objVictory, "finalScore")) {
    scoreText = "Puntaje final: " + objVictory.finalScore;
} else {
    scoreText = "Puntaje final: No disponible";
}

draw_set_color(c_white); // Establece el color del texto a blanco
draw_set_font(Font_Scored); // Establece la fuente del texto

// Dibuja el texto en la posición deseada
draw_text(30, 30, scoreText);