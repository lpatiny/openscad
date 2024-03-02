

padding = 10;
ledSize = 5.5;
ledPadding = 6;
ledMark = 7;
ledSpacing = 10;
ledStripWidth = 10;
signalWidth = 6;
ledThickness = 2;
frontBorder = 8;

nbLeds = 32;
width = (nbLeds * ledSpacing) + (padding * 2);
interSquare = width + 10;

echo(str("Width: ",width));



nbClips = 8 ;
clipWidth = 2;
clipLength = 10;
clipSpace = width / (nbClips);
clipPadding = 3;

internalPadding=padding + 40;
horizontalHole=30;
horizontalPadding = 40;
horizontals=[padding+horizontalPadding, width/2, width-padding-horizontalPadding];
verticalHole=60;
verticalPadding = 80;
verticals=[padding+verticalPadding, width-padding-verticalPadding];


translate([0, 0, 0]) difference() {
  square([width, width]);
  for (horizontal = horizontals) {
    for (vertical = verticals) {
      translate([horizontal, vertical, 0]) {
          square([horizontalHole, verticalHole], center=true);
      }
    }
  }

  for (index =  [0 : 1 : nbClips-1]) {
          translate([clipPadding, index*clipSpace + clipSpace/2 - clipLength/2 , 0]) {
              square([clipWidth, clipLength]);
          }
          translate([width - clipPadding - clipWidth, index*clipSpace + clipSpace/2 - clipLength/2, 0]) {
              square([clipWidth, clipLength]);
          }
          translate([index*clipSpace + clipSpace/2 - clipLength/2, clipPadding, 0]) {
              square([clipLength, clipWidth]);
          }
          translate([index*clipSpace + clipSpace/2 - clipLength/2, width - clipPadding - clipWidth, 0]) {
              square([clipLength, clipWidth]);
          }
  }
}

translate([interSquare, 0, 0]) difference() {
  square([width, width]);
  for (row =  [1 : 1 : nbLeds]) {
      for (col = [1 : 1 : nbLeds]) {
          translate([padding+row*ledSpacing-ledSpacing/2, padding+col*ledSpacing-ledSpacing/2, 0]) {
              square([ledMark, ledMark], center=true);
          }
      }
  }
}

