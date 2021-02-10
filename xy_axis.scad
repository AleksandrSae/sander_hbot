// Alexander Saechnikov, 2021

include <./common_parts/sh10.scad>
include <./common_parts/mgn12.scad>
include <./constants.scad>
include <./NopSCADlib/vitamins/pulleys.scad>
include <./NopSCADlib/vitamins/pulley.scad>
include <./natjazhitel.scad>

GT2x10 = ["GT", 2.0,  10, 1.38, 0.75, 0.254];
GT2x16x10_pulley        = ["GT2x16_pulley",        "GT2",   16,  9.75, GT2x10,  10.0,  13, 5,   5, 13.0, 1.0,4.5,3.0,  M3_grub_screw, 2];
GT2x20x10_toothed_idler = ["GT2x20_toothed_idler", "GT2",   20, 12.22, GT2x10,  10,  18, 0,   4, 18.0, 1.0, 0, 0,    false,         0];
GT2x16x10_plain_idler   = ["GT2x16_plain_idler",   "GT2",    0,  9.63, GT2x10,  10,  13, 0,   3, 13.0, 1.0, 0, 0,    false,         0];
nema17_move_y = 30;

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

module nema_motor_with_pulley() {
    NEMA(NEMA17);
    translate([0,0,4]) pulley(GT2x16x10_pulley);
}

module pulley_on_frame() {

    translate([FRAME_WIDTH-15,nema17_move_y + 21,9]) pulley(GT2x20x10_toothed_idler);
    translate([FRAME_WIDTH-15,FRAME_LENGTH - nema17_move_y - 21 ,9]) pulley(GT2x20x10_toothed_idler);

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

module y_axis() {
    translate([FRAME_WIDTH/2, FRAME_LENGTH/2 - MGN_12_RAIL_LEN/2, 0]) {
        rail_z_pos = 8;
        x_center = 6; // MGN12 / 2
        y_pulley_width = 30;
        y_pulley_depth = 28;
        translate([0,0,rail_z_pos]) rotate([0,0,90]) rotate([180,0,0]) MGN12_rail(MGN_12_RAIL_LEN);
        for (i=[0,1]) {
            for (j=[0,1]) {
                translate([i*y_pulley_width + x_center - y_pulley_width/2, y_pulley_depth + j*(MGN_12_RAIL_LEN - 2*y_pulley_depth), 9]) pulley(GT2x16x10_plain_idler);
            }
        }
    }
    translate([FRAME_WIDTH/2 - 29, 21, 20]) {
        rotate([0,90,0])
            difference() {
                cylinder(h = 70, d = 14);
                translate([0,0,-0.5]) cylinder(h = 71, d = 12);
            }
    }
    translate([FRAME_WIDTH/2 - 29, 21 + FRAME_LENGTH-42, 20]) {
        rotate([0,90,0])
            difference() {
                cylinder(h = 70, d = 14);
                translate([0,0,-0.5]) cylinder(h = 71, d = 12);
            }
    }
    translate([FRAME_WIDTH/2 - 29, 21-7, 0]) {
        %cube([70, 60, 27]);
    }
    translate([FRAME_WIDTH/2 - 29, 30, -30]) {
        %cube([70, 44, 30]);
    }
}

module belts(params) {
    // Pulley and idlers
    /*for (i=[0,1]) {
        for (j=[0,1]) {
            translate([i*y_pulley_width + x_center - y_pulley_width/2, y_pulley_depth + j*(MGN_12_RAIL_LEN - 2*y_pulley_depth), 9]) pulley(GT2x16x10_plain_idler);
        }
    }*/


    motor1_pos = params[0];
    motor2_pos = params[1];

    motor_pulley_top = params[2];

    //translate(motor1_pos) cube([10,10,10]);



    dx1 = 15;
    dx2 = 290;

    dy1 = 145;
    dy2 = 160;

    p1 = [ dx1, -dy1]; 
    p2 = [ dx2, -dy2]; 
    p3 = [-dx2, -dy2]; 
    p4 = [-dx1, -dy1]; 
    p5 = [-dx1, dy1]; 
    p6 = [-dx2, dy2]; 
    p7 = [dx2, dy2]; 
    p8 = [dx1, dy1]; 

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
    belt(belt, path, 0, [dx1, 0]);
}

module natjazhiteli() {
    for (j = [0,1]) {
        translate([FRAME_WIDTH - 100,30+j*(FRAME_LENGTH-60),-15]) rotate([-90+180*j,0,0]) natjazhitel();
    }
    translate([30,55,-15]) rotate([-90,0,-90]) corner_natjazhitel();
    translate([55,FRAME_LENGTH-30,-15]) rotate([90,180,0]) corner_natjazhitel();
}

module xy_axis() {
    rods_and_holders();

//    translate([-150,0,0])
    y_axis();

    translate([-21-5,21 + nema17_move_y,0]) nema_motor_with_pulley();
    translate([-21-5,FRAME_LENGTH - 21 - nema17_move_y,0]) rotate([0,0,180]) nema_motor_with_pulley();
    pulley_on_frame();
    translate([FRAME_WIDTH/2, FRAME_LENGTH/2, 15]) 
        belts([[10, 10, -100] /* Motor 1 pos */
              ,[10, 10, 500] /* Motor 2 pos */
              ,10 /* from motor to belt bottom */
              ]);
    natjazhiteli();
}

