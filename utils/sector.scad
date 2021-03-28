* Demo();

module Demo() {
  translate([0,0,0]) sector(30, 20, 70, i=3);
  translate([22,0,0]) sector(30, 20, 290, i=10);
  translate([22,22,0]) sector(30, 20, 180, i=2);
}

module sector(h, d, a, i=0) {
    if (a > 180) {
        difference() {
            cylinder(h=h, d=d);
            translate([0,0,-0.5]) sector(h+1, d+1, a-360); 
            translate([0,0,-0.5]) cylinder(h=h+1, d=i);
        }
    } else {
        difference() {
            cylinder(h=h, d=d);
            translate([-d/2, -d/2, -0.5])
                cube([d, d/2, h+1]);
            rotate([0,0,a]) translate([-d/2, 0, -0.5])
                cube([d, d/2, h+1]);
            translate([0,0,-0.5]) cylinder(h=h+1, d=i);
        }
    }
}  