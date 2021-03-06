// Alexander Saechnikov, 2021

include <./common_parts/sh10.scad>
include <./common_parts/mgn12.scad>
include <./constants.scad>
include <./vars.scad>
include <./NopSCADlib/vitamins/pulleys.scad>
include <./NopSCADlib/vitamins/pulley.scad>
include <./NopSCADlib/vitamins/stepper_motors.scad>
include <./printed_parts/natjazhitel.scad>
use <./y_axis.scad>

module rods(x, distance, dia) {
    for (i=[0,1])
        translate([x*i,0,0])
            rotate([-90,0,0]) cylinder(distance, dia/2, dia/2);
}

module sh10a_holders(x,y) {
    for (i=[0,1])
        for (j=[0,1])
            translate([x*i,y*j,0])
                rotate([0,0,90])
                    color("silver") sh10a_holder();
}

module nema_motor_with_pulley() {
    NEMA(NEMA17);
    translate([0,0,4]) pulley(GT2x16x10_pulley);
}

module pulley_on_frame() {
    translate(pulley_on_frame_1_pos) pulley(GT2x20x10_toothed_idler);
    translate(pulley_on_frame_2_pos) pulley(GT2x20x10_toothed_idler);
}

module pulley_on_y_axis() {
    color("green") {
        translate(pulley_00_pos) pulley(GT2x20x10_plain_idler);
        translate(pulley_01_pos) pulley(GT2x20x10_plain_idler);
        translate(pulley_10_pos) pulley(GT2x20x10_plain_idler);
        translate(pulley_11_pos) pulley(GT2x20x10_plain_idler);
    }
}

module rods_and_holders() {
    translate([15,21,0]) sh10a_holders(FRAME_LENGTH + 60, FRAME_LENGTH - 42);
    dia = 9.8;
    color("silver") translate([8,21,20]) {
        rotate([0,90,0]) cylinder(FRAME_WIDTH-16, dia/2, dia/2);
        translate([0,FRAME_LENGTH-42,0])
            rotate([0,90,0]) cylinder(FRAME_WIDTH-16, dia/2, dia/2);
    }
}

module belts() {
    p1 = pulley_10_pos;
    p2 = pulley_on_frame_1_pos;
    p3 = pulley_on_motor1_pos;
    p4 = pulley_00_pos;
    p5 = pulley_01_pos;
    p6 = pulley_on_motor2_pos;
    p7 = pulley_on_frame_2_pos;
    p8 = pulley_11_pos;

    path = [ [p1.x, p1.y, -pulley_pr(GT2x20_plain_idler)],
             [p2.x, p2.y,  pulley_pr(GT2x20_plain_idler)],
             [p3.x, p3.y,  pulley_pr(GT2x16_pulley)],
             [p4.x, p4.y, -pulley_pr(GT2x20_plain_idler)],
             [p5.x, p5.y, -pulley_pr(GT2x20_plain_idler)],
             [p6.x, p6.y,  pulley_pr(GT2x16_pulley)],
             [p7.x, p7.y,  pulley_pr(GT2x20_plain_idler)],
             [p8.x, p8.y, -pulley_pr(GT2x20_plain_idler)]
           ];

    belt = GT2x10;
    translate([0,0,15]) belt(belt, path, 0, [0, 0]);
}

module natjazhiteli() {
    for (j = [0,1]) {
        translate([FRAME_WIDTH - 100,30+j*(FRAME_LENGTH-60),-15]) rotate([-90+180*j,0,0]) natjazhitel();
    }
    translate([30, 55, -15]) rotate([-90,0,-90]) corner_natjazhitel();
    translate([55, FRAME_LENGTH-30, -15]) rotate([90,180,0]) corner_natjazhitel();

    translate([34, 34, -11.75]) rotate([-90, 0,0]) color("blue") cylinder(FRAME_LENGTH - 67, r=0.7);
    translate([34, 34, -18.25]) rotate([-90, 0,0]) color("blue") cylinder(FRAME_LENGTH - 67, r=0.7);

    translate([35, 34, -11.75]) rotate([0,90,0]) color("blue") cylinder(390, r=0.7);
    translate([y_axis_pos.x, 46, -11.75]) rotate([0,90,0]) color("blue") cylinder(FRAME_WIDTH - y_axis_pos.x - 80, r=0.7);
    translate([35, 34, -18.25]) rotate([0,90,0]) color("blue") cylinder(y_axis_pos.x - 35, r=0.7);

    translate([35, FRAME_LENGTH - 34, - 18.25]) rotate([0,90,0]) color("blue") cylinder(390, r=0.7);
    translate([y_axis_pos.x, FRAME_LENGTH - 46, - 18.25]) rotate([0,90,0]) color("blue") cylinder(FRAME_WIDTH - y_axis_pos.x - 80, r=0.7);
    translate([35, FRAME_LENGTH - 34, - 11.75]) rotate([0,90,0]) color("blue") cylinder(y_axis_pos.x - 35, r=0.7);
}

module xy_axis() {
    rods_and_holders();
    translate(xy_motor1_pos) nema_motor_with_pulley();
    translate(xy_motor2_pos)
        rotate([0,0,180])
        nema_motor_with_pulley();
    pulley_on_frame();
    pulley_on_y_axis();
    belts();
    natjazhiteli();
    translate(y_axis_pos) y_axis();
}

translate (xy_axis_pos) xy_axis();
