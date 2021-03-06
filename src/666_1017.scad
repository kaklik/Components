
DOC_SCALING_FACTOR = 100;
DOC_HEIGHT = 50;

include <./lib/dimlines.scad>

DIM_LINE_WIDTH = .025 * DOC_SCALING_FACTOR;  
DIM_SPACE = .1 * DOC_SCALING_FACTOR;  


//improving rendering speed.
draft = true;   // sets rendering quality to draft.
$fs = draft ? 5 : 0.5;
$fa = 10;

module 666_1017(draft) {


material_plus = 10;

bevelled_width = main_tube_outer_diameter + 2*coupling_wall_thickness;


difference () {
    translate([-(coupling_width_666_1017/2),- depth_666_1017/2,0])
      cube ([coupling_width_666_1017, depth_666_1017, height_666_1017 + material_plus]);

    //middle cut
    translate ([-1,-depth_666_1017/2 - global_clearance/2,- global_clearance/2])
       cube ([2,depth_666_1017 + global_clearance,height_666_1017 + material_plus + global_clearance]);

    //main tube
    translate([0,depth_666_1017/2 + global_clearance/2, height_666_1017 - main_tube_outer_diameter/2 - coupling_wall_thickness])   
        rotate([90,0,0])
           cylinder(h = depth_666_1017 + global_clearance, r = main_tube_outer_diameter/2, $fn = draft ? 100 : 200);

    //vertical tube
    translate ([0,0, - thickness_between_tubes])
        cylinder(h = height_666_1017 - coupling_wall_thickness - main_tube_outer_diameter,r = main_tube_outer_diameter/2, $fn = draft ? 100 : 200);

            

    //screws
    // šrouby horizontální trubky
    translate ([- coupling_width_666_1017/2 - global_clearance/2, depth_666_1017/4, height_666_1017 - coupling_wall_thickness - main_tube_outer_diameter/2])
        rotate ([0,90,0])
           cylinder (h = coupling_width_666_1017 + global_clearance, d = M4_screw_diameter, $fn = draft ? 10 : 20);

    translate([- coupling_width_666_1017/2 - global_clearance/2, -depth_666_1017/4, height_666_1017 - coupling_wall_thickness - main_tube_outer_diameter/2])
        rotate([0,90,0])
            cylinder(h = coupling_width_666_1017 + global_clearance, d = M4_screw_diameter, $fn = draft ? 10 : 20);

    // Šrouby vertikální trubky
    translate([- coupling_width_666_1017/2 - global_clearance/2,0,27.5])
        rotate([0,90,0])
            cylinder(h = coupling_width_666_1017 + global_clearance, r = M3_screw_diameter/2, $fn = draft ? 10 : 20);

    translate([- coupling_width_666_1017/2 - global_clearance/2,0,7.5])
        rotate([0,90,0])
            cylinder(h = coupling_width_666_1017 + global_clearance, r = M3_screw_diameter/2, $fn = draft ? 10 : 20);
   
   //šroub úplně na spodu pod horizontální trubkou
    translate([- coupling_width_666_1017/2 - global_clearance/2,0,height_666_1017 + material_plus/4])
        rotate([0,90,0])
           cylinder(h = coupling_width_666_1017 + global_clearance, r = M3_screw_diameter/2, $fn = draft ? 10 : 20);

    //nut
    // matky šroubů horizontální trubky
    translate ([- coupling_width_666_1017/2 - global_clearance, depth_666_1017/4, height_666_1017- coupling_wall_thickness - main_tube_outer_diameter/2])
        rotate ([0,90,0])
            cylinder (h = M4_screw_head_height + global_clearance, d = M4_nut_diameter, $fn = 6);
    
    translate([- coupling_width_666_1017/2 - global_clearance, -depth_666_1017/4, height_666_1017 - coupling_wall_thickness - main_tube_outer_diameter/2])
        rotate([0,90,0])
            cylinder (h = M4_screw_head_height + global_clearance, d = M4_nut_diameter, $fn = 6);

    translate ([coupling_width_666_1017/2 - M4_screw_head_height, depth_666_1017/4, height_666_1017- coupling_wall_thickness - main_tube_outer_diameter/2])
        rotate ([0,90,0])
            cylinder (h = M4_screw_head_height + global_clearance, d = M4_nut_diameter, $fn = 6);
    
    translate([coupling_width_666_1017/2 - M4_screw_head_height, -depth_666_1017/4, height_666_1017- coupling_wall_thickness - main_tube_outer_diameter/2])
        rotate([0,90,0])
            cylinder (h = M4_screw_head_height + global_clearance, d = M4_nut_diameter, $fn = 6);

    ///
    translate([- coupling_width_666_1017/2 - global_clearance,0,27.5])
        rotate ([0,90,0])
            cylinder (h = M3_screw_head_height + global_clearance, r = M3_nut_diameter/2, $fn = 6);

    translate([- coupling_width_666_1017/2 - global_clearance,0,7.5])
        rotate ([0,90,0])
            cylinder (h = M3_screw_head_height + global_clearance, r = M3_nut_diameter/2, $fn = 6);

    translate([coupling_width_666_1017/2 - M3_screw_head_height,0,27.5])
        rotate ([0,90,0])
            cylinder (h = M3_screw_head_height + global_clearance, r = M3_nut_diameter/2, $fn = 6);

    translate([coupling_width_666_1017/2 - M3_screw_head_height,0,7.5])
        rotate ([0,90,0])
            cylinder (h = M3_screw_head_height + global_clearance, r = M3_nut_diameter/2, $fn = 6);

    // matka šroubu úplně na spodní straně
    translate([(coupling_screw_length_666_1017 -10 -M3_screw_head_height)/2, 0, height_666_1017 + material_plus/4])
        rotate ([0,90,0])
            cylinder (h = 2 * M3_screw_head_height + global_clearance, r = M3_nut_diameter/2, $fn = 6,  center = true);

    translate([-(coupling_screw_length_666_1017 -10 -M3_screw_head_height)/2, 0,height_666_1017 + material_plus/4])
        rotate ([0,90,0])
           cylinder (h = 2 * M3_screw_head_height + global_clearance, r = M3_nut_diameter/2, $fn = 6, center = true);


    //horizontal bevelled edge
        translate([0,-(depth_666_1017/2) - global_clearance/2,height_666_1017 + material_plus+sqrt(2)*coupling_wall_thickness])
            rotate([0,45,0])
               cube([bevelled_width,coupling_width_666_1017 + global_clearance,bevelled_width]);

    mirror([1,0,0])
        translate([0,-(depth_666_1017/2) - global_clearance/2,height_666_1017 + material_plus+sqrt(2)*coupling_wall_thickness])
            rotate([0,45,0])
               cube([bevelled_width,coupling_width_666_1017 + global_clearance,bevelled_width]);

    //vertical bevelled edge

        translate([-coupling_width_666_1017 + 2,0,- global_clearance/2])
            rotate([0,0,45])
               cube([height_666_1017 + material_plus,height_666_1017 + material_plus,height_666_1017 + material_plus + global_clearance]);

    mirror([1,0,0])
        translate([-coupling_width_666_1017 + 2,0,- global_clearance/2])
            rotate([0,0,45])
                cube([height_666_1017 + material_plus,height_666_1017 + material_plus,height_666_1017 + material_plus + global_clearance]);

    mirror([0,1,0])
        translate([-coupling_width_666_1017 + 2,0,- global_clearance/2])
            rotate([0,0,45])
                cube([height_666_1017 + material_plus,height_666_1017 + material_plus,height_666_1017 + material_plus + global_clearance]);

    mirror([0,1,0])
        mirror([1,0,0])
            translate([-coupling_width_666_1017 + 2,0,- global_clearance/2])
                rotate([0,0,45])
                    cube([height_666_1017 + material_plus,height_666_1017 + material_plus,height_666_1017 + material_plus + global_clearance]);
    }    
}

