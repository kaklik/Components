//improving rendering speed.
draft = true;   // sets rendering quality to draft.
$fs = draft ? 5 : 0.5;
$fa = 10;



module 888_2002(draft){

width = 2*tube_for_undercarriage_outer_diameter;
depth = tube_for_undercarriage_outer_diameter + M3_screw_diameter + 2*coupling_wall_thickness_undercarriage + thickness_between_tubes_undercarriage;
height = width;
    
difference(){

    union() {

        hull() {
            cylinder(h = height, r = tube_for_undercarriage_outer_diameter, $fn = draft ? 10 :50 );
            translate([0,1.5*main_tube_outer_diameter,0])
                cylinder(h = height/2, d = tube_for_undercarriage_outer_diameter, $fn = draft ? 10 :50 );
        }

        hull() {
            cylinder(h = height, r = tube_for_undercarriage_outer_diameter, $fn = draft ? 10 :50 );
            translate([0, -32/2 , 1.8 * tube_for_undercarriage_outer_diameter])
                rotate([0,70,0])
                    cylinder(h = 2 * height, r = tube_for_undercarriage_outer_diameter, center = true,  $fn = draft ? 10 :50 );
        }
    }

	//tube
    translate ([0,0,- global_clearance/2])
        cylinder(h = height + global_clearance,d = tube_for_undercarriage_outer_diameter, $fn = draft ? 20 : 50);


    //screw
    translate([0,main_tube_outer_diameter,0])
        cylinder(h = height, r = M3_screw_diameter/2, $fn = draft ? 10 :20 );

    translate([0,1.5*main_tube_outer_diameter,0])
        cylinder(h = height, r = M3_screw_diameter/2, $fn = draft ? 10 :20 );


	//nut
    translate([0, main_tube_outer_diameter, height/2])
        cylinder (h = height, r = Nut_diameter_M3/2, $fn = 6);

    translate([0, 1.5* main_tube_outer_diameter, height/2])
        cylinder (h = height, r = Nut_diameter_M3/2, $fn = 6);

    translate([0, -32/2 , 1.8 * tube_for_undercarriage_outer_diameter])
        rotate([0,70,0])
            cylinder(h = 2.5 * height, d = tube_for_undercarriage_outer_diameter, center = true,  $fn = draft ? 10 :50 );

    %translate([0, -32/2 , 1.8 * tube_for_undercarriage_outer_diameter])
        rotate([0,70-90,0])
          cylinder (h = 50+ Nut_height_M3 + global_clearance, r = Nut_diameter_M3/2, $fn = 6);
    
    %translate([width/2 - Nut_height_M3, 0, height/2])
       rotate([0,90,0])
           cylinder (h = Nut_height_M3 + global_clearance, r = Nut_diameter_M3/2, $fn = 6);

    }
}



888_2002(draft);

include <../Parameters.scad>
