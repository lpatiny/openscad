$fn=60;

include <../utils/roundedParallelepiped4.scad>;
include <../utils/seal.scad>;

internalLength = 70;
internalWidth = 70;
internalHeight = 20;
paddingHorizontal = 10;
paddingVertical = 2;

length = internalLength + paddingHorizontal*2;
width = internalWidth + paddingHorizontal*2;
height = internalHeight + paddingVertical;

screwDiameter = 3.5;
headDiameter = 6.5;
insertDiameter = 4.5;
headThickness = 2.2;

sealShift = 2.5;
sealDiameter = 2.5;

cableThickness1 = 7.4;
cablePosition1 = 25;
verticalHoleDistance1 = internalHeight+paddingVertical-cableThickness1*2;

cableThickness2 = 6.2;
cablePosition2 = 47;
verticalHoleDistance2 = internalHeight+paddingVertical-cableThickness2;

cableThickness3 = 1.3;
cablePosition3 = 47;
verticalHoleDistance3 = internalHeight+paddingVertical-cableThickness3;

holes = [
  [paddingHorizontal/2, paddingHorizontal/2],
  [length - paddingHorizontal/2, paddingHorizontal/2],
  [length/2, paddingHorizontal/2 -1 ],
  [paddingHorizontal/2, width - paddingHorizontal/2],
  [length - paddingHorizontal/2, width - paddingHorizontal/2],
  [length/2, width - paddingHorizontal/2 +1 ],
  [paddingHorizontal/2 - 1, width /2 ],
  [length - paddingHorizontal/2 + 1, width / 2]
];

difference() {
  union() {
    roundedParallelepiped4(
      internalLength+paddingHorizontal*2,
      internalWidth+paddingHorizontal*2,
      internalHeight+paddingVertical,
      2.5
    );
    translate([paddingHorizontal-sealShift, paddingHorizontal-sealShift, height]) 
      seal(internalLength+2*sealShift,internalWidth+2*sealShift, sealDiameter, 5);
  };
  translate([paddingHorizontal, paddingHorizontal, paddingVertical])
  roundedParallelepiped4(
      internalLength,
      internalWidth,
      internalHeight+0.01,
      2.5
  );
  for (hole = holes) {
      translate([hole[0], hole[1], -0]) cylinder(d=screwDiameter, h=100);
      translate([hole[0], hole[1], -0.01]) cylinder(d=insertDiameter, h=10, $fn=6);
  }
  // big cable hole
  translate([-0.01, cablePosition1 + paddingHorizontal, verticalHoleDistance1+cableThickness1/2]) rotate([0,90,0]) cylinder(d=cableThickness1, h=length+0.02);
  translate([-0.01, cablePosition1-cableThickness1/2 + paddingHorizontal, verticalHoleDistance1+cableThickness1*2.5]) rotate([0,90,0]) cube([cableThickness1*2,cableThickness1,length+0.02]);
  
  // power cable hole
  translate([paddingHorizontal+0.01, cablePosition2 + paddingHorizontal, verticalHoleDistance2+cableThickness2/2]) rotate([0,90,0]) cylinder(d=cableThickness2, h=length+0.02);
  translate([paddingHorizontal+0.01, cablePosition2-cableThickness2/2 + paddingHorizontal, verticalHoleDistance2+cableThickness2*1.5]) rotate([0,90,0]) cube([cableThickness2,cableThickness2,length+0.02]);

  // antenna cable hole
  translate([-paddingHorizontal+0.01, cablePosition3 + paddingHorizontal, verticalHoleDistance3+cableThickness3/2]) rotate([0,90,0]) cylinder(d=cableThickness3, h=length+0.02);
  translate([-paddingHorizontal+0.01, cablePosition3-cableThickness3/2 + paddingHorizontal, verticalHoleDistance3+cableThickness3*2.5]) rotate([0,90,0]) cube([cableThickness3*2,cableThickness3,length+0.02]);
}

translate([width+25,0,0]) difference() {
  roundedParallelepiped4(
    internalLength+paddingHorizontal*2,
    internalWidth+paddingHorizontal*2,
    paddingVertical,
    2.5
  );
  translate([paddingHorizontal-sealShift, paddingHorizontal-sealShift, paddingVertical]) 
    seal(internalLength+2*sealShift,internalWidth+2*sealShift, sealDiameter-0.3, 5);
  for (hole = holes) {
      translate([hole[0], hole[1], -0.01]) cylinder(d=screwDiameter, h=paddingVertical+0.02);
      translate([hole[0], hole[1], -0.01]) cylinder(d=headDiameter, h=paddingVertical-headThickness);
  }
}
