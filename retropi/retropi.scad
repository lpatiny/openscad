$fn=60;
witdh = 650;
depth = 300;



keysetDistance=350;
difference() {
  translate ([-150,-100,0]) square( [witdh, depth]);
  keyset();

  translate([keysetDistance, 0, 0]) {
   keyset(); 
  }
}


module keyset() {
  buttonDiameter = 28;

  joystickDiameter = 18;
  joystickScrew = 5.2;
  joystickWidth = 39.9;
  joystickHeight = 82.1;

  buttons= [
    [-20, 120],
    [19, 120],
    [0, 0],
    [0, 39],
    [31.25, 18],
    [31.25, 18 + 39],
    [31.25 + 35, 27],
    [31.25 + 35, 27 + 39],
    [31.25 + 35 + 36, 27],
    [31.25 + 35 + 36, 27 + 39]
  ];

  for (idx = [ 0 : len(buttons) - 1 ] ) {
    translate([buttons[idx][0], buttons[idx][1], 0]) circle(d=buttonDiameter);
  }

  translate([31.25 - 36 - 59, 27, 0]) {
    translate([0, 0, 0]) circle(d=joystickDiameter);
    translate([joystickWidth / 2, joystickHeight / 2, 0]) circle(d=5);
    translate([-joystickWidth / 2, joystickHeight / 2, 0]) circle(d=5);
    translate([joystickWidth / 2, -joystickHeight / 2, 0]) circle(d=5);
    translate([-joystickWidth / 2, -joystickHeight / 2, 0]) circle(d=5);
  }
}

