include <./constants.scad>
include <./vars.scad>
include <./common_parts/extrusion_profile_30x30.scad>
include <./common_parts/square_tubes.scad>


module frame() {
    //         ----------10---------
    //        /|                  /|
    //     11/ |               12/ |
    //      /__|______9_________/  |
    //      |  |                |  |
    //      |  |                |  |
    //      |  |7               |  |8
    //      |  |                |  |
    //      |5 |                |6 |
    //      |  |---------4------|--|
    //      |  |                |  |
    //      |  .                |  .
    //      | /                 | /
    //      |/2                 |/3
    //      |_________1_________|

    // 1
    translate([30,0,0])
        rotate([90,0,0])
            rotate([0,90,0])
                square_tube_15x30(SQUARE_TUBE_15x30x450, center=false);
    // 2
    translate([0,30,15])
            rotate([-90,0,0])
                square_tube_15x30(SQUARE_TUBE_15x30x360, center=false);

    // 3
    translate([FRAME_WIDTH-30,30,15])
            rotate([-90,0,0])
                square_tube_15x30(SQUARE_TUBE_15x30x360, center=false);

    // 4
    translate([30,FRAME_LENGTH-15,z_motor_balk_level-15])
        rotate([90,0,0])
            rotate([0,90,0])
                extrusion_profile_30x30(PROFILE_450);

    // check
    // translate([30,FRAME_LENGTH,0])
    //     color("red")
    //         cube([10,10,85]);

    // 5
    translate([15,15,0])
        extrusion_profile_30x30(PROFILE_450);

    // 6
    translate([FRAME_WIDTH-15,15,0])
        extrusion_profile_30x30(PROFILE_450);

    // 7
    translate([15,FRAME_LENGTH-15,0])
        extrusion_profile_30x30(PROFILE_450);

    // 8
    translate([FRAME_WIDTH-15,FRAME_LENGTH-15,0])
        extrusion_profile_30x30(PROFILE_450);

    // 9
    translate([30,15,FRAME_HIGHT-15])
        rotate([90,0,0])
            rotate([0,90,0])
                extrusion_profile_30x30(PROFILE_450);

    // 10 
    translate([30,FRAME_LENGTH-15,FRAME_HIGHT-15])
        rotate([90,0,0])
            rotate([0,90,0])
                extrusion_profile_30x30(PROFILE_450);

    // 11 
    translate([15,0,FRAME_HIGHT-15])
            rotate([-90,0,0])
                extrusion_profile_30x30(PROFILE_420);

    // 12 
    translate([FRAME_WIDTH-15,0,FRAME_HIGHT-15])
            rotate([-90,0,0])
                extrusion_profile_30x30(PROFILE_420);

}
