$fn=60;
include <../utils/threads.scad>; 
include <../utils/sector.scad>;

thickness = 19.5;

insideDiameter = 5;
threadDiameter = 8;
outsideDiameter = 11.3;
boltHeight=3;
boltWidth=5;
height = boltHeight+thickness;

difference() {
  union() {
    translate([0,0,boltHeight]) cylinder(d=outsideDiameter, thickness);
    cylinder(d=outsideDiameter+boltWidth, boltHeight, $fn=6);
  }
  translate([0,0,-.005]) ScrewThread(threadDiameter, height+0.1, tolerance=6.6);
}



translate([20, 0, 0]) {
  difference() {
    union() {
      cylinder(d=outsideDiameter+boltWidth, boltHeight, $fn=6);
      ScrewThread(threadDiameter, height+boltHeight, tolerance=-3.6);
    }
    cylinder(d=insideDiameter, height+boltHeight);
    translate([0,0,height]) difference() {
      cylinder(d=threadDiameter, 3);
      cylinder(d=threadDiameter-2, 3);
    }
  }
}

