$fn=60;

include <../nuts_bolts/data-metric_cyl_head_bolts.scad>; // database 


internal=150;
thicknessCube=2;
thicknessInternal=2;
external=170;
thicknessExternal=2;
hole=10;
holeDistance=10;
cylinderSnap=20;

thickness=thicknessCube+thicknessInternal+thicknessExternal;

difference() {
	translate([-15, -15, 0]) cube([80, 30, 50]);
	rotate([180,0,0]) nutcatch_parallel("M5", clh=0.1);
	translate([0, 0, 50+e]) hole_through(name="M5", l=50+5, cld=0.1, h=10, hcld=0.4);
	translate([55, 0, 9+e]) nutcatch_sidecut("M8", l=100, clk=0.1, clh=0.1, clsl=0.1);
	translate([55, 0, 50+e]) hole_through(name="M8", l=50+5, cld=0.1, h=10, hcld=0.4);
	translate([27.5, 0, 50+e]) hole_threaded(name="M5", l=60);
}



*difference() {
  union() {
    cylinder(d=external, h=thicknessExternal);
    cylinder(d=internal, h=thickness);
  }

 translate([internal/2-hole-holeDistance,0,-0.0005]) cylinder(d=hole, h=thickness+0.001);
 translate([internal/2-holeDistance-hole,0,cylinderSnap/2+thicknessExternal+thicknessInternal]) rotate([0,90,0]) cylinder(d=cylinderSnap, h=holeDistance+hole);
 rotate([0,0,120]) translate([internal/2-hole-holeDistance,0,-0.0005]) cylinder(d=hole, h=thickness+0.001);
 rotate([0,0,120]) translate([internal/2-holeDistance-hole,0,cylinderSnap/2+thicknessExternal+thicknessInternal]) rotate([0,90,0]) cylinder(d=cylinderSnap, h=holeDistance+hole);
 rotate([0,0,-120]) translate([internal/2-hole-holeDistance,0,-0.0005]) cylinder(d=hole, h=thickness+0.001);
 rotate([0,0,-120]) translate([internal/2-holeDistance-hole,0,cylinderSnap/2+thicknessExternal+thicknessInternal]) rotate([0,90,0]) cylinder(d=cylinderSnap, h=holeDistance+hole);
}
