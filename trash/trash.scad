radius=20;
lengthInternal=135;
widthInternal=235;
thickness=10;
outRadius=radius+thickness;
lengthExternal=thickness*2+lengthInternal;
widthExternal=thickness*2+widthInternal;
height=100;

color("red") translate([thickness,thickness,0]) hull() {
	translate([radius,radius,0]) cylinder(r=radius, h=10);
	translate([lengthInternal-radius,radius,0]) cylinder(r=radius, h=10);
	translate([radius,widthInternal-radius,0]) cylinder(r=radius, h=10);
	translate([lengthInternal-radius,widthInternal-radius,0]) cylinder(r=radius, h=10);
}

difference() {
translate([0,0,10]) hull() {
	translate([outRadius,outRadius,0]) cylinder(r=outRadius, h=height);
	translate([lengthInternal+2*thickness-outRadius,outRadius,0]) cylinder(r=outRadius, h=height);
	translate([outRadius,widthInternal+2*thickness-outRadius,0]) cylinder(r=outRadius, h=height);
	translate([lengthInternal+2*thickness-outRadius,widthInternal+2*thickness-outRadius,0]) cylinder(r=outRadius, h=height);
}
translate([thickness,thickness,15]) hull() {
	translate([radius,radius,0]) cylinder(r=radius, h=height);
	translate([lengthInternal-radius,radius,0]) cylinder(r=radius, h=height);
	translate([radius,widthInternal-radius,0]) cylinder(r=radius, h=height);
	translate([lengthInternal-radius,widthInternal-radius,0]) cylinder(r=radius, h=height);
}
}