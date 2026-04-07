


holderWidth = 70.75;
holderHole = 3.1;

fanWidth = 108.9 - 4.30;
fanHole = 4.1;

fanExternal = 130;
fanInternal = 120;
fanRoundCornerDiameter = 10;

difference() {
  hull() {
    translate([(fanExternal/2)-(fanRoundCornerDiameter/2), (fanExternal/2)-(fanRoundCornerDiameter/2)]) circle(d=fanRoundCornerDiameter);
    translate([-(fanExternal/2)+(fanRoundCornerDiameter/2), (fanExternal/2)-(fanRoundCornerDiameter/2)]) circle(d=fanRoundCornerDiameter);
    translate([(fanExternal/2)-(fanRoundCornerDiameter/2), -(fanExternal/2)+(fanRoundCornerDiameter/2)]) circle(d=fanRoundCornerDiameter);
    translate([-(fanExternal/2)+(fanRoundCornerDiameter/2), -(fanExternal/2)+(fanRoundCornerDiameter/2)]) circle(d=fanRoundCornerDiameter);
  }

  difference() {
    circle(d=fanInternal);
    // 4 diagonal holders for the small fan holes
    rotate(45) {
      square([10, fanExternal], center=true);
      square([fanExternal, 10], center=true);
    }

  }

  translate([holderWidth/2, holderWidth/2]) circle(d=holderHole);
  translate([-holderWidth/2, holderWidth/2]) circle(d=holderHole);
  translate([holderWidth/2, -holderWidth/2]) circle(d=holderHole);
  translate([-holderWidth/2, -holderWidth/2]) circle(d=holderHole);

  translate([fanWidth/2, fanWidth/2]) circle(d=fanHole);
  translate([-fanWidth/2, fanWidth/2]) circle(d=fanHole);
  translate([fanWidth/2, -fanWidth/2]) circle(d=fanHole );
  translate([-fanWidth/2, -fanWidth/2]) circle(d=fanHole);
}

