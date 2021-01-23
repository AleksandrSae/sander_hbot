include <./NopSCADlib/vitamins/kp_pillow_blocks.scad>
include <./NopSCADlib/vitamins/stepper_motors.scad>
include <./NopSCADlib/utils/core/core.scad>
include <./common_parts/prism.scad>
include <./common_parts/primitives.scad>
include <./mount_t8.scad>


kp08_bh_w = 55;
kp08_bh_l = 39;
kp08_bh_h = 18;

kp08_bh_h2 = 3;
kp08_bh_l2 = 3;
kp08_bh_prism_w = 3;
kp08_bh_mount_hole_len = 15;
kp08_bh_mount_hole_dia = 5.3;
kp08_bh_mount_hole_pos = kp08_bh_w/4;

module p08_bearing_holder() {
    difference() {
        union() {
            translate([0,0,kp08_bh_h - kp08_bh_h2])
                cube([kp08_bh_w, kp08_bh_l, kp08_bh_h2]);
            cube([kp08_bh_w, kp08_bh_l2, kp08_bh_h]);
            translate([kp08_bh_w / 2 + kp08_bh_prism_w / 2,kp08_bh_l2,0])
                rotate([90,0,180])
                    prism(kp08_bh_prism_w,kp08_bh_h - kp08_bh_h2,kp08_bh_l - kp08_bh_l2);
        };
        translate([kp08_bh_mount_hole_pos,
                   (kp08_bh_l+kp08_bh_l2)/2-kp08_bh_mount_hole_len/2,
                   kp08_bh_h-kp08_bh_h2-0.01])
            rotate([0,0,90])
                circle_rounded_cube(kp08_bh_mount_hole_len, kp08_bh_h2 + 0.02, kp08_bh_mount_hole_dia);
        translate([kp08_bh_w - kp08_bh_mount_hole_pos,
                   (kp08_bh_l+kp08_bh_l2)/2-kp08_bh_mount_hole_len/2,
                   kp08_bh_h-kp08_bh_h2-0.01])
            rotate([0,0,90])
                circle_rounded_cube(kp08_bh_mount_hole_len, kp08_bh_h2 + 0.02, kp08_bh_mount_hole_dia);
        translate([6.5,10,kp08_bh_h/2 - kp08_bh_h2/2]) rotate([90,0,0]) cylinder (d=5, 20);
        translate([-6.5 + kp08_bh_w,10,kp08_bh_h/2 - kp08_bh_h2/2]) rotate([90,0,0]) cylinder (d=5, 20);
    }
}

module z_axis() {
    translate([0,0,p08_z_axis_level - 9]) rotate([0,0,180]) kp_pillow_block(KP08_15);
    // leadscrew
    translate([0,0, z_axis_leadscrew_level]) color("green") cylinder(d=8, Z_AXIS_LEADSCREW_LEN);

    translate([-kp08_bh_w/2, 15, p08_z_axis_level - 16.5]) p08_bearing_holder();

    rotate([0,0,-90]) NEMA(NEMA17);
    translate([0,0,10]) %cylinder(d=20, 30);

}


p08_bearing_holder();
