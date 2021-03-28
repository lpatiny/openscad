$fn=60;

include <../utils/threads.scad>; 
include <../utils/sector.scad>;

internal=85;
thicknessCube=4;
thicknessInternal=2;
external=100;
outgrowth=6;
thicknessExternal=2;
hole=14;
holeDistance=-3;
cylinderSnap=20;
snap=4;

thickness=thicknessCube+thicknessInternal+thicknessExternal;

// the fix
union() {
  // thread
  difference() {
    union() {
      cylinder(d=hole-0.25, h=thickness-1);
      difference() {
        translate([0,0,-cylinderSnap/2+snap]) rotate([0,90,0]) cylinder(d=cylinderSnap, h=holeDistance+hole/2+10);
        translate ([-250,-250,-30]) cube([500,500,30]);
      }
    }
    translate([0,0,-0.005]) ScrewThread(10.3, 15, pitch=1.5);
  }
  
  // screw
  translate([30, 0, 0]) union() {
    translate([-5, -5, 0]) cube([20,10,3]);
    difference() {
      ScrewThread(9.7, 14, pitch=1.5);
      translate([0, 0, 11]) difference() {
        cylinder(d=10, h=3.1);
        cylinder(d=7.5, h=3.1);
      }
    }

  }
}

difference() {
  height=150;
  union() {
    cylinder(d=60, h=height);
    *translate([0,0,height]) sphere(d=60);
  }
  union() {
    translate([0,0,-0.005]) cylinder(d=58,h=height+0.01);
    *translate([0,0,height]) sphere(d=58);
  }
  translate([0,0,thickness]) rotate([0,90,0]) cylinder(d=38,h=200);
  *translate([0,0,thickness]) rotate([0,90,120]) cylinder(d=35,h=200);
  *translate([0,0,thickness]) rotate([0,90,-120]) cylinder(d=35,h=200);
}


union() {
  difference() {
    union() {
      cylinder(d=external, h=thicknessExternal);
      cylinder(d=internal, h=thickness);
    }
    translate([0,0,-0.005]) cylinder(d=8, h=20);
    translate([internal/2-hole-holeDistance,0,-0.005]) cylinder(d=hole, h=thickness+0.01);
    translate([internal/2-holeDistance-hole,0,cylinderSnap/2+thicknessExternal+thicknessCube-1]) rotate([0,90,0]) cylinder(d=cylinderSnap, h=holeDistance+hole);
  }
  rotate([0,0,150]) translate([0,0,thicknessExternal+thicknessCube]) sector(h=thicknessInternal, d=internal+outgrowth, a=60, i=50);
}
