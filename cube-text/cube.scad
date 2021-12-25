size=70;
thickness=2;

fontSize=size/10*4;

difference() {
	cube([size,size,size]);
	translate([thickness,thickness,thickness+.005]) 
		cube([size-thickness*2,size-thickness*2,size+thickness]);
}


translate([size/2,0.005,35]) rotate([90,0,0]) linear_extrude(2)
    text("CU", font = "Liberation Sans:style=Bold", size = fontSize, halign = "center");
translate([size/2,0.005,5]) rotate([90,0,0]) linear_extrude(2)
    text("BE", font = "Liberation Sans:style=Bold", size = fontSize, halign = "center");

translate([size/2,size-0.005,35]) rotate([90,0,180]) linear_extrude(2)
    text("CU", font = "Liberation Sans:style=Bold", size = fontSize, halign = "center");
translate([size/2,size-0.005,5]) rotate([90,0,180]) linear_extrude(2)
    text("BE", font = "Liberation Sans:style=Bold", size = fontSize, halign = "center");


