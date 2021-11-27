$fn=60;

include <../utils/threads.scad>; 

thickness=15;
thicknessBase=5;
diameter=205;
diameterCup=60;
distanceCup=10;
diameterGas=91.4;

!difference() {
  union() {
    difference() {
      cylinder(d=diameter, h=thickness, $fn=240);
      // gas bottle
      translate([0,0,thicknessBase]) cylinder(d=diameterGas, h=thickness);
    }
    translate([0,0,thicknessBase+4]) rotate_extrude(convexity = 10) translate([diameterGas/2, 0, 0]) circle(r = 1, $fn = 100);
  }


  // screws
  rotate([0,0,0]) translate([diameter/2-13,0,-0.005]) ScrewThread(20, thickness+0.01, tolerance=1.2);
  rotate([0,0,72]) translate([diameter/2-13,0,-0.005]) ScrewThread(20, thickness+0.01, tolerance=1.2);
  rotate([0,0,144]) translate([diameter/2-13,0,-0.005]) ScrewThread(20, thickness+0.01, tolerance=1.2);
  rotate([0,0,216]) translate([diameter/2-13,0,-0.005]) ScrewThread(20, thickness+0.01, tolerance=1.2);
  rotate([0,0,288]) translate([diameter/2-13,0,-0.005]) ScrewThread(20, thickness+0.01, tolerance=1.2);
  // cups 
  rotate([0,0,36]) translate([(diameter-diameterCup)/2-distanceCup,0,-0.005]) cylinder(d=diameterCup, h=22);
  rotate([0,0,108]) translate([(diameter-diameterCup)/2-distanceCup,0,-0.005]) cylinder(d=diameterCup, h=22);
  rotate([0,0,180]) translate([(diameter-diameterCup)/2-distanceCup,0,-0.005]) cylinder(d=diameterCup, h=22);
  rotate([0,0,252]) translate([(diameter-diameterCup)/2-distanceCup,0,-0.005]) cylinder(d=diameterCup, h=22);
  rotate([0,0,324]) translate([(diameter-diameterCup)/2-distanceCup,0,-0.005]) cylinder(d=diameterCup, h=22);
  
  // holes 
  translate([0,0,-0.005]) cylinder(d=40, h=20);
  //rotate([0,0,20]) translate([diameter/2-25,0,-0.005]) cylinder(d=22, h=22);

}

screwHeight = 70;
screwInsert = 15;
union() {
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
