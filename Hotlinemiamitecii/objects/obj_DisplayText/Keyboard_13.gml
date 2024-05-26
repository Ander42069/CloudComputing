var enter_key = vk_enter;

if (keyboard_check_pressed(enter_key) && selected == 1) {
    room_goto(Room_Gameplay);
} else if (keyboard_check_pressed(enter_key) && selected == 2) {
    var clicked = true;
    if (clicked) {
        // Button was clicked
        // Open the website in the default browser
        url_open("http://localhost:3000/");
    }
    clicked = false; // Reset the clicked state
} else if (keyboard_check_pressed(enter_key) && selected == 3) {
    room_goto(Score);
} else {
    return;
}
