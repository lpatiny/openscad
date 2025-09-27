
height=40;
thickness=2;

difference() {

cube([248,208,height-0.005]);

  translate([2,2,2]) cube([40,40,height]);
  translate([44,2,2]) cube([202,40,height]);

  translate([2,44,2]) cube([60,100,height]);
  translate([64,44,2]) cube([70,100,height]);
  translate([136,44,2]) cube([80,100,height]);
  translate([218,44,2]) cube([28,100,height]);

  translate([2,146,2]) cube([20,60,height]);
  translate([24,146,2]) cube([40,60,height]);
  translate([66,146,2]) cube([40,60,height]);
  translate([108,146,2]) cube([40,60,height]);
  translate([150,146,2]) cube([30,60,height]);
  translate([182,146,2]) cube([64,60,height]);

}