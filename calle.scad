$fn=120;

difference() {
    cube([10,10,10]);
    rotate([0,0,30]) cube([20,12,12]);
}

translate([5,0,5]) rotate([90,0,0])  cylinder(d=5,h=5);