// Smooth rod holder    SH-10
// look at ./SRC/SH.jpg

$fn = 30;

d = 10;
h = 20;
E = 21;
W = 42;
L = 14;
F = 32.8;
G = 6;
P = 18;
B = 32;
S = 5.5;
S_2 = 4.5;
Delta = 0.1;
DeltaX2 =Delta*2; 

// M4, M5

//sh10a_holder();

module sh10a_holder() {
    difference() {
        union() {
            translate([-W/2,-L/2,0]) cube ([W,L,G]);
            translate([-P/2,-L/2,G-Delta]) cube ([P,L,F-G+Delta]);
        }
        translate([0,L/2+Delta,h]) rotate([90,0,0]) cylinder(h=L+DeltaX2, d=d+0.5);
        translate([-B/2,0,-Delta]) cylinder(h=G+DeltaX2,r=S/2);
        translate([B/2,0,-Delta]) cylinder(h=G+DeltaX2,r=S/2);
        translate([-P/2-Delta,0,(F+h+d/2)/2]) rotate([0,90,0]) cylinder(h=P+DeltaX2,r=S_2/2);
        translate([-P*0.05,-L/2-Delta,h]) cube([P*0.1,L+DeltaX2,F-h+Delta]);        
    }
}   


