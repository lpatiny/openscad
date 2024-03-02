

padding = 15;
ledSize = 4.19;
ledPadding = 6;
ledMark = 7;
ledSpacing = 33.3333;
ledStripWidth = 10;
signalWidth = 6;
ledThickness = 2;
frontBorder = 8;

nbLeds = 16;
width = (nbLeds * ledSpacing) + (padding * 2);
interSquare = width + 40;

echo(str("Width: ",width));

difference() {
  square([width, width]);
  for (row =  [1 : 1 : nbLeds]) {
      for (col = [1 : 1 : nbLeds]) {
          translate([padding+row*ledSpacing-ledSpacing/2, padding+col*ledSpacing-ledSpacing/2, 0]) {
              square([ledSize+ledPadding, ledSize+ledPadding], center=true);
          }
      }
  }
  for (row =  [0 : 1 : nbLeds-1]) {
          translate([padding+(nbLeds-row)*ledSpacing, padding+row*ledSpacing, 0]) {
              square([ledStripWidth, ledSpacing+ledStripWidth*2], center=true);
          }
  }
  translate([padding, padding+nbLeds*ledSpacing-ledSpacing/2, 0]) {
              square([ledStripWidth, ledStripWidth*2], center=true);
  }
  for (row =  [2 : 2 : nbLeds-1]) {
          translate([padding, padding+row*ledSpacing, 0]) {
              square([signalWidth, ledSpacing+ledStripWidth*2], center=true);
          }
  }
  for (row =  [1 : 2 : nbLeds-1]) {
          translate([padding+nbLeds*ledSpacing, padding+row*ledSpacing, 0]) {
              square([signalWidth, ledSpacing+ledStripWidth*2], center=true);
          }
  }
}


translate([interSquare, 0, 0]) difference() {
  square([width, width]);
  for (row =  [1 : 1 : nbLeds]) {
      for (col = [1 : 1 : nbLeds]) {
          translate([padding+row*ledSpacing-ledSpacing/2, padding+col*ledSpacing-ledSpacing/2, 0]) {
              square([ledSpacing-frontBorder, ledSpacing-frontBorder], center=true);
          }
      }
  }
}

nbClips = 5 / 8 * nbLeds;
clipWidth = 2;
clipLength = 10;
clipSpace = width / (nbClips);
clipPadding = 3;

translate([0, interSquare, 0]) difference() {
  square([width, width]);
  translate([padding, padding+nbLeds*ledSpacing-ledSpacing/2, 0]) {
              square([ledStripWidth, ledStripWidth*2], center=true);
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

/*
translate([interSquare, interSquare, 0]) difference() {
  square([width, width]);
  for (row =  [1 : 1 : nbLeds]) {
      for (col = [1 : 1 : nbLeds]) {
          translate([padding+row*ledSpacing-ledSpacing/2, padding+col*ledSpacing-ledSpacing/2, 0]) {
              square([ledMark, ledMark], center=true);
          }
      }
  }
}
*/
