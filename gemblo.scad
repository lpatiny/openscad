
diameter=13.6;
height=4.14;
slope=1.2;

translate=11.8;



hexagon(diameter, height, slope);
translate([translate,0,0]) hexagon(diameter, height, slope);
translate([translate*2,0,0]) hexagon(diameter, height, slope);
translate([translate*3,0,0]) hexagon(diameter, height, slope);


module hexagon(diameter, height, slope=0) {

  rotate([0,0,30]) union() {
    translate([0,0,slope]) cylinder(d=diameter, h=height-slope*2, $fn=6);
    cylinder(d2=diameter, d1=diameter-slope*2, h=slope, $fn=6);
    translate([0,0,height-slope]) cylinder(d1=diameter, d2=diameter-slope*2, h=slope, $fn=6);
  }
}