$fn=6;
height=150;
diameter=150;
thickness=12;

difference() {
cylinder(d=diameter, h=height);
translate([0,0,thickness]) cylinder(d=diameter-2*thickness, h=height);
}