/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
// Evento Draw GUI de obj_victory_message
// Evento Draw GUI de obj_victory_message
var msg = "¡Has ganado!";
var screen_width = display_get_width();
var screen_height = display_get_height();
var text_width = string_width(msg);
var text_height = string_height(msg);

// Calcular las coordenadas para el centro de la pantalla
var center_x = (screen_width - text_width) / 2;
var center_y = (screen_height - text_height) / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (font_exists(font_victory)) {
    draw_set_font(font_victory);
} else {
    draw_set_font(-1);
}

draw_set_color(c_white);
draw_text(center_x, center_y, msg);
