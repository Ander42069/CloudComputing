var enter_key = vk_enter;


if (keyboard_check_pressed(enter_key) && selected == 1 || mouse_check_button_pressed(mb_left) && selected == 1) {
    room_goto(Room_Gameplay);  
} else if (keyboard_check_pressed(enter_key) && selected == 2)
{
	
	
}else {
    return;
}