// ============================================================
// 92mm Fan Holder — tilted, with left/right alignment choice
// Fan is vertical but tilted tilt_deg degrees toward the front (−Y).
// U-bracket arms are parallelogram prisms that follow the tilt.
// All faces at Z=0 are flat → printable without supports.
// Fan slides in along the tilt axis from the top.
// ============================================================

/* [Fan] */
fan_size    = 92;     // Fan outer side length (mm) — square
fan_thick   = 25;     // Fan body depth in Y (mm)
fan_clear_x = 0.4;   // Gap between outer wall and fan face in X (mm)
fan_clear_y = 0.5;   // Gap between arm and fan in Y (mm)
fan_behind  = 5;    // Gap from pin-area rear edge to front arm at Z=0 (mm)
tilt_deg    = 10;    // Tilt angle toward front — degrees from vertical
fan_align   = "right"; // "left" = fan centred on left pin pair, "right" = right pin pair

/* [Pin Mounting] */
pin_hole_r  = 2.2;  // Pin radius (mm)
pin_clear   = 0.4;  // Extra radius clearance for printing tolerance (mm)
pin_wall    = 2.5;  // Socket wall thickness (mm)
pin_sock_h  = 6;    // Socket height above base plate (mm)
base_t      = 3;    // Base bridge plate thickness (mm)

pin_dx      = 53.8; // X distance between pins in same row (mm)
pin_dy      = 19.7; // Y distance between rows (mm)
pin_shift_x = -5.0;  // X offset of back row vs front row (mm)

/* [U-Brackets] */
arm_t       = 3;    // Arm and outer-wall thickness (mm)
arm_d       = 6;    // Arm depth extending inward over fan edge (mm)
bracket_h   = 60;   // Total Z height of U-brackets (mm)

$fn = 36;
eps = 0.01;  // thin face for hull slabs

// ============================================================
// Derived — do not edit
// ============================================================

pin_pos = [
    [0,                    0     ],
    [pin_dx,               0     ],
    [pin_shift_x,          pin_dy],
    [pin_shift_x + pin_dx, pin_dy]
];

// Outermost pin X — leftmost is front-left (x=0), rightmost is back-right (shifted)
left_most_x  = min(pin_pos[0][0], pin_pos[2][0]);   // = 0
right_most_x = max(pin_pos[1][0], pin_pos[3][0]);   // = pin_shift_x + pin_dx
y_hi         = pin_pos[2][1] + pin_hole_r + pin_wall;

// Fan outer edge flush with outer socket wall
fan_x0 = (fan_align == "left")
         ? left_most_x  - (pin_hole_r + pin_wall)
         : right_most_x + (pin_hole_r + pin_wall) - fan_size;
fan_y0 = y_hi + fan_behind;     // front face of fan at Z=0

// Slide-path geometry — driven by bracket_h directly
H_dz = bracket_h;               // Z height of bracket
H    = bracket_h / cos(tilt_deg); // total slide length along fan axis
H_dy = bracket_h * tan(tilt_deg); // Y shift from Z=0 to Z=H_dz (toward front)

// Arm Y positions at Z=0
arm_yf0 = fan_y0 - fan_clear_y - arm_t;      // front arm base face
arm_yb0 = fan_y0 + fan_thick + fan_clear_y;   // back arm base face
arm_span = arm_yb0 - arm_yf0 + arm_t;         // outer-wall Y span

// ============================================================
// U-bracket modules
// Each bracket: outer-wall + front arm + back arm.
// All three pieces are parallelogram prisms (hull of two flat slabs),
// so the bottom face is always flat at Z=0.
// ============================================================

module left_bracket() {
    lx = fan_x0 - fan_clear_x;   // slot inner face X (= outer-wall inner face)
    union() {
        // Outer wall — parallelogram prism leaning with the fan tilt
        hull() {
            translate([lx - arm_t, arm_yf0,        0   ]) cube([arm_t, arm_span, eps]);
            translate([lx - arm_t, arm_yf0 - H_dy, H_dz]) cube([arm_t, arm_span, eps]);
        }
        // Front arm — captures the front face of the fan
        hull() {
            translate([lx, arm_yf0,        0   ]) cube([arm_d, arm_t, eps]);
            translate([lx, arm_yf0 - H_dy, H_dz]) cube([arm_d, arm_t, eps]);
        }
        // Back arm — captures the back face of the fan
        hull() {
            translate([lx, arm_yb0,        0   ]) cube([arm_d, arm_t, eps]);
            translate([lx, arm_yb0 - H_dy, H_dz]) cube([arm_d, arm_t, eps]);
        }
    }
}

module right_bracket() {
    rx = fan_x0 + fan_size + fan_clear_x;  // slot inner face X (right side)
    union() {
        // Outer wall
        hull() {
            translate([rx, arm_yf0,        0   ]) cube([arm_t, arm_span, eps]);
            translate([rx, arm_yf0 - H_dy, H_dz]) cube([arm_t, arm_span, eps]);
        }
        // Front arm
        hull() {
            translate([rx - arm_d, arm_yf0,        0   ]) cube([arm_d, arm_t, eps]);
            translate([rx - arm_d, arm_yf0 - H_dy, H_dz]) cube([arm_d, arm_t, eps]);
        }
        // Back arm
        hull() {
            translate([rx - arm_d, arm_yb0,        0   ]) cube([arm_d, arm_t, eps]);
            translate([rx - arm_d, arm_yb0 - H_dy, H_dz]) cube([arm_d, arm_t, eps]);
        }
    }
}

// ============================================================
// Assembly
// ============================================================

difference() {
    union() {

        // Base plate spanning all 4 pin sockets
        hull()
            for (p = pin_pos)
                translate([p[0], p[1], 0])
                    cylinder(r = pin_hole_r + pin_wall, h = base_t);

        // Left connecting arm: left pin pair → left bracket base
        hull() {
            translate([pin_pos[0][0], pin_pos[0][1], 0])
                cylinder(r = pin_hole_r + pin_wall, h = base_t);
            translate([pin_pos[2][0], pin_pos[2][1], 0])
                cylinder(r = pin_hole_r + pin_wall, h = base_t);
            translate([fan_x0 - fan_clear_x - arm_t, arm_yf0, 0])
                cube([arm_t, arm_t, base_t]);
        }

        // Right connecting arm: right pin pair → right bracket base
        hull() {
            translate([pin_pos[1][0], pin_pos[1][1], 0])
                cylinder(r = pin_hole_r + pin_wall, h = base_t);
            translate([pin_pos[3][0], pin_pos[3][1], 0])
                cylinder(r = pin_hole_r + pin_wall, h = base_t);
            translate([fan_x0 + fan_size + fan_clear_x, arm_yf0, 0])
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
