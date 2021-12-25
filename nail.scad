include <./utils/roundedParallelepiped4.scad>;

height=60;

width=15;
thickness=3;
head=28;

rotate([0,0,45]) difference() {
	union() {
		translate([-width/2, -thickness/2, 0]) cube([width,thickness,height]);
		translate([-thickness/2, -width/2, 0]) cube([thickness,width,height]);
	}
	translate([0,0,height/2]) {
		difference() {
			cylinder(r1=width, r2=width, h=height-head);
			cylinder(r1=width, r2=0, h=height-head);
		}
	}
}

translate([30,0,0]) rotate([0,0,45]) difference() {
	union() {
		translate([-width/2, -thickness/2, 0]) cube([width,thickness,height]);
		translate([-thickness/2, -width/2, 0]) cube([thickness,width,height]);
	}
	translate([0,0,height/2]) {
		difference() {
			cylinder(r1=width, r2=width, h=height-head);
			cylinder(r1=width, r2=0, h=height-head);
		}
	}
}

translate([-10,-10,0]) roundedParallelepiped4(50, width, 8, width/2);


