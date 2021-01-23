include <./constants.scad>
include <./vars.scad>

module heatbed_holder() {

    // Z-axis balk
    translate([-PROFILE_540/2,-36,-5])
        rotate([90,0,0])
            rotate([0,90,0])
                extrusion_profile_30x30(PROFILE_540);

    mount_t8_leadscrew();

}
