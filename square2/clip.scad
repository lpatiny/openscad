
clipWidth = 2;
clipLength = 10;
clipPadding = 3;
clipHeight = 10;
clipThickness = 1.5;


difference() {
  cube([clipLength, clipPadding+clipWidth+clipThickness, clipHeight + 2*clipThickness,]);
  translate([0,clipThickness,clipThickness])
  le
    cube([clipLength, clipPadding+clipWidth+clipThickness,,clipHeight]);
}

difference() {
  translate([clipLength/2,0,0]) rotate([30,0,0]) cube([clipLength, clipWidth, clipWidth], center=true);
  cube([clipLength, clipWidth, clipWidth*2]);

}
