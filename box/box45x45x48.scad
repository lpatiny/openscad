

height=48;
width=45;
thickness=2;

difference() {
cube([width, width, height]);
translate([thickness,thickness,thickness]) cube([width-2*thickness, width-2*thickness, height]);
}