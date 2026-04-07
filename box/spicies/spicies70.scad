// Parametric spice box
width = 70;
depth = 200;
height = 40;
thickness = 2;
compartments = 3; // number of compartments in the depth direction

// Derived values
compartmentWidth = width - 2 * thickness;
compartmentDepth = (depth - (compartments + 1) * thickness) / compartments;

difference() {
    cube([width, depth, height]);

    for (i = [0 : compartments - 1]) {
        translate([
            thickness,
            thickness + i * (compartmentDepth + thickness),
            thickness
        ])
        cube([compartmentWidth, compartmentDepth, height]);
    }
}
