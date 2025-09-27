

// we need a U shape with some little teeth to stay in the sagex

inside=4;
height=15;
thickness=1.5;
width=4+2*thickness;
tooth=0.5;
toothDistance=2;

union() {
  cube([width,thickness,thickness]);
  // the legs have the height height
  translate([width-thickness,0,0]) {
    hull() {
      cube([thickness,thickness,height]);
      translate([thickness/2,thickness,height+1]) rotate([90,0,0]) cylinder(h=thickness,d=0.2);
    }
  }
  // edge on top of legs using hull and a sphere
  hull() {
    cube([thickness,thickness,height]);
    translate([thickness/2,thickness,height+1]) rotate([90,0,0]) cylinder(h=thickness,d=0.2);
  }
}

// make a triangle
for (shift = [thickness, thickness*2+inside]) {
translate([shift,thickness,0])
  rotate([90,0,0]) linear_extrude(thickness) {
    for (i=[thickness+2:toothDistance+0.1:height-toothDistance]) {
      translate([0,i,0]) polygon([[0,0],[tooth,0],[0,toothDistance]]);
    }
  }
}

for (shift = [0, thickness+inside]) {
translate([shift,0,0])
  rotate([90,0,180]) linear_extrude(thickness) {
    for (i=[thickness+2:toothDistance+0.1:height-toothDistance]) {
      translate([0,i,0]) polygon([[0,0],[tooth,0],[0,toothDistance]]);
    }
  }
}