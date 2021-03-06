module 888_1001(draft){


    width =width_of_accumulator + accumulator_holder_width;
    depth = accumulator_holder_width;
    height = height_of_accumulator - sink_of_accumulator + accumulator_holder_thickness;

    width_cube = accumulator_holder_thickness; 	//šířka kostky ve které je otvor na šroub
    depth_cube = accumulator_holder_width;
    height_cube = accumulator_holder_thickness;	//výška kostky ve které je otvor na šroub


    union(){

    	difference (){
    		translate([-(accumulator_holder_width/2),- accumulator_holder_width/2,0])
    			cube ([width,depth,height]);
    		translate([- global_clearance,height_of_accumulator/2 + global_clearance,-2 - sink_of_accumulator - depth_of_accumulator])
    			rotate([90,0,0])
    				cube([width_of_accumulator + global_clearance*2, depth_of_accumulator+3 + depth_of_accumulator, height_of_accumulator+1]);
     	}

    	difference(){
    		translate([-accumulator_holder_thickness - accumulator_holder_width/2,-accumulator_holder_width/2,0])
    			cube([accumulator_holder_thickness, accumulator_holder_width, accumulator_holder_thickness]);
    	//šroub
    		translate([- accumulator_holder_width/2 - accumulator_holder_thickness/2,0,-10])
    			cylinder(h = 30, r = M3_screw_diameter/2, $fn = 20);
    	}

    	difference(){
    		translate([width_of_accumulator + accumulator_holder_width/2,-accumulator_holder_width/2,0])
    			cube([accumulator_holder_thickness, accumulator_holder_width, accumulator_holder_thickness]);
    	//šroub
    		translate([width_of_accumulator + accumulator_holder_width/2 + accumulator_holder_thickness/2,0,-10])
    			cylinder(h = 30, r = M3_screw_diameter/2, $fn = 20);
    	}
    //final union
    }
//final module
}


888_1001();

use <./lib/naca4.scad>
include <../Parameters.scad>
