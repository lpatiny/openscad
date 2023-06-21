

buttonDiameter = 20;

joystickDiameter = 20;
joystickWidth = 50;
joystickHeight = 80;

buttons= [
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
  translate([0, 0, 0]) circle(d=5);
  translate([joystickWidth / 2, joystickHeight / 2, 0]) circle(d=5);
  translate([-joystickWidth / 2, joystickHeight / 2, 0]) circle(d=5);
  translate([joystickWidth / 2, -joystickHeight / 2, 0]) circle(d=5);
  translate([-joystickWidth / 2, -joystickHeight / 2, 0]) circle(d=5);
}
