
height=50;
thickness=2;
width=120;
length=208;

difference() {

  cube([length,width,height-0.005]);


  // Eplucheurs
  translate([length-120-2,2,2]) cube([120,79,height]);

// Ail
  translate([length-165-2,width-35-2,2]) cube([165,35,height]);

// helices
  translate([2,2,2]) cube([45,40,height]);


// bouchons
  translate([49,2,2]) cube([35,79,height]);
  translate([2,44,2]) cube([37,74,height]);
  translate([2,44,2]) cube([77,37,height]);
}
  // add text in the middle helices
  translate([2 + 45/2,2 + 40 / 2,2]) linear_extrude(1)
  text("HELIX", size=9, font="Arial:style=Bold", halign="center", valign="center", $fn=100);

  // add text in the middle Ail
  translate([length-165/2-2,width-35/2-2,2]) linear_extrude(1)
  text("AIL", size=10, font="Arial:style=Bold", halign="center", valign="center", $fn=100);

  // add text in the middle Bouchons
  translate([44,60,2]) linear_extrude(1)
  text("BOUCHONS", size=9, font="Arial:style=Bold", halign="center", valign="center", $fn=100);
  

  // add text in the middle Eplucheurs
  translate([length-120/2-2,40,2]) linear_extrude(1)
  text("EPLUCHEURS", size=9, font="Arial:style=Bold", halign="center", valign="center", $fn=100);
