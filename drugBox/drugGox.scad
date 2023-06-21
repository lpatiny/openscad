boxLabel = "1";

columnLabels= ["1", "2", "3", "4", "5", "6"];
rowLabels = ["A", "B", "C", "D", "E", "F", "G", "H","I", "J"];


bottleDiameter = 23.0;
interBottle = bottleDiameter + 1;
bottleHeight = 45;
holeHeight = 5;
nbInRow = 6;
nbRows = 10;
thickness = 2;


width = nbInRow * interBottle + thickness * 2;
depth = nbRows * interBottle + thickness * 2;
height = bottleHeight + thickness;

fingerDiameter = 30;
fingerHeight = 20;

difference() {
  cube([width, depth, height]);
  translate([thickness, thickness, thickness + holeHeight]) cube([width-2*thickness, depth-2*thickness, bottleHeight]);
  for (i = [0 : nbInRow-1]) {
    for (j = [0 : nbRows-1]) {
      translate([thickness + i * interBottle + interBottle/2, thickness + j * interBottle + interBottle/2, thickness]) cylinder(h = bottleHeight, d = bottleDiameter);
    }
  }

  // hole to take the drawer
  translate([width/2,5,height-5]) union() {
    rotate([90,0,0]) cylinder(d=fingerDiameter, h=20);
    translate([-fingerDiameter/2,-20,0]) cube([fingerDiameter, 20, fingerHeight]);
  }
  
  // the number labels
  for (i = [0 : nbInRow-1]) {
   translate([thickness + i * interBottle + interBottle/2, 1, 10]) rotate([90,0,0]) linear_extrude(4) text(columnLabels[i], halign="center", size=10, font="Arial:style=Bold");
   translate([thickness + i * interBottle + interBottle/2, depth-1, 10]) rotate([90,0,180]) linear_extrude(4) text(columnLabels[i], halign="center", size=10, font="Arial:style=Bold");
  }

  // the letter labels
  for (i = [0 : nbRows-1]) {
    translate([1, thickness + i * interBottle + interBottle/2, 10]) rotate([90,0,-90]) linear_extrude(4) text(rowLabels[nbRows-i-1], halign="center", size=10, font="Arial:style=Bold");
    translate([width-1, thickness + i * interBottle + interBottle/2, 10]) rotate([90,0,90]) linear_extrude(4) text(rowLabels[nbRows-i-1], halign="center", size=10, font="Arial:style=Bold");
  }

  // the box label
   translate([(width-fingerDiameter)/4, 1, 27]) rotate([90,0,0]) linear_extrude(4) text("Box", size=15, halign="center", font="Arial:style=Bold");
   translate([width - (width-fingerDiameter)/4, 1, 27]) rotate([90,0,0]) linear_extrude(4) text(boxLabel, size=15, halign="center", font="Arial:style=Bold");
}


