$fn=30;

pcbLength=51.5;
pcbWidth=29;
pcbHeight=1.5;

deltaHoleL=(49.5+43.7)/2;
deltaHoleW=(26.4+20.4)/2;
holderWidth=8;
holderHeight=7;
holderHole=2.6;

thickness=2;
padding=5;

length=pcbLength+padding*2+thickness*2;
width=pcbWidth+padding*2+thickness*2;
height=50;

difference() {
  cube([length, width, height]);
  translate([thickness, thickness, thickness]) cube([length-thickness*2, width-thickness*2, height]);
}

translate([0,0,0]) cube([length,thickness+padding-0.2,holderHeight+pcbHeight]);
translate([0,width-thickness-padding+0.2,0]) cube([length,thickness+padding-0.2,holderHeight+pcbHeight]);
translate([0,0,0]) cube([thickness+padding-0.2,width,holderHeight+pcbHeight]);
translate([length-thickness-padding+0.2,0,0]) cube([thickness+padding-0.2,width,holderHeight+pcbHeight]);

translate([length/2-deltaHoleL/2, width/2-deltaHoleW/2,0]) holder();
translate([length/2+deltaHoleL/2, width/2-deltaHoleW/2,0]) holder();
translate([length/2-deltaHoleL/2, width/2+deltaHoleW/2,0]) holder();
translate([length/2+deltaHoleL/2, width/2+deltaHoleW/2,0]) holder();

module holder() {
  difference() {
    cylinder(d=holderWidth, h=holderHeight);
    translate([0,0,thickness]) cylinder(d=holderHole, h=holderHeight);
  }
}