nbHoles=8;
diameter=10;
slit=3;

fullSize=90;
padding=5;
thickness=8;

translation=fullSize/2-padding-diameter/2;

difference() {
	cylinder(d=fullSize, h=thickness);
	translate([0,0,-0.005]) cylinder(d=10, h=30);
	for (i =  [0 : 1 : nbHoles]) {
	    rotate([0,0,-i/nbHoles*360]) 
	    	translate([translation,0, -0.005 ])
	    		cylinder(h = 30, d=diameter);
	}
	for (i =  [0 : 1 : nbHoles]) {
	    rotate([0,0,-i/nbHoles*360]) 
	    	translate ([translation+diameter/2+padding/2-1,0,-0.005]) cube([padding+2,slit,60],center=true);
	}
}

