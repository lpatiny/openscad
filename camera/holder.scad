$fn=60;

bodyHeight=47;
bodyWidth=50;
bodyDepth=50;
bodyRing=37.5;
bodyToothWidth=6;
bodyToothLength=5.6;
lenseDiameter=30.5;

bodyExtension=6.3;

plateLength=110; // 130
plateHeight=5;
pilarLength=10;
pilarHeight=42;

bigHoleDiameter=10;
holeDiameter=5;
holeDistance=80;
holeFromCorner = (plateLength-holeDistance)/2;

difference() {
  cube([plateLength,plateLength,plateHeight]);
  translate([plateLength/2, plateLength/2,-0.5]) cylinder(d=lenseDiameter, bodyHeight*2);

  translate([holeFromCorner, holeFromCorner, -0.5]) cylinder(d=holeDiameter, h=bodyHeight*2);
  translate([plateLength-holeFromCorner, holeFromCorner, -0.5]) cylinder(d=holeDiameter, h=bodyHeight*2);
  translate([holeFromCorner, plateLength-holeFromCorner, -0.5]) cylinder(d=holeDiameter, h=bodyHeight*2);
  translate([plateLength-holeFromCorner, plateLength-holeFromCorner, -0.5]) cylinder(d=holeDiameter, h=bodyHeight*2);
}

translate([0,0,0]) cube([pilarLength,pilarLength,pilarHeight+plateHeight]);
translate([plateLength-pilarLength,0,0]) cube([pilarLength,pilarLength,pilarHeight+plateHeight]);
translate([0,plateLength-pilarLength,0]) cube([pilarLength,pilarLength,pilarHeight+plateHeight]);
translate([plateLength-pilarLength,plateLength-pilarLength,0]) cube([pilarLength,pilarLength,pilarHeight+plateHeight]);


difference() {
  translate([0,0,pilarHeight]) cube([plateLength,plateLength,plateHeight]);
  translate([plateLength/2, plateLength/2,0]) cylinder(d=bodyRing, bodyHeight*2);

  translate([plateLength/2, plateLength/2, 0]) rotate([0,0,45]) translate([bodyRing/2,0,0]) cube([bodyToothLength*4,bodyToothWidth,pilarHeight*3], center=true);
  translate([plateLength/2, plateLength/2, 0]) rotate([0,0,135]) translate([bodyRing/2,0,0]) cube([bodyToothLength*4,bodyToothWidth,pilarHeight*3], center=true);
  translate([plateLength/2, plateLength/2, 0]) rotate([0,0,-135]) translate([bodyRing/2,0,0]) cube([bodyToothLength*4,bodyToothWidth,pilarHeight*3], center=true);
  translate([plateLength/2, plateLength/2, 0]) rotate([0,0,-45]) translate([bodyRing/2,0,0]) cube([bodyToothLength*4,bodyToothWidth,pilarHeight*3], center=true);

  translate([holeFromCorner, holeFromCorner, 0]) cylinder(d=bigHoleDiameter, h=pilarHeight*2);
  translate([plateLength-holeFromCorner, holeFromCorner, 0]) cylinder(d=bigHoleDiameter, h=pilarHeight*2);
  translate([holeFromCorner, plateLength-holeFromCorner, 0]) cylinder(d=bigHoleDiameter, h=pilarHeight*2);
  translate([plateLength-holeFromCorner, plateLength-holeFromCorner, 0]) cylinder(d=bigHoleDiameter, h=pilarHeight*2);

}