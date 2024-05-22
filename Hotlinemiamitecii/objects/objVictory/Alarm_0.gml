/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
/// @description Insert description here
var reset_Time = animateTime;

if (Increase) {
    draw_Extra++;
    if (draw_Extra > draw_ExtraMax) {
        Increase = false;
    }
} else {
    draw_Extra--;
    if (draw_Extra < 0) {
        Increase = true;
        draw_Extra = 0;
        reset_Time = 60;
    }
}

alarm[0] = reset_Time; // Ajuste aquí
