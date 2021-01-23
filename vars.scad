// Aleksander Saechnikov, 2020
include <./constants.scad>

z_motor_balk_level = 85;
z_motor_position = [FRAME_WIDTH/2, FRAME_LENGTH - 74 /* measured size */  + 42 /* NEMA motor size *//2, z_motor_balk_level];
heatbed_holder_pos = [z_motor_position[0], z_motor_position[1], 300];
z_axis_leadscrew_level = 25;
p08_z_axis_level = FRAME_HIGHT - z_motor_balk_level - 36 /* profile 30x30 size */; 
