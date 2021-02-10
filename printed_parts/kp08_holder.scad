// Alexander Saechnikov, 2021

kp08_bh_w = 60;
kp08_bh_l = 39;
kp08_bh_h = 18;

kp08_bh_h2 = 3;
kp08_bh_l2 = 3;
kp08_bh_prism_w = 2;
kp08_bh_mount_hole_len = 15;
kp08_bh_mount_hole_dia = 5.3;
kp08_bh_mount_hole_pos = kp08_bh_w/4;

module kp08_holder() {
    difference() {
        union() {
            translate([0,0,kp08_bh_h - kp08_bh_h2])
                cube([kp08_bh_w, kp08_bh_l, kp08_bh_h2]);
            cube([kp08_bh_w, kp08_bh_l2, kp08_bh_h]);
            translate([kp08_bh_w / 2 + kp08_bh_prism_w / 2,kp08_bh_l2,0])
                rotate([90,0,180])
                    prism(kp08_bh_prism_w,kp08_bh_h - kp08_bh_h2,kp08_bh_l - kp08_bh_l2);
            translate([kp08_bh_prism_w, kp08_bh_l2,0])
                rotate([90,0,180])
                    prism(kp08_bh_prism_w,kp08_bh_h - kp08_bh_h2,kp08_bh_l - kp08_bh_l2);
            translate([kp08_bh_w ,kp08_bh_l2,0])
                rotate([90,0,180])
                    prism(kp08_bh_prism_w,kp08_bh_h - kp08_bh_h2,kp08_bh_l - kp08_bh_l2);
        };
        translate([kp08_bh_mount_hole_pos,
                   (kp08_bh_l+kp08_bh_l2)/2-kp08_bh_mount_hole_len/2 + 3,
                   kp08_bh_h-kp08_bh_h2-0.01])
            rotate([0,0,90])
                circle_rounded_cube(kp08_bh_mount_hole_len, kp08_bh_h2 + 0.02, kp08_bh_mount_hole_dia);
        translate([kp08_bh_w - kp08_bh_mount_hole_pos,
                   (kp08_bh_l+kp08_bh_l2)/2-kp08_bh_mount_hole_len/2 + 3,
                   kp08_bh_h-kp08_bh_h2-0.01])
            rotate([0,0,90])
                circle_rounded_cube(kp08_bh_mount_hole_len, kp08_bh_h2 + 0.02, kp08_bh_mount_hole_dia);
        translate([9,10,kp08_bh_h/2 - kp08_bh_h2/2]) rotate([90,0,0]) cylinder (d=5, 20);
        translate([-9 + kp08_bh_w,10,kp08_bh_h/2 - kp08_bh_h2/2]) rotate([90,0,0]) cylinder (d=5, 20);
    }
}

