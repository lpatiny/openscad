$fn=60;


width=15;
depth=70;
height=100;
wallDistance=10;
edgesPadding=15;
bigHole = 70;
smallHole = 20;
small=0.01;

difference() {
  union() {
    cube([depth, width, height]);
    translate([0,width,0]) hull() {
      translate([0,0,0]) rotate([90,0,0]) cylinder(d=wallDistance*2, h=width);
      translate([0,0,height]) rotate([90,0,0]) cylinder(d=wallDistance*2, h=width);
    }
  }
  translate([-wallDistance-small, -small, -wallDistance]) cube([wallDistance, width+small*2, height+2*wallDistance]);
  translate([wallDistance, -small, -small])
    cube([depth, width+small*2, edgesPadding]);
  translate([wallDistance, -small, height-edgesPadding+small])
    cube([depth, width+small*2, edgesPadding]);
  translate([bigHole/2+wallDistance, width/2-small, edgesPadding+bigHole ]) 
    rotate([90,0,0])
      cylinder(d=bigHole, h=width+small*4, center=true);
  translate([bigHole/2+wallDistance, width/2-small, edgesPadding+smallHole+10 ]) 
    hull() {
    rotate([90,0,0])
      cylinder(d=smallHole, h=width+small*4, center=true);
    translate([0,0,50]) rotate([90,0,0])
      cylinder(d=smallHole, h=width+small*4, center=true);
    }
  translate([wallDistance+bigHole/2, width/2-small, edgesPadding+bigHole/2 ])
    cube([depth, width+small*2, edgesPadding]);
  translate([wallDistance+bigHole/2, -small, edgesPadding+bigHole/2 ])
    cube([depth, width+small*2, edgesPadding]);
translate([0,width/2,edgesPadding/2]) rotate([0,90,0]) cylinder(d=5.5, h=100, center=true);
translate([0,width/2,height-edgesPadding/2]) rotate([0,90,0]) cylinder(d=5.5, h=100, center=true);
}




