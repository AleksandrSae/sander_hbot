include <./constants.scad>
include <./vars.scad>
include <./frame.scad>
include <./z_axis.scad>
include <./xy_axis.scad>
include <./printed_parts/heatbed_holder.scad>

frame();
translate (heatbed_holder_pos) heatbed_holder();
translate (z_motor_pos) z_axis();
//translate (xy_axis_pos) xy_axis();
