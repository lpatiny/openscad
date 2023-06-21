
big = 100;

width = 60;
depth = 60;
height = 35;

thickness = 2;
labelHeight = 10;
codeHeight = 1;
codeColorLayerThickness = 0.5;
epsilon = 0.01;

for (id = [6:1:11]) {
  translate([id%3*(width+10),floor(id/3)*(width+10),0])
  box(boxID=id, width=width, height=height, depth=depth, codeColorLayerThickness=codeColorLayerThickness);
}

//box(boxID=85, width=width, height=height, depth=depth, codeColorLayerThickness=codeColorLayerThickness);

module box(boxID=0, height=10, width=10, depth=10, epslion=0.01, codeColorLayerThickness=codeColorLayerThickness) {
  internalID = 1 + boxID * 2 + 512; // we set always the first and last segment on 
  difference() {
    union() {
      translate([epsilon, epsilon,0]) cube([width-2*epsilon, depth-2*epsilon, height]);
      // top red contour  
      color("green") translate([codeHeight+thickness/2,0,height]) cube([thickness/2, width, codeColorLayerThickness]); // left
      color("blue") translate([width-codeHeight-thickness,0,height]) cube([thickness/2, width, codeColorLayerThickness]); // right
      color("red") translate([0,labelHeight,height]) cube([width, thickness, codeColorLayerThickness]); // front
      color("red") translate([0,depth-codeHeight-thickness,height]) cube([width, thickness, codeColorLayerThickness]); // back

    // code
      realSideLength = depth - codeHeight - labelHeight;
      segmentLength = realSideLength / 10;
        
      for (i = [0:9]) {
        isSet = floor(internalID / 2^i) % 2;
        echo(internalID / 2^i);
        if (isSet) {
          echo(i);
        barShift = i * segmentLength;
        color("green") translate([codeHeight,labelHeight+barShift,height]) cube([thickness/2, segmentLength, codeColorLayerThickness]); // left
        color("blue") translate([width-codeHeight-thickness/2,labelHeight+barShift,height]) cube([thickness/2, segmentLength, codeColorLayerThickness]); // right

        }
      }
    }
    
    difference () {
      translate([thickness, thickness, thickness]) cube([width - 2 * thickness, depth - 2 * thickness, height]);
    
      // cut out the label
      translate([0,thickness, height - labelHeight]) rotate(45, [1,0,0]) cube(big);
      translate([thickness,0, height - codeHeight ]) rotate(90) rotate(45, [1,0,0]) cube(big);
      translate([width-thickness,0, height - codeHeight ]) rotate(90) rotate(45, [1,0,0]) cube(big);
      translate([0,depth - thickness , height - codeHeight]) rotate(45, [1,0,0]) cube(big);
    }

    // remove the external part of the labels
    translate([0, 0, height - labelHeight]) rotate(45, [1,0,0]) cube(big); // fonrt
    translate([0, 0, height - codeHeight ]) rotate(90) rotate(45, [1,0,0]) cube(big); // left
    translate([width, 0, height - codeHeight ]) rotate(90) rotate(45, [1,0,0]) cube(big);
    translate([0, depth , height - codeHeight]) rotate(45, [1,0,0]) cube(big);


  }

}
