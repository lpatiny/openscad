$fn=60;
distance = 33.3;
nbLeds = 16;
diameter = 5.5;

width = distance * nbLeds;
thickness = 3;


difference() {
	square([width, width]);
  
	for (x =  [0 : 1 : nbLeds]) {
	  for (y =  [0 : 1 : nbLeds]) {
	    	translate([x*distance+distance/2,y*distance+distance/2 ])
	    		circle( d=diameter);
    }
	}
}
