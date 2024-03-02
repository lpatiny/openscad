$fn=60;
thickness=2;
width=20;
overlap=8;
panelThickness=5;
holeDiameterMax=6.5;
holeDiameterMin=3.7;

difference() {
  cube([20,20,thickness*2+panelThickness]);
  translate([0,thickness,thickness]) cube([20,20,panelThickness]);
  translate([0,thickness+overlap,thickness]) cube([20,20,20]);
  translate([width/2,thickness+overlap+holeDiameterMax/2,0]) cylinder(h=thickness, d1=holeDiameterMin, d2=holeDiameterMax, center=false);

}

