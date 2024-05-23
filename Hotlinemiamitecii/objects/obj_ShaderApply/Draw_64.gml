/// @description Apply Shader

shader_set(Shader_Bloom);

// change the only changeable variable inside the shader
shader_set_uniform_f(handler , value);
draw_surface(application_surface,0,0);

shader_reset();