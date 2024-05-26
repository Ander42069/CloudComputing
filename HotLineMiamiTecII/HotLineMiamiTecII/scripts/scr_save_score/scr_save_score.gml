// Los recursos de Script han cambiado para la v2.3.0 Consulta
function save_score(score) {
    var file_path = "score.txt";
    var file = file_text_open_write(file_path);
    file_text_write_string(file, string(score));
    file_text_close(file);
}

function load_score() {
    var file_path = "score.txt";
    if (file_exists(file_path)) {
        var file = file_text_open_read(file_path);
        var saved_score = file_text_read_string(file);
        file_text_close(file);
        return real(saved_score);
    } else {
        return 0;
    }
}
