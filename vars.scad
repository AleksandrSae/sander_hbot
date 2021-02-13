// Aleksander Saechnikov, 2020

include <./constants.scad>
include <./NopSCADlib/vitamins/pulleys.scad>
include <./NopSCADlib/vitamins/pulley.scad>
include <./NopSCADlib/vitamins/belts.scad>
include <./NopSCADlib/vitamins/belt.scad>

z_motor_balk_pos = [0, 0, 85];
z_motor_pos = [FRAME_WIDTH/2, FRAME_LENGTH - 74 /* measured size */  + 42 /* NEMA motor size *//2, z_motor_balk_pos.z];

heatbed_holder_pos = [z_motor_pos.x, z_motor_pos.y, 300];

z_axis_leadscrew_pos = [0, 0, 25];
p08_z_axis_level = FRAME_HIGHT - z_motor_balk_pos.z - 36 /* profile 30x30 size */;

xy_axis_pos = [0,0,FRAME_HIGHT];
y_axis_pos = [FRAME_WIDTH/2 - 100, 0, 0];

xy_motors_y_offset = 51;
xy_motor1_pos = [-25, xy_motors_y_offset, 0];
xy_motor2_pos = [-25, FRAME_LENGTH - xy_motors_y_offset, 0];

pulley_on_frame_1_pos = [FRAME_WIDTH - 15, xy_motor1_pos.y + 0.5, 9];
pulley_on_frame_2_pos = [FRAME_WIDTH - 15, xy_motor2_pos.y, 9];

pulley_on_motor1_pos = xy_motor1_pos;
pulley_on_motor2_pos = xy_motor2_pos;

pulley_x_offset1 = 20;
pulley_x_offset2 = 20;

pulley_16_offset = pulley_pr(GT2x16x10_pulley);
pulley_20_offset = pulley_pr(GT2x20x10_plain_idler);

pulley_00_pos = [y_axis_pos.x - pulley_x_offset1, pulley_on_frame_1_pos.y + pulley_16_offset + pulley_20_offset, 9];
pulley_10_pos = [y_axis_pos.x + pulley_x_offset1, pulley_on_frame_1_pos.y + 2*pulley_20_offset, 9];
pulley_01_pos = [y_axis_pos.x - pulley_x_offset2, pulley_on_frame_2_pos.y - pulley_16_offset - pulley_20_offset, 9];
pulley_11_pos = [y_axis_pos.x + pulley_x_offset2, pulley_on_frame_2_pos.y - 2*pulley_20_offset, 9];

