//improving rendering speed.
draft = true;   // sets rendering quality to draft.
$fs = draft ? 5 : 0.5;
$fa = 10;

module 888_2001(height = 10, height_of_cap_cylinder = 2){

    depth = main_tube_outer_diameter + 4*thickness_between_tubes;
    width = depth; 
    height = 40;    
    
    difference (){
        union(){
            translate([-(width/2),-(depth/2),0])
                cube ([width,depth,height]);

%            translate([-(width/2),-depth,0])
                cube ([width,depth, height]);
        }

        //tube
        translate([0,0,- global_clearance])
           cylinder(h = 2*main_tube_outer_diameter + global_clearance,r = main_tube_outer_diameter/2, $fn = draft ? 100 : 200);

        //prořez
        translate([-width/2,- (3*global_clearance)/2,- main_tube_outer_diameter])
                cube([width, 3*global_clearance, 4*main_tube_outer_diameter]);

        //šrouby pro zajištění
        translate([width/2 - width/8,0,height/4])
            rotate([90,0,0])
                union(){
                        cylinder(h = 50, r = M3_screw_diameter/2, $fn = draft ? 10 : 20, center = true);
                translate([0,0, main_tube_outer_diameter/2 + 2*thickness_between_tubes - 2*M3_nut_height])
                        cylinder(h = M3_nut_height*2 + global_clearance, r = M3_nut_diameter/2, $fn = 6);
                translate([0,0, - main_tube_outer_diameter/2 - 2*thickness_between_tubes - global_clearance])
                        cylinder(h = M3_nut_height*2 + global_clearance, r = M3_nut_diameter/2, $fn = 6);
                }
    }

}


888_2001(draft);


include <../Parameters.scad>
