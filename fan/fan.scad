// ============================================================
// 92mm Fan Holder
// Fan is VERTICAL (XZ-plane), slides DOWN from the top.
// Two U-brackets (left/right) capture the fan edges.
// Y-direction (fan faces) are fully open — no wall blocks airflow.
// ============================================================

/* [Fan] */
fan_size    = 92;   // Fan outer side length (mm) — square
fan_thick   = 25;   // Fan body depth in Y (mm)
fan_clear_x = 0.4;  // Gap between outer wall and fan face (mm)
fan_clear_y = 0.5;  // Gap between arm and fan face in Y (mm)
fan_behind  = 10;   // Gap from pin-area rear edge to bracket front arm (mm)

/* [Pin Mounting] */
pin_hole_r  = 2.2;  // Pin radius (mm)
pin_clear   = 0.4;  // Extra radius clearance for printing tolerance (mm)
pin_wall    = 2.5;  // Socket wall thickness (mm)
pin_sock_h  = 6;    // Socket height above base plate (mm)
base_t      = 3;    // Base bridge plate thickness (mm)

pin_dx      = 56.6; // X distance between pins in same row (mm)
pin_dy      = 21.5; // Y distance between rows (mm)
pin_shift_x = 5.0;  // X offset of back row vs front row (mm)

/* [U-Brackets] */
arm_t       = 3;    // Arm and outer wall thickness (mm)
arm_d       = 6;    // Arm depth extending inward over fan edge (mm)
bracket_h   = 102;  // Total bracket height (fan_size + entry margin) (mm)

$fn = 36;

// ============================================================
// Derived — do not edit
// ============================================================

pin_pos = [
    [0,                    0     ],
    [pin_dx,               0     ],
    [pin_shift_x,          pin_dy],
    [pin_shift_x + pin_dx, pin_dy]
];

cx   = (pin_pos[0][0] + pin_pos[1][0] + pin_pos[2][0] + pin_pos[3][0]) / 4;
y_hi = pin_pos[2][1] + pin_hole_r + pin_wall;

fan_x0 = cx - fan_size / 2;    // left outer face of fan
fan_y0 = y_hi + fan_behind;    // near (front) face of fan

// Y bounds of the bracket arms (outside the fan + clearance)
arm_y_front = fan_y0 - arm_t - fan_clear_y;
arm_y_back  = fan_y0 + fan_thick + fan_clear_y;

// ============================================================
// U-bracket modules: outer wall + front arm + back arm
// ============================================================

module left_bracket() {
    wall_x = fan_x0 - fan_clear_x - arm_t;  // outer wall left face
    union() {
        // Outer wall (YZ slab)
        translate([wall_x, arm_y_front, 0])
            cube([arm_t, fan_thick + 2*(arm_t + fan_clear_y), bracket_h]);
        // Front arm (XZ slab extending inward)
        translate([wall_x + arm_t, arm_y_front, 0])
            cube([arm_d, arm_t, bracket_h]);
        // Back arm
        translate([wall_x + arm_t, arm_y_back, 0])
            cube([arm_d, arm_t, bracket_h]);
    }
}

module right_bracket() {
    wall_x = fan_x0 + fan_size + fan_clear_x;  // outer wall left face
    union() {
        // Outer wall (YZ slab)
        translate([wall_x, arm_y_front, 0])
            cube([arm_t, fan_thick + 2*(arm_t + fan_clear_y), bracket_h]);
        // Front arm (extending inward, i.e. in -X)
        translate([wall_x - arm_d, arm_y_front, 0])
            cube([arm_d, arm_t, bracket_h]);
        // Back arm
        translate([wall_x - arm_d, arm_y_back, 0])
            cube([arm_d, arm_t, bracket_h]);
    }
}

// ============================================================
// Assembly
// ============================================================

difference() {
    union() {

        // Pin-area base plate
        hull()
            for (p = pin_pos)
                translate([p[0], p[1], 0])
                    cylinder(r = pin_hole_r + pin_wall, h = base_t);

        // Left arm: left pin pair → left bracket outer wall
        hull() {
            translate([pin_pos[0][0], pin_pos[0][1], 0])
                cylinder(r = pin_hole_r + pin_wall, h = base_t);
            translate([pin_pos[2][0], pin_pos[2][1], 0])
                cylinder(r = pin_hole_r + pin_wall, h = base_t);
            translate([fan_x0 - fan_clear_x - arm_t, arm_y_front, 0])
                cube([arm_t, arm_t, base_t]);
        }

        // Right arm: right pin pair → right bracket outer wall
        hull() {
            translate([pin_pos[1][0], pin_pos[1][1], 0])
                cylinder(r = pin_hole_r + pin_wall, h = base_t);
            translate([pin_pos[3][0], pin_pos[3][1], 0])
                cylinder(r = pin_hole_r + pin_wall, h = base_t);
            translate([fan_x0 + fan_size + fan_clear_x, arm_y_front, 0])
                cube([arm_t, arm_t, base_t]);
        }

        // Pin sockets
        for (p = pin_pos)
            translate([p[0], p[1], 0])
                cylinder(r = pin_hole_r + pin_wall, h = base_t + pin_sock_h);

        // U-brackets
        left_bracket();
        right_bracket();
    }

    // Pin holes — extend 2 mm past each face for clean subtraction
    for (p = pin_pos)
        translate([p[0], p[1], -2])
            cylinder(r = pin_hole_r + pin_clear, h = base_t + pin_sock_h + 4);
}
