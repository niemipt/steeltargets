// Creative commons Non-Commercial (CC-NC) license

//Configuration
$fn                     = 10000;

//Editable plate variables
plate_scale             = 1;         // Scaling factor
bolt_square             = false;         // Square bolt = true & Round bolt = false
thickness               = 12;           // Plate thickness, mm
bolt_size               = 13;           // Bolt size, mm

bolt_distance           = 60*plate_scale;           // Bolt distance from straight edge, mm
body_width              = 450*plate_scale;          // Body width, mm
body_height             = 600*plate_scale;          // Body height, mm
head_width              = 150*plate_scale;          // Head width and height ; square, mm
corner_cut_top_1        = 50*plate_scale;           // Top corner cut, mm
corner_cut_top_2        = 50*plate_scale;           // Top corner cut, mm
corner_cut_bottom_1     = 75*plate_scale;           // Bottom corner cut, mm
corner_cut_bottom_2     = 150*plate_scale;          // Bottom corner cut, mm

//Helper variables
h       = thickness;
bd      = bolt_size;
br      = bd/2;
box     = bolt_distance;
boy     = bolt_distance;

//linear_extrude(height=h) // uncomment for 3D model - keep commented for DXF export
//Scale
//3D

    //Plate
    translate([head_width, 0])
        difference() {
            //Main body and head plate
            union() {
                //Body
                rect_points =[[0,0],[0,body_width],[body_height,body_width],[body_height,0]];
                polygon(rect_points);            
                //Head
                translate([-head_width,body_width/2-head_width/2]) square(head_width);
                
            };
            difference() {
                // Exclude corners
                union(){
                triangle_points1 =[[0,0],[0,corner_cut_top_1],[corner_cut_top_2,0]];
                polygon(triangle_points1);
                triangle_points2 =[[0,body_width],[corner_cut_top_1,body_width],[0,body_width-corner_cut_top_2]];
                polygon(triangle_points2); 
                triangle_points3 =[[body_height-corner_cut_bottom_2,0],[body_height,0],[body_height,corner_cut_bottom_1]];
                polygon(triangle_points3);
                triangle_points4 =[[body_height,body_width-corner_cut_bottom_1],[body_height,body_width],[body_width,body_height-corner_cut_bottom_2]];
                polygon(triangle_points4);   
                };
              
            }  
            if (bolt_square) {
                //Exclude square bolts
                translate([box,boy]) square(size=bd, center=true);
                translate([box,body_width-boy]) square(size=bd, center=true);
            } else {
                //Exclude bolts
                translate([box,boy]) circle(r=br);
                translate([box,body_width-boy]) circle(r=br);
            }
            
        };
