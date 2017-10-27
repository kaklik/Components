use <./lib/naca4.scad>
include <../Parameters.scad>
use <666_1026.scad>

depth = main_tube_outer_diameter*2;
width = main_tube_outer_diameter + 2*(main_tube_outer_diameter/10);
height = depth;

translate ([50,0,0])
666_1026();

difference (){

	airfoil(naca = 0035, L = 160, N=101, h = 195, open = false);
	translate ([0.4,0,-5]) scale ([0.90,0.6,1.2]) airfoil(naca = 0052, L = 170, N=101, h = 195, open = true);


	//pro otevření
	translate ([150,-0.5,-3])
	cube ([10,1,201]);

	translate ([35,-depth/2-3,195-height])
	cube ([width*5,depth+6,height+3]);

}

//translate ([0,depth/2,0])
//cube ([100,3,10]);

//translate ([0,-3-depth/2,0])
//cube ([100,3,10]);