length=150;
internalWidth=12+4*2+5;
height=50;
thickness=4;
error=0.001;


difference() {
	cube([length, internalWidth+2*thickness, height+thickness]);
	translate([-error,thickness, thickness]) 
  	cube([length+2*error, internalWidth, height+error]);
  translate([length/2,-thickness,0])
		rotate([0, 90, 90])
		  cylinder(r=30, h=height+2*thickness, $fn=32);
		

}