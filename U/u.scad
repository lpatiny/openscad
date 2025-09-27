$fin=30;

thickness=4;
inside=210;
width=30;
height=50;

outside = inside + thickness*2;

difference() {
  cube([outside,width,height]);
  translate([thickness, 0, thickness]) cube([inside,width,height]);
  translate([-2,width/2,height-10]) rotate([0,90,0]) cylinder(d=5, h=50);
}


