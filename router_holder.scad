height = 57;
thickness = 4;
deviceLength = 235;
width = 100;
overlapTop = 6;
overlapBottom = 3;
length = deviceLength + overlapTop;

// we make a polyline of 3 mm thickness that we will extrude

polyline = [
    [-50,-thickness],
    [thickness + height + thickness, -thickness],
    [thickness + height + thickness, overlapTop],
    [thickness + height, overlapTop],
    [thickness + height, 0],
    [0, 0],
    [0, length],
    [thickness + height, length],
    [thickness + height, length - overlapBottom],
    [thickness + height + thickness, length - overlapBottom],
    [thickness + height + thickness, length + thickness],
    [-thickness, length + thickness],
    [-thickness, 0],
    [-thickness - 50, 0]
];

linear_extrude(width)
   polygon(polyline);

