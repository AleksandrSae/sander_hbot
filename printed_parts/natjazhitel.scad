// Alexander Saechnikov, 2021

// Export list:

// natjazhitel
// natjazhitel2
// corner_natjazhitel

module podlozhka() {
    $fn=100;

    length = 30;
    width = 20;
    height = 2;

    difference() {
        union() {
            cube([length, width, height]);
            translate([0,width/2,0]) cylinder(r=width/2, h=height);
            translate([length,width/2,0]) cylinder(r=width/2, h=height);
        };
        translate([-1,width/2,-0.01]) cylinder(r=2.5, r2=5, h=height+0.02);
        translate([length+1,width/2,-0.01]) cylinder(r=2.5, r2=5, h=height+0.02);
    }
};

module napliv(r=5, l=10) {
    difference() {
        cube ([r,r,l]);
        translate([0,0,-0.01])
        cylinder(r=r,h=l+0.02, $fn=50);
    }
}

module stenka() {
    height = 2;

    difference() {
        union() {
            translate([-9,0,0]) cube([18,8,2]);
            translate([0,8,0]) cylinder(r=9, h=height, $fn=100);
        }
        color("red") translate([-15,-13,-0.01]) cube([30,15,height+0.02]);
        translate([0,10,-0.01]) cylinder(r=2.1, height+0.02, $fn=100);
    }

    translate([-9,4,4]) rotate([270,0,-90]) napliv(r=2,l=18);
    translate([9,4,-2]) rotate([90,0,-90]) napliv(r=2,l=18);
}


module natjazhitel() {
    translate([1,-10,0]) {
        color("lightblue") {
            podlozhka();

            translate([15,2,0]) {
                translate([0,3-0.5,0]) rotate([90,0,0]) stenka();
                translate([0,9,0]) rotate([90,0,0]) stenka();
            }
        }

        translate([15,0,10])
            translate([0,6.75,0]) rotate([90,0,0]) bearing();
    }
}

module natjazhitel2() {
    translate([1,-10,0]) {
        podlozhka();

        translate([15,2,0]) {
            translate([0,3-0.5,0]) rotate([90,0,0]) stenka();
            translate([0,9,0]) rotate([90,0,0]) stenka();
            translate([0,15+0.5,0]) rotate([90,0,0]) stenka();
        }
    }
}

//-----------------------------------------------------------------------

corner_thinkness = 2;
corner_wide = 20;
corner_len = 25;
corner_hole_d1 = 5;
corner_hole_d2 = 10;

module corner_side() {
    translate([-corner_len,0,0])
    difference() {
        union() {
            translate([0,corner_wide/2,0]) cylinder(d=corner_wide, h=corner_thinkness, $fn=50);
            cube([corner_len,corner_wide,corner_thinkness]);
        };
        translate([0,corner_wide/2,-0.1]) cylinder(d=corner_hole_d1, d2=corner_hole_d2, h=corner_thinkness+0.2, $fn=50);
    }
}

module podlozhka2() {
    union() {
        corner_side();
        translate([0,corner_wide,0]) rotate([0,90,0]) rotate([180,0,0]) corner_side(); 
    }
}

module stenka2() {
    height = 2;
    stenka_d = 16;

    difference() {
        union() {
            translate([0,height,0]) cube([10,stenka_d,2]);
            translate([-stenka_d/2,height,0]) cube([stenka_d/2,8,2]);
            translate([0,10,0]) cylinder(d=stenka_d, h=height, $fn=100);
        }
        translate([0,10,-0.01]) cylinder(r=2.1, height+0.02, $fn=100);
    }


    translate([-8,4,4]) rotate([270,0,-90]) napliv(r=2,l=stenka_d);
    translate([8,4,-2]) rotate([90,0,-90]) napliv(r=2,l=stenka_d);
    translate([6,2,-2]) rotate([0,-90,-90]) napliv(r=2, l=stenka_d);
    translate([6,18,4]) rotate([0,90,-90]) napliv(r=2, l=stenka_d);

}


module corner_natjazhitel() {
    translate([corner_len,-corner_wide/2,0]) {
        color("lightblue") {
            podlozhka2();

            color("lightblue")
            translate([-10,corner_thinkness,0]) {
                translate([0,3-0.5,0]) rotate([90,0,0]) stenka2();
                translate([0,9,0]) rotate([90,0,0]) stenka2();
                translate([0,15+0.5,0]) rotate([90,0,0]) stenka2();
            }
        }
        translate([-10,0,10]) {
            translate([0,6.75,0]) rotate([90,0,0]) bearing();
            translate([0,13.25,0]) rotate([90,0,0]) bearing();
        }
    }
}

module bearing() {
    /* difference() {
        rotate_extrude(convexity = 10, $fn = 10)
            translate([1.5,-2,0])
            color("red") square([4.5, 4]);

        rotate_extrude(convexity = 10, $fn = 10)
            translate([7.3, 0, 0])
            circle(r = 2, $fn = 100);
    } */
    color("silver")
        rotate_extrude($fn=50)
            translate([1.5,-2,0])
                polygon( points=[[0,0],[4.5,0],[4.5,0.7],[4,2],[4.5,3.3],[4.5,4],[0,4]] );
}

//corner_natjazhitel();
