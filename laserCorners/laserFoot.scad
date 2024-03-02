$fn=120;

diameterTop=25;
diameterBottom=20;
diameterInside=10;
diamaterScrew = 5.2;
height=80;
internalHeight=14;

difference() {
  cylinder(d1=diameterTop,d2=diameterBottom,h=height);
  translate([0,0,-0.1]) cylinder(d=diamaterScrew,h=height);
  translate([0,0,internalHeight]) cylinder(d=diameterInside,h=height);
}


