$fn=60;

include <../utils/roundedParallelepiped4.scad>;

internalLength = 50;
internalWidth = 30;
internalHeight = 10;
paddingHorizontal = 8;
paddingVertical = 4;

width = internalWidth + paddingHorizontal*2;
length = internalLength + paddingHorizontal*2;
height = internalHeight + paddingVertical;

screwDiameter = 3.5;
headDiameter = 6;


!seal(30,20,1,5);



holes = [
  [paddingHorizontal/2 + screwDiameter/2, paddingHorizontal/2 + screwDiameter/2],
  [length - (paddingHorizontal/2 + screwDiameter/2), paddingHorizontal/2 + screwDiameter/2],
  [length/2, paddingHorizontal/2 ],
  [paddingHorizontal/2 + screwDiameter/2, width - (paddingHorizontal/2 + screwDiameter/2)],
  [length - (paddingHorizontal/2 + screwDiameter/2), width - (paddingHorizontal/2 + screwDiameter/2)],
  [length/2, width - paddingHorizontal/2 ]
];

difference() {
roundedParallelepiped4(
    internalLength+paddingHorizontal*2,
    internalWidth+paddingHorizontal*2,
    internalHeight+paddingVertical,
    5
);
translate([paddingHorizontal, paddingHorizontal, paddingVertical])
roundedParallelepiped4(
    internalLength,
    internalWidth,
    internalHeight+0.01,
    5
);
for (hole = holes) {
    translate([hole[0], hole[1], -0]) cylinder(d=screwDiameter, h=100);
    translate([hole[0], hole[1], -0.01]) cylinder(d=headDiameter, h=height-4);
}

}