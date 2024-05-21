/// @description Setup
// You can write your code in this editor

// instructions use q and e to change the value
// and therefor how much "glow" /"bloom" you will get

// grab the only changeable variable inside the shader
handler = shader_get_uniform(Shader_Bloom, "intensity");


value = 0.02;


//Shader by DukeSoft:
//https://forum.yoyogames.com/index.php?threads/free-bloom-glow-shader.11839/