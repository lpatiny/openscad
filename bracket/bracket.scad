width=200;
thickness=8;
depth=150;
height=100;
interScrew=(150.56+126.45)/2;
screwDiameter=10;
screwBigDiameter=25;
screwSmallDiameter=6;

screwHeight=height/1.4142/2;
screwDistance=(width-interScrew)/2;

difference() {
  union() {
    cube([width, depth, thickness]);
    translate([0,thickness,0]) rotate([90,0,0]) cube([width, height, thickness]);
    translate([0,0,height/1.4142]) rotate([-45,0,0]) cube([width, height, thickness]);
  }
  translate([screwDistance,-0.005,screwHeight]) rotate([-90,0,0])  cylinder(d=screwDiameter, h=height);
  translate([width-screwDistance,-0.005,screwHeight]) rotate([-90,0,0])  cylinder(d=screwDiameter, h=height);
  translate([screwDistance,thickness+0.005,screwHeight]) rotate([-90,0,0])  cylinder(d=screwBigDiameter, h=height);
  translate([width-screwDistance,thickness+0.005,screwHeight]) rotate([-90,0,0])  cylinder(d=screwBigDiameter, h=height);
  
  translate([screwDistance,screwHeight+thickness*1.4142,-0.005]) cylinder(d=screwSmallDiameter, h=height);
  translate([width-screwDistance,screwHeight+thickness*1.4142,-0.005]) cylinder(d=screwSmallDiameter, h=height);
  translate([screwDistance,screwHeight+thickness*1.4142,thickness+0.005]) cylinder(d=screwBigDiameter, h=height);
  translate([width-screwDistance,screwHeight+thickness*1.4142,thickness+0.005]) cylinder(d=screwBigDiameter, h=height);
  
  translate([screwDistance,depth-20.4142,-0.005]) cylinder(d=screwSmallDiameter, h=height);
  translate([width-screwDistance,depth-20,-0.005]) cylinder(d=screwSmallDiameter, h=height);
  translate([width/2,depth-20,-0.005]) cylinder(d=screwSmallDiameter, h=height);
}