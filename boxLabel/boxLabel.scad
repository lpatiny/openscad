

width = 60;
depth = 60;
height = 50;

thickness = 2;
labelHeight = 20;
codeWidth = 3;
epsilon = 0.01;


difference () {
  union () {
    difference() {
      cube([width, depth, height]);
      translate([thickness, thickness, thickness]) cube([width-thickness*2, depth-thickness*2, height]);

      translate([-epsilon,0,height-thickness-labelHeight*0.7071]) rotate(45, v=[1,0,0]) cube([width + 2 * epsilon, labelHeight*2, labelHeight]);
      translate([-epsilon,0,height-thickness-codeWidth*0.7071]) rotate(90) rotate(45, v=[1,0,0]) cube([width + 2 * epsilon, codeWidth*2, codeWidth*2]);
      translate([width+epsilon,depth,height-thickness-codeWidth*0.7071]) rotate(-90) rotate(45, v=[1,0,0]) cube([width + 2 * epsilon, codeWidth*2, codeWidth*2]);

    }
    translate([0,0,height-thickness-labelHeight*0.7071]) rotate(45, v=[1,0,0]) cube([width, labelHeight*2, thickness]);
    translate([-epsilon+codeWidth,0,height-thickness-codeWidth*0.7071]) rotate(90) rotate(45, v=[1,0,0]) cube([width + 2 * epsilon, codeWidth*2, codeWidth*2]);
  }


  translate([-epsilon,-epsilon,height]) cube([width+2*epsilon, depth+2*epsilon, height]);
  translate([-epsilon,-depth -epsilon,0]) cube([width+2*epsilon, depth+2*epsilon, height]);

}
