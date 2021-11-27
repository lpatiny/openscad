$fn=60;

difference() {
	union() {
		cylinder(h=50, d=72);
		cylinder(h=2, d=82);
	}
	translate([0,0,2]) cylinder(h=50, d=68);
	translate([40,0,-1]) cylinder(h=25, d=35);
}