module 666_1017_drillhelper(height = 70 - coupling_wall_thickness + main_tube_outer_diameter/2, height_of_cap_cylinder = 2){


difference () {

    translate([-(width_666_1017_drillhelper/2),-(depth_666_1017_drillhelper/2),0])
    color([1,0,0])
       cube ([width_666_1017_drillhelper,depth_666_1017_drillhelper,height]);


    //main tube
    translate([0,main_tube_outer_diameter + coupling_wall_thickness + global_clearance/2, height - main_tube_outer_diameter/2 - main_tube_outer_diameter/2])   
        rotate([90,0,0])
            cylinder(h = main_tube_outer_diameter*3 + global_clearance, r = main_tube_outer_diameter/2, $fn = draft ? 100 : 200);

    //vertical tube
    translate ([0,0, - thickness_between_tubes])
        cylinder(h = height - main_tube_outer_diameter/2 - main_tube_outer_diameter,r = main_tube_outer_diameter/2, $fn = draft ? 100 : 200);

            

    //screws
    translate ([- coupling_width_666_1017/2 - global_clearance/2, depth_666_1017/4, height - main_tube_outer_diameter/2 - main_tube_outer_diameter/2])
        rotate ([0,90,0])
            cylinder (h = coupling_width_666_1017 + global_clearance, d = M4_screw_diameter, $fn = draft ? 10 : 20);

    translate([- coupling_width_666_1017/2 - global_clearance/2, -depth_666_1017/4, height - main_tube_outer_diameter/2 - main_tube_outer_diameter/2])
        rotate([0,90,0])
            cylinder(h = coupling_width_666_1017 + global_clearance, d = M4_screw_diameter, $fn = draft ? 10 : 20);

    translate([- coupling_width_666_1017/2 - global_clearance/2,0,27.5])
        rotate([0,90,0])
            cylinder(h = coupling_width_666_1017 + global_clearance, r = M3_screw_diameter/2, $fn = draft ? 10 : 20);

    translate([- coupling_width_666_1017/2 - global_clearance/2,0,7.5])
        rotate([0,90,0])
            cylinder(h = coupling_width_666_1017 + global_clearance, r = M3_screw_diameter/2, $fn = draft ? 10 : 20);

    //prořezy pro zajištění
    translate([- (3*global_clearance)/2,-depth_666_1017_drillhelper/2 - global_clearance,height - main_tube_outer_diameter/2 - global_clearance])
           cube([3*global_clearance,depth_666_1017_drillhelper + 2*global_clearance, main_tube_outer_diameter]);
    translate([-(3*global_clearance)/2, -2*main_tube_outer_diameter, -global_clearance])
            cube([3*global_clearance, 4*main_tube_outer_diameter, 1.5*main_tube_outer_diameter]);
    //šrouby
    translate([0,0,70 - thickness_between_tubes/2])
        rotate([0,90,0])
            union(){ 
                   cylinder(h = 50, r = M4_screw_diameter/2, $fn = draft ? 10 : 20, center = true);
            translate([0,0, main_tube_outer_diameter/2 + 2*thickness_between_tubes - 2*M4_nut_height])
                    cylinder(h = M4_nut_height*2 + global_clearance, r = M4_nut_diameter/2, $fn = 6);
            translate([0,0, - main_tube_outer_diameter/2 - 2*thickness_between_tubes - global_clearance])
                    cylinder(h = M4_nut_height*2 + global_clearance, r = M4_nut_diameter/2, $fn = 6);
            }
    
    translate([0,main_tube_outer_diameter/2 + 2*thickness_between_tubes,main_tube_outer_diameter*(2/3)])
        rotate([0,90,0])
            union(){ 
                   cylinder(h = 50, r = M4_screw_diameter/2, $fn = draft ? 10 : 20, center = true);
            translate([0,0, main_tube_outer_diameter/2 + 2*thickness_between_tubes - 2*M4_nut_height])
                    cylinder(h = M4_nut_height*2 + global_clearance, r = M4_nut_diameter/2, $fn = 6);
            translate([0,0, - main_tube_outer_diameter/2 - 2*thickness_between_tubes - global_clearance])
                    cylinder(h = M4_nut_height*2 + global_clearance, r = M4_nut_diameter/2, $fn = 6);
            }
    mirror([0,1,0])
        translate([0,main_tube_outer_diameter/2 + 2*thickness_between_tubes,main_tube_outer_diameter*(2/3)])
            rotate([0,90,0])
                union(){ 
                       cylinder(h = 50, r = M4_screw_diameter/2, $fn = draft ? 10 : 20, center = true);
                translate([0,0, main_tube_outer_diameter/2 + 2*thickness_between_tubes - 2*M4_nut_height])
                        cylinder(h = M4_nut_height*2 + global_clearance, r = M4_nut_diameter/2, $fn = 6);
                translate([0,0, - main_tube_outer_diameter/2 - 2*thickness_between_tubes - global_clearance])
                        cylinder(h = M4_nut_height*2 + global_clearance, r = M4_nut_diameter/2, $fn = 6);
                }
    }
}


