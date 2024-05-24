var clicked = false; // Declare clicked outside the function

function get_hover() {
    var _mouseX = device_mouse_x_to_gui(0);
    var _mouseY = device_mouse_y_to_gui(0);
    var isHovered = point_in_rectangle(_mouseX, _mouseY, x, y, x + width, y + height);

    if (isHovered) {
        if (mouse_check_button_pressed(mb_left)) {
            clicked = true;
        }
        if (mouse_check_button_released(mb_left)) {
            if (clicked) {
                // Button was clicked
                // Open the website in the default browser
                url_open("http://localhost:3000/");
            }
            clicked = false; // Reset the clicked state
        }
    }

    return isHovered;
}
