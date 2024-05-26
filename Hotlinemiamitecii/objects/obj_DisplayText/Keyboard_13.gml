var enter_key = vk_enter;
var _login_url = "http://localhost:4000/auth/google";

if (keyboard_check_pressed(enter_key) && selected == 1) {
	room_goto(Room_Gameplay);
	
} else if (keyboard_check_pressed(enter_key) && selected == 2) {
	url_open(_login_url);
} else {
    return;
}
