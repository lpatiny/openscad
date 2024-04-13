
thickness = 3.8;

splitWidth = 3;
splitDepth = 2;

topWidth = 351;
bottomWidth = topWidth - 4;
shiftWidth = (topWidth - bottomWidth) / 2;
boxWidth = (topWidth - thickness * (splitWidth-1)) / splitWidth;
echo(boxWidth);

topDepth = 222;
bottomDepth = topDepth - 4;
shiftDepth = (topDepth - bottomDepth) / 2;
boxDepth = (topDepth - thickness * (splitDepth-1)) / splitDepth;

height = 68;



for (i=[0:splitDepth-2]) {
  translate([0, i*(height+10)])
difference() {
  polygon([[0,0], [bottomWidth,0], [bottomWidth-shiftWidth, height], [shiftWidth, height]]);
  // add cuts
  for (i=[1:splitWidth-1]) {
    translate([i*boxWidth+(i-1)*thickness, 0])
    square([thickness, height/2]);
  }
}
}

for (i=[0:splitWidth-2]) {
  translate([bottomWidth+10, i*(height+10)])
  difference() {
  polygon([[0,0], [bottomDepth,0], [bottomDepth-shiftDepth, height], [shiftDepth, height]]);
  // add cuts
  for (i=[1:splitDepth-1]) {
    translate([i*boxDepth+(i-1)*thickness, height/2])
    square([thickness, height/2]);
  }
}
}
