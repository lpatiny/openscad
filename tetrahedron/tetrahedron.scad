height=55;

$fn=3;

difference() {
  union() {
    cylinder(h=15, r=height/2*1.4142);
    cylinder(h=height, r1=0, r2=height/2*1.4142);
  }
  translate([0,0,4*1.4142]) cylinder(h=height, r1=0, r2=height/2*1.4142);
}

translate([-height/2/1.4142+1,0,4]) rotate([90,0,270]) linear_extrude(2)
    text("TETRAHEDRON", font = "Liberation Sans:style=Bold", size = 5.5, halign = "center");

translate([cos(60)*(height-3)/2/1.4142,sin(60)*(height-3)/2/1.4142,4]) rotate([90,0,150]) linear_extrude(2)
    text("TETRAHEDRON", font = "Liberation Sans:style=Bold", size = 5.5, halign = "center");

translate([cos(60)*(height-3)/2/1.4142,-sin(60)*(height-3)/2/1.4142,4]) rotate([90,0,30]) linear_extrude(2)
    text("TETRAHEDRON", font = "Liberation Sans:style=Bold", size = 5.5, halign = "center");
