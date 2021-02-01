// Alexander Saechnikov, 2021

include <./common_parts/sh10.scad>
include <./constants.scad>

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

module xy_axis() {
    translate([15,21,0]) sh10a_holders(FRAME_LENGTH + 60, FRAME_LENGTH - 42);
    dia = 9.8;
    color("silver") translate([8,21,20]) {
        rotate([0,90,0]) cylinder(FRAME_WIDTH-16, dia/2, dia/2);
        translate([0,FRAME_LENGTH-42,0])
            rotate([0,90,0]) cylinder(FRAME_WIDTH-16, dia/2, dia/2);
    }
}

