// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scr_save_score(){

function save_score() {
    var score_file = "score.sav";
    var file = file_text_open_write(score_file);
    file_text_write_string(file, string(global.points));
    file_text_close(file);
}

}