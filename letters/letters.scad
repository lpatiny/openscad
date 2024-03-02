$fn=120;

letter([["C", 10, 20]]);
letter([["J", 12, 18]]);
letter([["K", 12, 18]]);
letter([["O", 12, 18]]);
letter([["R", 2, 18]]);
!letter([["M", 2, 18]]);
letter([["O", 12, 18], ["+", -1, -1, 16, 3], ["F", -1, -1, 29, 0]]);
letter([["J", 12, 18], ["+", -1, -1, 11, 3], ["L", -1, -1, 24, 0]]);

module letter(letters) {
  for (letter = letters) {
    symbol = letter[0];
    holeX = letter[1];
    holeY = letter[2];
    shiftX = letter[3];
    shiftY = letter[4];

    translate([shiftX, shiftY]) {
       linear_extrude(height=2) {
        if (holeX>0) {
          difference() {
            union() {
              text(symbol, size=20, font=".SF NS Rounded:style=Bold G2");
              translate([holeX, holeY]) circle(r=3);
            }
            translate([holeX, holeY]) circle(r=1.5);
          }
        } else {
          text(symbol, size=20, font=".SF NS Rounded:style=Bold G2");
        }
      }
    }
  }
}

