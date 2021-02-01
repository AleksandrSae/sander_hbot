// Alexander Saechnikov, 2021

include <./common_parts/sh10.scad>
include <./common_parts/mgn12.scad>
include <./constants.scad>
include <./NopSCADlib/vitamins/pulleys.scad>
include <./NopSCADlib/vitamins/pulley.scad>

module rods(x, len, dia) {
    for (i=[0,1])
        translate([x*i,0,0])
            rotate([-90,0,0]) cylinder(len, dia/2, dia/2);
}

module sh10a_holders(x,y) {
    for (i=[0,1])
        for (j=[0,1])
            translate([x*i,y*j,0])
                rotate([0,0,90])
                    sh10a_holder();
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

module xy_axis() {
    rods_and_holders();
    translate([FRAME_WIDTH/2 ,FRAME_LENGTH/2 -  MGN_12_RAIL_LEN/2,0])
    rotate([0,0,90]) rotate([180,0,0]) MGN12_rail(MGN_12_RAIL_LEN);

    nema17_move_y = 30;
    translate([-21-5,21 + nema17_move_y,0]) NEMA(NEMA17);
    translate([-21-5,FRAME_LENGTH - 21 - nema17_move_y,0]) rotate([0,0,180]) NEMA(NEMA17);

    GT2x10 = ["GT", 2.0,  10, 1.38, 0.75, 0.254];
    GT2x16x10_pulley        = ["GT2x16_pulley",        "GT2",   16,  9.75, GT2x10,  7.0,  13, 5,   5, 13.0, 1.0,4.5,3.0,  M3_grub_screw, 2];

    translate([-26,nema17_move_y+21,5])
    pulley(GT2x16x10_pulley, colour = silver);
}

