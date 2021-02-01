include <./constants.scad>
include <./vars.scad>
include <./frame.scad>
include <./z_axis.scad>
include <./xy_axis.scad>
include <./heatbed_holder.scad>

frame();
translate (heatbed_holder_pos) color("red") heatbed_holder();
translate (z_motor_position) z_axis();
translate (xy_axis_pos) xy_axis();
