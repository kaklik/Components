include <../../Parameters.scad>
use <888_1014.scad>

draft = false;


translate([0,-85,0])
    rotate([0,0,90])
        translate([0,0,-450])
                888_1014_part(3, draft);




