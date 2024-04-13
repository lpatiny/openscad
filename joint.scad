$fn=120;

externalDiameter=35;
internalDisameter=26;
thickness=2.5;

difference() {
  cylinder(h=thickness,d=externalDiameter);
  cylinder(h=thickness,d=internalDisameter);

}