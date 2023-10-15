$fn=120;

thickness=2; // thickness of the wall and top
padding=5;
height=19; // thickness of the hole
topDiameter=38.5;
bottomDiameter=36.5;

holes=[3.5,4,7.5]; // specify the number of holes and their diameters

nbHoles = len(holes);

difference() {
	union() {
		cylinder(h=height, d1=topDiameter, d2=bottomDiameter);
		cylinder(h=thickness, d=topDiameter+padding);
	}
	translate([0,0,thickness]) {
    difference() {
      cylinder(h=height, d=bottomDiameter-thickness*2);
    for (i=[0:nbHoles-1]) {
      rotate([0,0,i*360/nbHoles]) translate([topDiameter/2-thickness-holes[i]/2,0,-1]) union () {
        translate([0,-holes[i]/2-thickness,0]) cube([holes[i]+padding, holes[i]+thickness*2, height+thickness]);
        cylinder(h=height+thickness, d=holes[i]+thickness*2);
      }
    }
    }
  }
    for (i=[0:nbHoles-1]) {
      rotate([0,0,i*360/nbHoles]) translate([topDiameter/2-thickness-holes[i]/2,0,-1]) union () {
        translate([0,-holes[i]/2,0]) cube([holes[i]+padding, holes[i], height+thickness]);
        cylinder(h=height+thickness, d=holes[i]);
      }
   }
}



