$fn=60;


internalDiameter=6;
thickness=2;
diameter=internalDiameter+2*thickness;
length=60;

rectangleHeight=2;
rectangleWidth=5;
rectangleDepth=5;
internalLength=length-rectangleDepth*2;

difference(){
    cylinder(d=diameter,h=length, center=true);
    cylinder(d=diameter-2*thickness,h=internalLength, center=true);
    translate([0,0,-rectangleDepth-internalLength/2]) cube([rectangleWidth,rectangleHeight,rectangleDepth*3],center=true);
    translate([0,0,rectangleDepth+internalLength/2]) cube([rectangleWidth,rectangleHeight,rectangleDepth*3],center=true);
    translate([-100,0,-100]) cube([200,200,200]);
}

translate([]) cube([10,10,10]);



