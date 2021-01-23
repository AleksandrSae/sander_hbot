// Alexander Saechnikov, 2021

module circle_rounded_cube(length, height, dia) {
    cylinder(d=dia, height);
    translate([length, 0, 0]) cylinder(d=dia, height);
    translate([0, -dia/2, 0]) cube([length, dia, height]);    
}
