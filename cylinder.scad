$fn=120;

diameter=91;
smallDiameter=87.2;
height=150;
thickness=2;

difference() {
cylinder(d2=diameter, d1=diameter-1, h=20);
translate([0,0,-0.05]) cylinder(d2=diameter-2*thickness, d1=diameter-1-2*thickness, h=20.1);

}

translate([0,0,18]) difference() {
cylinder(d=smallDiameter, h=height);
translate([0,0,-0.05]) cylinder(d=smallDiameter-2*thickness, h=height+0.1);
}