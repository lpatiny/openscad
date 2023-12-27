$fs = 2;
$fa = 2;
$fn = 60;
r_cyl = 10;
h_cyl = 100;

// Take a 2d shape and extrude outward (or inward with r_delta < 0) 
// from a theoretical cylinder of given radius and height (centered).
// Input geometry should fit within the bounds of [-PI*r_cyl, -h/2] and [PI*r_cyl, h/2]
module cylinder_extrude(r_cyl, r_delta, h, eps=0.01) {
  frags = fragments(r_cyl);
  r_corr = r_cyl * cos (180/frags); // get corrected radial offset of cylinder flats
  r_inner = r_delta < 0 ? r_corr + r_delta : r_corr - eps;
  r_outer = r_delta < 0 ? r_corr + eps : r_corr + r_delta;
  stripw = 2 * r_cyl * sin(180/frags);
  prescale = r_inner / r_corr;
  scaler = r_outer / r_inner;
  //echo(r_inner, r_outer, frags, stripw, scaler);
  for(j=[each [0.5:1:frags/2+0.5] ], k=[-1,1]) let(i=j*k) {
    rotate([90,0,90+i*360/frags]) translate([0,0,r_inner]) {
      linear_extrude(abs(r_delta)+eps, scale=[scaler,1], convexity=4) {
        scale([prescale,1]) translate([-i*stripw, 0, 0]) intersection() {
          translate([i*stripw, 0]) square([stripw+eps, h], center=true);
          children();
        }
      }
    }
  }
}

// based on get_fragments_from_r documented on wiki
// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#$fa,_$fs_and_$fn
function fragments(r=1) = ($fn > 0) ?
  ($fn >= 3 ? $fn : 3) :
  ceil(max(min(360.0 / $fa, r*2*PI / $fs), 5));


// text and circle cutout
difference() {
  cylinder(r=r_cyl,h=h_cyl, center=true);
  cylinder_extrude(r_cyl, r_delta=-0.1, h=h_cyl) {
    text("HELLO", halign="center", size=5);
  }
}
