$fn=60;

height=19;
thickness=1.2;
diameter=8.75;
expand=3;
expandThickness=1.5;
overlap=0.02;


difference() {
  union() {
    cylinder(h=height,d=diameter);
    translate([0,0,-expandThickness]) cylinder(h=expandThickness,d=diameter+expand*2);
  }
  translate([0,0,-5]) cylinder(h=height+10,d=diameter-thickness*2);
}

!translate([20,0,0]) difference() {
  union() {
    cylinder(h=height+expandThickness,d=diameter-2*thickness+overlap);
    translate([0,0,-expandThickness]) cylinder(h=expandThickness,d=diameter+expand*2);
  }
  translate([0,0,-5]) cylinder(h=height+10,d=diameter-thickness*4+overlap);
}