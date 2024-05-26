draw_set_color(c_white); // Establece el color del texto a blanco
draw_set_font(Font_Scored); // Establece la fuente del texto

// Definir la distancia deseada desde el borde superior de la pantalla
var distance_from_top = 50; // Por ejemplo, 50 píxeles

// Obtiene el ancho y el alto de la pantalla
var screen_width = display_get_width();
var screen_height = display_get_height();

// Textos a mostrar
var text1 = "Partidas jugadas: " + string(global.partidas_jugadas); // Agregar el total de partidas jugadas
var text2 = "Tu puntaje ha sido: " + string(score);

// Calcula el ancho y alto de los textos
var text1_width = string_width(text1);
var text2_width = string_width(text2);
var text1_height = string_height(text1);
var text2_height = string_height(text2);

// Calcula la posición central para el primer texto
var text1_x = (screen_width - text1_width) / 2;
var text1_y = distance_from_top; // Cambia esta línea para ajustar la posición vertical del primer texto

// Calcula la posición central para el segundo texto, debajo del primero
var text2_x = (screen_width - text2_width) / 2;
var text2_y = text1_y + text1_height + 10; // Añadir un espacio entre los textos

// Dibuja los textos en las posiciones calculadas
draw_text(text1_x, text1_y, text1);
draw_text(text2_x, text2_y, text2);
