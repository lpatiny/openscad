width = 166;
depth = 89;
height = 50;
overlap = 10;
radius = 5;
thickness = 3;
cone = 40;

difference() {

union() {
  translate([-overlap, -overlap, height]) cube([width+2*overlap, depth+2*overlap, thickness]);
hull() {
  translate([radius, radius, 0]) cylinder(r=radius, h=height, $fn=64);
  translate([width-radius, radius, 0]) cylinder(r=radius, h=height, $fn=64);
  translate([radius, depth-radius, 0]) cylinder(r=radius, h=height, $fn=64);
  translate([width-radius, depth-radius, 0]) cylinder(r=radius, h=height, $fn=64);
  translate([width/2, depth/2, -cone]) sphere(r = 20, $fn = 64);
}
}


hull() {
  translate([0,0,thickness]) {
  translate([radius+thickness, radius+thickness, 0]) cylinder(r=radius, h=height+thickness*2, $fn=64);
  translate([width-radius-thickness, radius+thickness, 0]) cylinder(r=radius, h=height+thickness*2, $fn=64);
  translate([radius+thickness, depth-radius-thickness, 0]) cylinder(r=radius, h=height+thickness*2, $fn=64);
  translate([width-radius-thickness, depth-radius-thickness, 0]) cylinder(r=radius, h=height+thickness*2, $fn=64);
  translate([width/2, depth/2, -cone+thickness]) sphere(r = 20, $fn = 64);
}
}
}