
/*
Suppliers:
- https://mymetal.ch/fr/53-profil-equerre-a-aile-egale-aluminium.html

*/

radius=40;
thickness=4;
topSpacing=4;
topGap=5; // space on the side of the top

width = 2000;
depth = 700;
height = 500;

opacity=0;

translate([0,0,0]) cube( [width,radius, radius]);
translate([0,depth-radius,0]) cube( [width,radius, radius]);
for (i=[0:(width-radius)/4:width-radius]) {
  translate([i,0,0]) cube([radius, depth, radius]);
  translate([i,0,0]) cube([radius, radius, height]);
  translate([i,depth-radius,0]) cube([radius, radius, height]);
}

translate([0,0,height-radius]) cube( [width,radius, radius]);
translate([0,depth-radius,height-radius]) cube( [width,radius, radius]);
translate([0,0,height-radius]) cube([radius, depth, radius]);
translate([width-radius,0,height-radius]) cube([radius, depth, radius]);

if (opacity>0) {
  translate([0,-thickness,0]) color("grey", opacity) cube([width, thickness, height+radius+topGap]);
  translate([0,depth,0]) color("grey", opacity) cube([width, thickness, height+radius]);
  translate([-thickness,0,0]) color("grey", opacity) cube([thickness, depth, height+radius+topGap]);
  translate([width,0,0]) color("grey", opacity) cube([thickness, depth, height+radius+topGap]);
}

// top
color("blue") translate([topGap,topGap,height+topSpacing]) {
  translate([0,0,0]) cube( [width-2*topGap,radius, radius]);
  translate([0,depth-radius-2*topGap,0]) cube( [width-2*topGap,radius, radius]);
  for (i=[0:(width-radius-2*topGap)/4:width-radius-2*topGap]) {
    translate([i,0,0]) cube([radius, depth-2*topGap, radius]);
  }
}
if (opacity>0) {
  translate([-thickness,-thickness,height+topGap+radius]) color("blue", opacity) cube([width+2*thickness, depth+2*thickness, thickness]);
}



