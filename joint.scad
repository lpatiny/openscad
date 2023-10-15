$fn=120;

externalDiameter=43;
internalDisameter=36;
thickness=1;

difference() {
  cylinder(h=thickness,d=externalDiameter);
  cylinder(h=thickness,d=internalDisameter);

}