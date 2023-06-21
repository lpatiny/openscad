thickness = 6;

//square([thickness, thickness]);

//translate([400,0])
//import(file = "GULP box/side.dxf");

//translate([0,-50])
//import(file = "GULP box/bottom.dxf");

// wood = 40 x 70 cm


w = 490;
d = 210;
h = 60;

inter_connecter = 0;
connecter_length = 0;

side_connection_dist = 0;

n_cells_w = 7;
n_cells_d = 3;

h_cell = 60;


h_locker = 0;
w_locker = 0;
a_locker = 0;


laser_dist = 0;





w_in = w - thickness * 2;
h_in = h - thickness * 2;
d_in = d - thickness * 2;

w_cell = (w_in + thickness)/n_cells_w;
d_cell = (d_in + thickness)/n_cells_d;
w_cell_in = w_cell - thickness;
d_cell_in = d_cell - thickness;

echo("inside width of cell =", w_cell_in);
echo("inside depth of cell =", d_cell_in);

module connected_side(length, thickness_multiplier=2) {
    l2 = length-connecter_length - side_connection_dist*2;
    n = floor(l2/inter_connecter) + 1;
    left_over = l2 - (n-1)*inter_connecter;
    if (n > 0)
//        translate([(inter_connecter-(inter_connecter-length % inter_connecter))/2,0])
        translate([left_over/2 + connecter_length/2 + side_connection_dist,0])
        for (i = [0:n - 1])
            translate([i*inter_connecter, 0])
                square([connecter_length, thickness*thickness_multiplier],center=true);
}

module bottom() {
    difference() {
        square([d_in,w_in]);
        for (c = [1:n_cells_w-1])
        {
            translate([0,c*w_cell-thickness/2])
            connected_side(d_in,1);
        }
    }
    connected_side(d_in);
    translate([0,w_in])
    connected_side(d_in);

    rotate([0,0,90])
    connected_side(w_in);
    translate([d_in,0])
    rotate([0,0,90])
    connected_side(w_in);
}

module locker() {
    polygon(points=[[0,0],[0,-h_locker],[w_locker,-h_locker], [w_locker + tan(a_locker)*h_locker,0]]);
}
    


logo_size = min(w_cell_in,h_cell,d_cell_in);

module logo() 
{
    scale(logo_size/10)
    scale(.5)
    translate([-5.5,-1])
    polygon(points=[ [3,1], [3,5], [1,5], [1,6], [7,6], [7,4], [9,6], [10,6], [7.5,3.5], [10,1], [9,1], [7,3], [7,1], [6,1], [6,5], [4,5], [4,1]  ]);
}

module side() {

    difference() {
        union() {
            square([d,h]);
            translate([-side_connection_dist,-h_locker])
            square([side_connection_dist,h]);
            translate([d,-h_locker])
            square([side_connection_dist,h]);
            
            // lockers
            translate([0,0])
            locker();

            translate([d,0])
            scale([-1,1])
            locker();
        }
        
        // cell connections
        for (c = [1:n_cells_d-1])
        {
            translate([c*d_cell+thickness/2,side_connection_dist+thickness/2])
            rotate([0,0,90])
            connected_side(h_cell,1);
        }
        
        if (n_cells_d%2 == 1)
            translate([d/2,h-logo_size])
            logo();
        
        // bottom connection
        translate([thickness, side_connection_dist])
        connected_side(d_in, 1);
        
        //side connections
        translate([thickness/2,-h_locker])
        rotate([0,0,90])
        connected_side(h,1);
            
        translate([d-thickness/2,-h_locker])
        rotate([0,0,90])
        connected_side(h,1);
        
            
        // lockers
        translate([0,h])
        locker();
        
        translate([d,h])
        scale([-1,1])
        locker();
        
    }

}

