var enter_key = vk_enter;
var _login_url = "http://localhost:3000";


if (keyboard_check_pressed(enter_key) && selected == 1) {
	room_goto(Room_Gameplay);
	global.partidas_jugadas += 1;
} else if (keyboard_check_pressed(enter_key) && selected == 2) {
	url_open(_login_url);
} else if (selected == 3) {
        room_goto(Score);
    
} else {
    return;
}