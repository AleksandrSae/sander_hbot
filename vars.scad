// Aleksander Saechnikov, 2020
include <./constants.scad>

z_motor_balk_pos = [0, 0, 85];
z_motor_pos = [FRAME_WIDTH/2, FRAME_LENGTH - 74 /* measured size */  + 42 /* NEMA motor size *//2, z_motor_balk_pos.z];

heatbed_holder_pos = [z_motor_pos.x, z_motor_pos.y, 300];

z_axis_leadscrew_pos = [0, 0, 25];
p08_z_axis_level = FRAME_HIGHT - z_motor_balk_pos.z - 36 /* profile 30x30 size */;

// ------------------------------------------------------------------------------------
xy_axis_pos = [0,0,FRAME_HIGHT];

xy_motor1_pos = [-100, -100, xy_axis_pos.z];
xy_motor2_pos = [-100, FRAME_LENGTH - 100, xy_axis_pos.z];

// translate(xy_motor1_pos) cube([30, 30, 30]);
