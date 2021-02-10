include <./NopSCADlib/vitamins/kp_pillow_blocks.scad>
include <./NopSCADlib/vitamins/stepper_motors.scad>
include <./NopSCADlib/utils/core/core.scad>
include <./common_parts/prism.scad>
include <./common_parts/primitives.scad>
include <./printed_parts/mount_t8.scad>
include <./printed_parts/kp08_holder.scad>


module z_axis() {
    translate([0,0,p08_z_axis_level - 4.5]) rotate([0,0,180]) kp_pillow_block(KP08_15);
    translate(z_axis_leadscrew_level) color("green") cylinder(d=8, Z_AXIS_LEADSCREW_LEN);
    translate([-kp08_bh_w/2, 15, p08_z_axis_level - 12]) kp08_holder();
    rotate([0,0,-90]) NEMA(NEMA17);
    translate([0,0,10]) %cylinder(d=20, 30);
}
