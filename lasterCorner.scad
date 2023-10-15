$fn=120;

height=10;
cut=30;
diameter=20.2;
padding=8;

distanceX = 21 / 2;
distanceY = 69 - 21 / 2; 

width=distanceX+diameter+cut+padding;
depth=distanceY+diameter+cut+padding;

difference() {
  cube([width,depth,height]);
  translate([0,0,-0.5]) cube([cut,cut,height+1]);
  translate([cut+distanceX+diameter/2,cut+distanceY+diameter/2,-0.5]) cylinder(d=diameter,h=height+1);

}

