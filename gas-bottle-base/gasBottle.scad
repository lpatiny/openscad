$fn=60;

include <../utils/threads.scad>; 

thickness=15;
thicknessBase=5;
diameter=197;
diameterCup=60;
distanceCup=10;
diameterGas=91.4;

difference() {
  union() {
    difference() {
      cylinder(d=diameter, h=thickness);
      // gas bottle
      translate([0,0,thicknessBase]) cylinder(d=diameterGas, h=thickness);
    }
    translate([0,0,thicknessBase+4]) rotate_extrude(convexity = 10) translate([diameterGas/2, 0, 0]) circle(r = 1, $fn = 100);
  }


  // screws
  rotate([0,0,0]) translate([diameter/2-20,0,-0.005]) ScrewThread(20, thickness+0.01, tolerance=1.2);
  rotate([0,0,120]) translate([diameter/2-20,0,-0.005]) ScrewThread(20, thickness+0.01, tolerance=1.2);
  rotate([0,0,240]) translate([diameter/2-20,0,-0.005]) ScrewThread(20, thickness+0.01, tolerance=1.2);
  // cups 
  rotate([0,0,60]) translate([(diameter-diameterCup)/2-distanceCup,0,-0.005]) cylinder(d=diameterCup, h=22);
  rotate([0,0,180]) translate([(diameter-diameterCup)/2-distanceCup,0,-0.005]) cylinder(d=diameterCup, h=22);
  rotate([0,0,300]) translate([(diameter-diameterCup)/2-distanceCup,0,-0.005]) cylinder(d=diameterCup, h=22);
  
  // holes 
  translate([0,0,-0.005]) cylinder(d=40, h=20);
  //rotate([0,0,20]) translate([diameter/2-25,0,-0.005]) cylinder(d=22, h=22);

}

screwHeight = 70;
screwInsert = 15;
!union() {
  translate([0, 0, 0]) union() {
    difference() {
      union() {
        $fn=6; cylinder(d=25, h=10);
        ScrewThread(19, screwHeight, tolerance=-1.2);
      }
      translate ([0,0,screwHeight-screwInsert+0.005])difference () {
        cylinder(d=25, h=screwInsert);
        cylinder(d=15, h=screwInsert);
      }
    }
  }
}
