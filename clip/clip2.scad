$fn=6;

internalDiameter=7;
thickness=1.5;
diameter=internalDiameter+2*thickness;
length=60;

rectangleHeight=2;
rectangleWidth=5;
rectangleDepth=5;
internalLength=length-rectangleDepth*2;

connectorDistance=10;
connectorLength=15;
connectorHoleDiameter=2.5;
connectorDiameter=2;

if (true) {
translate([0,diameter+connectorDistance,0]) half();
} else {


half();
translate([0,diameter/2,-diameter/4+1.5]) cube([length,2,1.5]);
translate([0,diameter/2-2,0]) cube([length,4,2.5]);

translate([0,-diameter/2-2,-diameter/4+1.5]) cube([length,2,1.5]);
translate([0,-diameter/2-2,0]) cube([length,4,2.5]);
}

module half() {
difference() {
  rotate([30,0,0]) rotate([0,90,0]) cylinder(d=diameter, h=length);
  rotate([30,0,0]) translate([rectangleDepth,0,0]) rotate([0,90,0]) cylinder(d=internalDiameter, h=internalLength);
  translate([0, -rectangleWidth/2,-(rectangleHeight/2)]) cube([rectangleWidth,rectangleDepth,rectangleHeight]);
  translate([length-rectangleDepth, -rectangleWidth/2,-(rectangleHeight/2)]) cube([rectangleWidth,rectangleDepth,rectangleHeight]);
  translate([0,-diameter/2,-diameter/2]) cube([length,diameter, diameter/2]);
}
}

