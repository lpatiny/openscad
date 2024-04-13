module seal(length, width, diameter, radius) {
  translate([radius, radius ,0]) rotate([0,0,180]) rotate_extrude( angle = 90)
    translate([radius, 0, 0])
     circle(d = diameter);
  translate([length - radius, radius ,0]) rotate([0,0,-90]) rotate_extrude( angle = 90)
    translate([radius, 0, 0])
     circle(d = diameter);
  translate([radius, 0, 0]) rotate([0,90,0]) cylinder(d=diameter, h=length-2*radius);
  translate([radius, width, 0]) rotate([0,90,0]) cylinder(d=diameter, h=length-2*radius);


  translate([radius, width - radius ,0]) rotate([0,0,90]) rotate_extrude( angle = 90)
    translate([radius, 0, 0])
     circle(d = diameter);
  translate([length - radius, width - radius ,0]) rotate([0,0,0]) rotate_extrude( angle = 90)
    translate([radius, 0, 0])
     circle(d = diameter);
  translate([0, radius, 0]) rotate([-90,0,0]) cylinder(d=diameter, h=width-2*radius);
  translate([length, radius, 0]) rotate([-90,0,0]) cylinder(d=diameter, h=width-2*radius);
}