module 666_1017_drillhelper_doc(){
width=main_tube_outer_diameter+2*coupling_wall_thickness;
depth=width;
height= 70; //main_tube_outer_diameter*1.8+main_tube_outer_diameter+wall_thickness;


    color("Black")
        union(){
            //screw
            translate ([7.5,0,main_tube_outer_diameter])
                rotate ([0,0,0])
                    circle_center(radius=main_tube_outer_diameter/4, size=DIM_HOLE_CENTER, line_width=DIM_LINE_WIDTH);

            translate ([27.5,0,main_tube_outer_diameter])
                rotate ([0,0,0])
                    circle_center(radius=main_tube_outer_diameter/4, size=DIM_HOLE_CENTER, line_width=DIM_LINE_WIDTH);

            translate ([height - main_tube_outer_diameter + 7.65,10 - M3_screw_diameter/2,main_tube_outer_diameter])
                rotate ([0,0,0])
                    circle_center(radius=main_tube_outer_diameter/4, size=DIM_HOLE_CENTER, line_width=DIM_LINE_WIDTH);

            translate ([height - main_tube_outer_diameter + 7.65,- width/2 + 9.5,main_tube_outer_diameter])
                rotate ([0,0,0])
                    circle_center(radius=main_tube_outer_diameter/4, size=DIM_HOLE_CENTER, line_width=DIM_LINE_WIDTH);

        }
}

//666_1017_drillhelper_doc();

666_1017(draft);

translate([70,0,0])
666_1017_drillhelper();

include <../Parameters.scad>
