draw_set_color(c_white); // Establece el color del texto a blanco
draw_set_font(Font_Scored); // Establece la fuente del texto

// Definir la distancia deseada desde el borde superior de la pantalla
var distance_from_top = 50; // Por ejemplo, 50 píxeles
var distance_between_texts = 30; // Espacio entre cada línea de texto, aumentado a 30 píxeles

// Obtiene el ancho de la pantalla
var screen_width = display_get_width();

// Texto inicial que indica el número total de partidas jugadas
var header_text = "Partidas jugadas: " + string(ds_list_size(global.partida_puntajes));
var header_width = string_width(header_text);
var header_x = (screen_width - header_width) / 2;
var header_y = distance_from_top;

// Dibuja el texto inicial
draw_text(header_x, header_y, header_text);

// Dibuja los puntajes almacenados en la lista
for (var i = 0; i < ds_list_size(global.partida_puntajes); i++) {
    var puntaje_text = "Puntaje de la partida " + string(i+1) + ": " + string(global.partida_puntajes[| i]);
    var puntaje_width = string_width(puntaje_text);
    var puntaje_x = (screen_width - puntaje_width) / 2;
    var puntaje_y = header_y + (i + 1) * distance_between_texts;
    
    draw_text(puntaje_x, puntaje_y, puntaje_text);
}
