$fn=60;

include <../utils/threads.scad>; 
include <../utils/sector.scad>;

// small test
difference() {
  translate([-6.5, -6.5, 0]) cube([13,13,12]);
  translate([0,0,2.005]) ScrewThread(10, 10, tolerance=1.2);
}
translate([20, 0, 0]) union() {
  translate([-5, -5, 0]) cube([20,10,2]);
  ScrewThread(10, 10, tolerance=-1.2);
}
