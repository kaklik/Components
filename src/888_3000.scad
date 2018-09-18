draft = true;


module 888_3000(draft){    /////// 1. díl (AZ, YAW)

cone_radius_one = 50;
cone_radius_two = 30;
cone_height = 40;
cylinder_height = 10;

whole_length = cone_height + cylinder_height;

//lícovaný šroub  M6
shank_diameter = 8 + 1 ;		//průměr dříku + tolerance pro díru
whole_screw_length  = 56; 		//celková délka
thread_length = 11;				//délka závitu
thread_diameter = 6; 
length_screw_behind_nut = 3;
head_screw_diameter = 13 + 0.2;		//průměr válcové hlavy šroubu
head_screw_height = 8 + 0.2;		//výška válcové hlavy šroubu

//samojistná šestihranná matice ISO 7040 - M6
lock_nut_diameter = 11.05; //výška samojistné matice pro průměr M6
lock_nut_height = 8; 

//šířka žebra
rib_thickness = 5;


difference(){

	union(){
				cylinder (h = cylinder_height, r = cone_radius_one, center = false, $fn = draft ? 50 : 100);
		translate([0,0,cylinder_height])
				cylinder(h = cone_height, r1 = cone_radius_one, r2 = cone_radius_two, center=false, $fn = draft ? 50 : 100);
	}

//šrouby pro uchycení
	translate([- cone_radius_one/2 - 3, - cone_radius_one/2 - 3,-global_clearance])	
			cylinder (h = whole_length + 2*global_clearance, r = M6_screw_diameter/2, $fn = draft ? 10 : 20);
	translate([ - cone_radius_one/2 - 3, cone_radius_one/2 + 3,-global_clearance])	
			cylinder (h = whole_length + 2*global_clearance, r = M6_screw_diameter/2, $fn = draft ? 10 : 20);
	translate([cone_radius_one/2 + 3,cone_radius_one/2 + 3,-global_clearance])	
			cylinder (h = whole_length + 2*global_clearance, r = M6_screw_diameter/2, $fn = draft ? 10 : 20);
	translate([cone_radius_one/2 + 3, - cone_radius_one/2 - 3,-global_clearance])	
			cylinder (h = whole_length +  2*global_clearance, r = M6_screw_diameter/2, $fn = draft ? 10 : 20);


//otvory pro ložiska
	//horní
	translate([0,0, whole_length - 608_bearing_thickness - global_clearance/2])
			cylinder (h = 608_bearing_thickness + global_clearance, r = 608_bearing_outer_diameter/2, $fn = draft ? 50 : 100);
	//spodní
	translate([0,0,- global_clearance/2])
			cylinder (h = 608_bearing_thickness + lock_nut_height + length_screw_behind_nut+ global_clearance, r = 608_bearing_outer_diameter/2, $fn = draft ? 50 : 100);

//otvor pro lícovaný šroub
	translate ([0,0,- global_clearance/2])
			cylinder (h = whole_screw_length + global_clearance, r = shank_diameter/2, $fn = draft ? 50 : 100);

//žebra
	difference(){
	//vybrání pro vznik čtyř žeber
		union(){
			translate([rib_thickness/2, rib_thickness/2,cylinder_height])
					cube ([cone_radius_one,cone_radius_one, whole_length]);
			translate([rib_thickness/2,- rib_thickness/2 - cone_radius_one,cylinder_height])
					cube ([cone_radius_one,cone_radius_one, whole_length]);
			translate([- rib_thickness/2 - cone_radius_one, rib_thickness/2,cylinder_height])
					cube ([cone_radius_one,cone_radius_one, whole_length]);
			translate([- rib_thickness/2 - cone_radius_one, - rib_thickness/2 - cone_radius_one,cylinder_height])
					cube ([cone_radius_one,cone_radius_one, whole_length]);
			}

	//kulateé uprostřed	
				cylinder(h = whole_length, r = cone_radius_two, $fn = draft ? 50 : 100);

	}

	}


}


888_3000(draft);

use <./lib/naca4.scad>
include <../Parameters.scad>