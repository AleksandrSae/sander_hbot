module mount_t8_leadscrew() {
    x1 = 25;
    y1 = 28;
    z1 = 10;

    d1 = 10.5;
    d2 = 22;

    step_x = 12;
    step_y = 12;

    translate([-x1/2, -y1/2, 0]) {
        difference() {
            cube([x1,y1,z1]);

            translate([x1/2, y1/2, -0.05])
                cylinder(d=10,h=z1+0.1);

            translate([x1/2, y1/2, z1-3.99])
                cylinder(d=d2, h=4);

            for (i=[0,1]) {
                for (j=[0,1]) {
                    translate([i*step_x - step_x/2 + x1/2, j*step_y - step_y/2 + y1/2, -0.05])
                    cylinder(d=2.5, h=z1+0.1); // d - diametr otverstija dlia vinta 3mm
                }
            }
        }

        x2 = 50;
        y2 = 7;
        z2 = 30;

        translate([-x2/2 + x1/2, -y2, -z2 + z1])
        {
            difference() {
                cube([x2, y2, z2]);

                rotate([90,0,0])
                translate([6,z2/2,-0.05-y2])
                cylinder(d=4, h=y2+0.1);

                rotate([90,0,0])
                translate([x2-6,z2/2,-0.05-y2])
                cylinder(d=4, h=y2+0.1);
            }
        }

        x3 = 3;
        y3 = y1;
        z3 = z2-z1;

        difference() {
            translate([0, 0,-z3])
                cube([x3, y3, z3]);


            translate([-0.05, z3*sin(atan(z3/y3)), -36.25])
                rotate([atan(z3/y3), 0, 0])
                    cube([x3+0.1, y3+10, z3]);
        }

        translate([x1-x3, 0, 0])
        difference() {
            translate([0, 0,-z3])
                cube([x3, y3, z3]);


            translate([-0.05, z3*sin(atan(z3/y3)), -36.25])
                rotate([atan(z3/y3), 0, 0])
                    cube([x3+0.1, y3+10, z3]);
        }
    }
}
