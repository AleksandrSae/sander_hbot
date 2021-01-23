// Aleksander Saechnikov, 2020

module square_tube_15x30 (height = 100, center = true) {
    if (center == true)
        translate([-15, -7.5,0])
            _st(30, 15, height, 1.5); 
    else
        _st(30, 15, height, 1.5); 
}

module _st (width, length, height, thickness) {
    difference() {
        cube([width, length, height]);
        translate([thickness,thickness,-0.1])
            cube([width-2*thickness, length-2*thickness, height+0.2]);
    };
}
