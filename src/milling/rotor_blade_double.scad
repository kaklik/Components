include <../../Parameters.scad>
use <../666_1201.scad>

$vpd = 680;

module rotor_blade_double(holes = false, draft)
{        
    plywood_thickness = 4;
    core_thickness = 1.0;
    length = 974+5;       // celková délka polotovaru
    material_width = 50;
    side_margin = 10; 

    x_size = 2*material_width + 3*side_margin;
    y_size = length + 2*side_margin;
    translate([-x_size/2, -y_size/2,0])
        cube([x_size,y_size, plywood_thickness + core_thickness/2]);

    translate([- material_width/2 - side_margin/2, 0, plywood_thickness + core_thickness/2])
        666_1201(draft = draft, holes = holes);

    translate([material_width/2 + side_margin/2, 0, plywood_thickness + core_thickness/2])
        666_1201(draft = draft, holes = holes);
}

rotor_blade_double(holes = true, draft = false);


