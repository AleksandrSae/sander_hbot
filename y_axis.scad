// Alexander Saechnikov, 2021

include <./common_parts/sh10.scad>
include <./common_parts/mgn12.scad>
include <./constants.scad>
include <./vars.scad>
include <./NopSCADlib/vitamins/pulleys.scad>
include <./NopSCADlib/vitamins/pulley.scad>
include <./NopSCADlib/vitamins/stepper_motors.scad>
include <./printed_parts/natjazhitel.scad>

module y_axis_bearing() {
    translate([-35,0,0])
        rotate([0,90,0]) {
            difference() {
                color("green") cylinder(h = 70, d = 14);
                translate([0,0,-0.5]) cylinder(h = 71, d = 12);
            }
            difference() {
                color("lightgreen") union() {
                    cylinder(h = 10, d = 11.9);
                    translate([0,0,60]) cylinder(h = 10, d = 11.9);
                }
                translate([0,0,-0.5]) cylinder(h = 71, d = 10);
            }
        }
}

module y_axis_mount_plate() {
    hull() {
        translate([-30, 35]) circle(r=1);
        translate([30, 35]) circle(r=1);
        translate([-pulley_x_offset1, pulley_00_pos.y, 0]) color("red") circle(h=5, r=10);
        translate([pulley_x_offset1, pulley_10_pos.y, 0]) color("red") circle(h=5, r=10);
    }
}

module y_axis_mount() {
    // translate([-2.5,0,0]) cube(5);
    translate([0,0,0]) {
        //difference() {
        //    union() {
        //        translate([-30, 21-7, 0]) {
        //            %cube([60, 55, 27]);
        //}
        //        translate([-30, 30, -30]) {
        //            %cube([60, 39, 30]);
        //        }
        //    };
            translate([0, 0, 22]) linear_extrude(3) y_axis_mount_plate();
            translate([0, 0, 0]) linear_extrude(8) y_axis_mount_plate();
            
        //}
    }
}

module y_axis() {
    translate(y_axis_rail_pos) rotate([0,0,90]) rotate([180,0,0]) MGN12_rail(MGN_12_RAIL_LEN);

    color("lightgreen") {
        y_axis_mount();
        translate([0,FRAME_LENGTH,0]) rotate([0,0,180]) y_axis_mount();
    }

    translate(y_axis_bearing1_pos) {
        y_axis_bearing();
    }
    translate(y_axis_bearing2_pos) {
        y_axis_bearing();
    }
}

y_axis();
