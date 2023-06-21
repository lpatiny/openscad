
wellDiameter = 22;
wellHeight = 44;

thickness=3;

numberWell=9;
numberDrawer=4;
gap=0.5;


drawerWidth = 2*thickness + numberWell * wellDiameter;
drawerDepth = 2*thickness + numberWell * wellDiameter;
drawerHeight = thickness+wellHeight;

fullWidth = 2*thickness + 2*gap + drawerWidth;
fullDepth = thickness + gap + drawerDepth;
fullHeight = thickness + (gap + drawerHeight + gap + thickness) * numberDrawer;

difference() {
  cube([fullWidth, fullDepth, fullHeight ]);

  for (i = [0:numberDrawer-1]) {
    translate([thickness, -0.01, thickness + (gap + drawerHeight + gap + thickness) * i]) {
      cube([drawerWidth+2*gap, drawerDepth+gap, drawerHeight+2*gap]);
    }
  }

}



