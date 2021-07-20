$fn=60;

include <../utils/threads.scad>; 
include <../utils/sector.scad>;

thicknessExternal=5;
hole=14;
diameter=55.3;

difference() {
  height=150;
    cylinder(d=diameter, h=height);
    translate([0,0,-0.005]) cylinder(d=diameter-2,h=height+0.01);
}

// the base
union() {
  difference() {
    cylinder(d=diameter, h=thicknessExternal);
    translate([0,0,-0.005]) cylinder(d=diameter-8, h=thicknessExternal+0.01);
  }
}
