/// @description Inserte aquí la descripción
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

alarm_set(0, reset_Time);