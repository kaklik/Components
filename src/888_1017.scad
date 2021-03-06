draft = true; 


module 888_1016(draft){

    plate_thickness = 5.5;
    plate_width = 50 + 0.32;
    plate_corners = 10 - 0.6;
    plate_length = 20; // vzdalenost, jak daleko bude drzak od okraje
    plate_axis_from_end = 20;

    hall_holder_wall_thickness = 5;
    hall_distance = 35; // distance between axis and magnet

    hall_length = 16;
    hall_length_offset = (11/2-2); // positiv is further from axis
    hall_width = 25+2;
    hall_thickness = 3;
    holder_length = plate_length + hall_distance - plate_axis_from_end + hall_length/2 + hall_holder_wall_thickness + hall_length_offset; 

    bottom_wall = 0.5;

    difference(){
        

    // zakladni tvar
        hull(){
            translate([-(plate_width + 2* hall_holder_wall_thickness)/2, 0, 0])
                cube([plate_width + 2* hall_holder_wall_thickness, plate_length, plate_thickness]);

            translate([-(hall_width)/2, 0, 0])
                cube([hall_width, holder_length, plate_thickness]);
        }

    // dira pro osu
        translate([0, plate_length - plate_axis_from_end,0])
            cylinder(d = 20, h = plate_thickness);


    // otvor pro senzor
        translate([-hall_width/2, plate_length + hall_distance - plate_axis_from_end - hall_length/2 + hall_length_offset, plate_thickness - hall_thickness])
            cube([hall_width, hall_length, hall_thickness + global_clearance]);

        translate([-7/2, plate_length + hall_distance - plate_axis_from_end + hall_length/2 + hall_length_offset - 0.1, 0])
            cube([7, 2.5, plate_thickness + global_clearance]);



        translate([0,0,-global_clearance/2 + bottom_wall])
            // tento rozdil napodobuje tvar hlinikove desky
            difference(){
                translate([-plate_width/2, 0, 0])
                    cube([plate_width, plate_length, plate_thickness + global_clearance]);

                translate([-plate_width/2, plate_length - plate_corners, -global_clearance/2])
                    rotate([0, 0, -45])
                        translate([-plate_corners*2, 0, 0])
                            cube([plate_corners*2, plate_corners*2, plate_thickness + global_clearance]);
                
                translate([plate_width/2 - plate_corners, plate_length, -global_clearance/2])
                    rotate([0, 0, -45])
                        translate([0, 0, 0])
                            cube([plate_corners*2, plate_corners*2, plate_thickness + global_clearance]);
            }
    }

}


888_1016(draft);

include <../Parameters.scad>
