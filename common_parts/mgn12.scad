module MGN12_rail(len) {
    color("goldenrod")
        rotate([90,0,90])
            linear_extrude(height=len)
                polygon(points=[[0, 0], [0, 4.5], [1, 5.5], [0, 6.5], [0, 7.5], [0.5, 8], 
                                [11.5, 8], [12, 7.5], [12, 6.5], [11, 5.5], [12, 4.5], [12, 0]]);
}


// MGN12_rail(600);
