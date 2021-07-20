$fn=60;

include <../utils/threads.scad>; 

diameter=197;
diameterCup=55;
diameterGas=91.4;

difference() {
  union() {
    difference() {
      cylinder(d=diameter, h=20);
      // gas bottle
      translate([0,0,10]) cylinder(d=diameterGas, h=20);
    }
    translate([0,0,14]) rotate_extrude(convexity = 10) translate([diameterGas/2, 0, 0]) circle(r = 1, $fn = 100);
  }


  // screws
  rotate([0,0,0]) translate([diameter/2-25,0,-.005]) ScrewThread(20, 30, tolerance=1.2);
  rotate([0,0,120]) translate([diameter/2-25,0,-.005]) ScrewThread(20, 30, tolerance=1.2);
  rotate([0,0,240]) translate([diameter/2-25,0,-0.005]) ScrewThread(20, 30, tolerance=1.2);
  
  rotate([0,0,60]) translate([(diameter-diameterCup)/2-10,0,-0.005]) cylinder(d=diameterCup, h=22);
  rotate([0,0,180]) translate([(diameter-diameterCup)/2-10,0,-0.005]) cylinder(d=diameterCup, h=22);
  rotate([0,0,300]) translate([(diameter-diameterCup)/2-10,0,-0.005]) cylinder(d=diameterCup, h=22);
  translate([0,0,-0.005]) cylinder(d=diameterCup, h=20);

}

!union() {
  translate([0, 0, 0]) union() {
    $fn=6; cylinder(d=40, h=10, center=true);
    ScrewThread(20, 50, tolerance=-1.2);
  }
  translate([50, 0, 0]) union() {
    $fn=6; cylinder(d=40, h=10, center=true);
    ScrewThread(20, 50, tolerance=-1.2);
  }
  translate([100, 0, 0]) union() {
    $fn=6; cylinder(d=40, h=10, center=true);
    ScrewThread(20, 50, tolerance=-1.2);
  }
}

