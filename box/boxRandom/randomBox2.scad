
height=40;
thickness=2;

difference() {

cube([248,208,height-0.005]);

  translate([2,2,2]) cube([50,204,height]); // crayons
  translate([54,2,2]) cube([50,160,height]); // stylo
  translate([106,2,2]) cube([50,160,height]); // colle
  translate([158,2,2]) cube([46,79,height]); // divers
  translate([158,83,2]) cube([46,79,height]); // divers
  translate([206,2,2]) cube([40,120,height]); // scotch
  translate([206,124,2]) cube([40,82,height]); // cachet
  translate([54,164,2]) cube([150,42,height]); // surligneur



}