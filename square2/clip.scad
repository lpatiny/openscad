
clipThickness = 1.5;
clipWidth = 9.5;


clipPadding = 3;
clipEdgeBottom = 1;
clipEdgeSlope = 1;
clipEdgeOver = 2;
clipEdgeThickness = 1;

clipLength = clipPadding+clipEdgeBottom+clipEdgeSlope+clipEdgeOver;

clipHeight = 12.2;




linear_extrude(height = clipWidth)
  polygon(points = 
    [
      [0,0],[clipLength,0],
      [clipLength,-clipThickness],[-clipThickness,-clipThickness],
      [-clipThickness,clipThickness+clipHeight],[clipLength, clipThickness+clipHeight],
      [clipLength,clipHeight],
      // the little edge
      [clipLength-clipEdgeOver,clipHeight],
      [clipLength-clipEdgeOver-clipEdgeSlope,clipHeight-clipEdgeThickness],
      [clipLength-clipEdgeOver-clipEdgeSlope-clipEdgeBottom,clipHeight-clipEdgeThickness],
      [clipLength-clipEdgeOver-clipEdgeSlope-clipEdgeBottom,clipHeight],


     [0,clipHeight],

    ]
);
