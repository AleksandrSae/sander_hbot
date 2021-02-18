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

module y_axis_mount() {
    translate([-2.5,0,0]) cube(5);
    //translate([0,0,0]) {
    //    translate([-29, 21-7, 0]) {
    //        %cube([70, 60, 27]);
    //    }
    //    translate([-29, 30, -30]) {
    //        %cube([70, 44, 30]);
    //    }
    //}
}

module y_axis() {
    translate(y_axis_pos) {
        translate(y_axis_rail_pos) rotate([0,0,90]) rotate([180,0,0]) MGN12_rail(MGN_12_RAIL_LEN);
        y_axis_mount();
    }
    translate(y_axis_bearing1_pos) {
        y_axis_bearing();
    }
    translate(y_axis_bearing2_pos) {
        y_axis_bearing();
    }
    //translate([FRAME_WIDTH/2 - 29, 21 + FRAME_LENGTH-42, 20]) {
    //    rotate([0,90,0])
    //        difference() {
    //            cylinder(h = 70, d = 14);
    //            translate([0,0,-0.5]) cylinder(h = 71, d = 12);
    //        }
    //}
}

// y_axis_bearing();
//
y_axis();
