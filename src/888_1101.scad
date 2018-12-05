draft = true;
include <../Parameters.scad>

rotx = ($t)*20 - 10;      //  -10 .. +10
roty = -(($t)*10 - 5);       //   -5 .. +5


use <888_1015.scad>
use <888_1020.scad>


module efsm_12(){
    translate([-20, -20, 0])
        cube([40, 40, 7]);

    cylinder(h = 10, d = 25);

    translate([0,0,10])
        cylinder(h = 2, d1 = 25, d2 = 20);

    translate([0,0,0])
        cylinder(h = 14, d = 12);

    translate([0,0,7])
        sphere(r=8);
}


difference(){
    union(){
    color([0.8, 0.3, 0.3])
        888_1015();
    color([0.2, 0.8, 0.2, 0.9])
        translate([-4.5,0, 77])
            rotate([rotx,9+roty,0])
                    888_1020();

    color([0.2, 0.2, 0.8, 0.6])
        translate([-7,0, 61])
            rotate([0,9,0])
                translate([0,0,7])
                    efsm_12();
    }
    //translate([-250, 0, 0]) cube(500);
    //cube(500);
}
