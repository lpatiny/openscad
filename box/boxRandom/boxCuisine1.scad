
height=50;
thickness=2;
width=226;
length=208;

difference() {

  cube([length,width,height-0.005]);

// oeuf
  translate([2,2,2]) cube([100,222,height]);
  // thé
  translate([104,2,2]) cube([30,222,height]);
  // pizza
  translate([136,2,2]) cube([70,170,height]);
 // Decapsuleur
  translate([136,174,2]) cube([70,50,height]);
}

  translate([2 + 100/2,2 + 222 / 2,2]) linear_extrude(1)
  text("DECAPSULEUR", size=9, font="Arial:style=Bold", halign="center", valign="center", $fn=100);

  translate([104 + 30/2,2 + 222 / 2,2]) linear_extrude(1)
  rotate([0,0,90])
  text("PIZZA", size=10, font="Arial:style=Bold", halign="center", valign="center", $fn=100);

  translate([136 + 70/2,2 + 170 / 2,2]) 
  linear_extrude(1)
  text("THE", size=10, font="Arial:style=Bold", halign="center", valign="center", $fn=100);

  translate([136 + 70/2,174 + 50 / 2,2]) linear_extrude(1)
  text("OEUF", size=9, font="Arial:style=Bold", halign="center", valign="center", $fn=100);

