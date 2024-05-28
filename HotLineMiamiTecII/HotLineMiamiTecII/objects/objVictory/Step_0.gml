/// @description Insert description here

//hover
if (time < duration) {
    blink = ease_in_and_out(time, start, dest - start, duration);
    time++;
} else {
    var tempStart = start;
    start = dest;
    dest = tempStart;
    time = 0;
}

// change palm rotation
//wiggle
if (time2 < duration2) {
    wiggle = ease_in_and_out(time2, start2, dest2 - start2, duration2);
    time2++;
} else {
    var tempStart2 = start2;
    start2 = dest2;
    dest2 = tempStart2;
    time2 = 0;
}

// input
var keyDown = keyboard_check_released(vk_down);
var keyUp = keyboard_check_released(vk_up);
var keyEnter = keyboard_check_pressed(vk_enter); // Detect Enter key

if (keyDown) {
    draw_Extra = 0;
    switch (selected) {
        case 1: selected = 2; break;
        case 2: selected = 3; break;
        case 3: selected = 4; break;
        case 4: selected = 1; break;
    }
}

if (keyUp) {
    draw_Extra = 0;
    switch (selected) {
        case 1: selected = 4; break;
        case 2: selected = 1; break;
        case 3: selected = 2; break;
        case 4: selected = 3; break;
    }
}

// Execute action based on selected option
if (keyEnter) {
    switch (selected) {
        case 1:
            victory = false; // Continuar
            if (surface_exists(victorySurface)) {
                surface_free(victorySurface);
            }
            instance_activate_all();
            room_restart(); // Reiniciar la sala actual

            break;
        case 2:
            room_goto(Menu); // Volver (cambiar sala a Menu)
			
            break;
     
    }
}
