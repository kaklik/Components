include <../../Parameters.scad>
use <../666_1027.scad>

//draft = false;

draft = false;

$vpd = 680;

translate([0,2*35, -base_division[2]])
    rotate([0,-90,0])
        666_1027_part(3, draft);
        
translate([0,3*35,-base_division[3]])
    rotate([0,-90,0])
        666_1027_part(4, draft);





