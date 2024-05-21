/// @description Go back

path_delete(path);
path = path_add();


// use the mp grid, make a path, ride on it
mp_grid_path(obj_SetupPathway.grid, path, x,y, position_Start_X, position_Start_Y, 1 );

// ride on path
path_start(path, walkSpeed_Going_Back, path_action_stop, true);
