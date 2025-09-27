
$fn=120;

external=17.5;
internal=12.5;
height=20;
width=18;
holeWidth=4;
holeHeight=4;

shift = (external - internal) / 2;

difference() {
  cube([external, width, height]);
  translate([shift+internal/2,shift+internal/2,-0.01]) cylinder(d=internal, h=height+2 );
  translate([shift,shift+internal/2,-0.01]) cube([internal, internal, height+2]);
  translate([-1,width-holeHeight,(height-holeWidth)/2]) cube([external+2, holeHeight, holeWidth]);

}