module front() {
    difference() 
    {
        square([h,w_in]);

        // bottom connection
        translate([h-side_connection_dist,0])
        rotate([0,0,90])
        connected_side(w_in,1);
        
        // cell connections
        for (c = [1:n_cells_w-1])
        {
            translate([(h-h_cell-(side_connection_dist+thickness/2)),c*w_cell-thickness/2])
            connected_side(h_cell,1);
        }
        
                
        if (n_cells_w%2 == 1)
            translate([logo_size,w/2])
            rotate([0,0,90])
            logo();
        
        // lockers
        translate([0,0])
        rotate([0,0,90])
        locker();
            
        translate([0,w_in])
        rotate([0,0,90])
        scale([-1,1])
        locker();
    }
    
    // connections
    translate([h_locker,0])
    connected_side(h);
    translate([h_locker,w_in])
    connected_side(h);
    

    // lockers
    translate([h,0])
    rotate([0,0,90])
    locker();
        
    translate([h,w_in])
    rotate([0,0,90])
    scale([-1,1])
    locker();

}


module cell_separator_w() {
    difference() {
        square([d_in, h_cell]);
        
        for (c = [1:n_cells_d-1])
        {
            translate([c*d_cell-thickness/2,h_cell])
            square([thickness,h_cell],center=true);
        }
    }
    connected_side(d_in);
    
    rotate([0,0,90])
    connected_side(h_cell);
    
    translate([d_in,0])
    rotate([0,0,90])
    connected_side(h_cell);
    

}

module cell_separator_d() {
    difference() {
        square([w_in,h_cell]);    
        
        for (c = [1:n_cells_w-1])
        {
            translate([c*w_cell-thickness/2,0])
            square([thickness,h_cell],center=true);
        }
    }
        
    rotate([0,0,90])
    connected_side(h_cell);
    
    translate([w_in,0])
    rotate([0,0,90])
    connected_side(h_cell);
}



module to_laser_cut() {
    translate([thickness, thickness])
    bottom();

    translate([0,-h-h_locker-laser_dist])
    side();

    translate([0,(-h-h_locker-laser_dist)*2])
    side();

    translate([-h-laser_dist-h_locker,thickness])
    front();

    translate([(-h-laser_dist-h_locker)*2,thickness])
    front();

    for (c = [0:n_cells_w-2])
    {
        translate([thickness,w+thickness+laser_dist+c*(thickness+laser_dist+h_cell)])
        cell_separator_w();
    }

    for (c = [0:n_cells_d-2])
    {
        translate([d+laser_dist+c*(h_cell+laser_dist),w-thickness])
        rotate([0,0,-90])
        cell_separator_d();
    }
}

module box3D() 
{
//    intersection()
    union() 
    {
        translate([thickness,0,side_connection_dist-thickness/2])
        linear_extrude(thickness)
            bottom();

        rotate([90,0,0])
        linear_extrude(thickness)
            side();
        
        translate([0,w-thickness,0])
        rotate([90,0,0])
        linear_extrude(thickness)
            side();
        
        translate([0,0,h])
        rotate([0,90,0])
        linear_extrude(thickness)
            front();   
        
        translate([d-thickness,0,h])
        rotate([0,90,0])
        linear_extrude(thickness)
            front();   
        
        
        for (c = [1:n_cells_w-1])
            translate([thickness,c*w_cell, side_connection_dist+thickness/2])
            rotate([90,0,0])
            linear_extrude(thickness)
                cell_separator_w();
        
        for (c = [1:n_cells_d-1])
            translate([c*d_cell,0,side_connection_dist+thickness/2])
            rotate([90,0,90])
            linear_extrude(thickness)
                cell_separator_d();   
    }
        
}



// for export :

part = -2;

if (part== -2)
    box3D();
else if (part == -1)
    to_laser_cut();
else if (part == 0)
    bottom();
else if (part == 1)
    side();
else if (part == 2)
    front();
else if (part == 3)
    cell_separator_w();
else if (part == 4)
    cell_separator_d();

