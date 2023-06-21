$fn=60;

radius=78;
thickness=2;
internalRadius = radius-thickness;

difference() {
difference() {
sphere(r=radius);
translate([-radius, -radius, -radius]) cube([radius*2, radius*2, radius]);
}

difference() {
sphere(r=internalRadius);
translate([-radius, -radius, -radius]) cube([radius*2, radius*2, radius]);
}
}