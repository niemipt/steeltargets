// Creative commons Non-Commercial (CC-NC) license

//Configuration
$fn                     = 10000;

//Editable kong variables
thickness               = 12;
kong_diameter           = 150;
bolt_size               = 13;
bolt_distance           = 50;
bolt_offset_from_top    = 15;
bolt_square             = true;

//Helper variables
h       = thickness;
mcd     = kong_diameter;
mcr     = mcd/2;
bd      = bolt_size;
br      = bd/2;
box     = bolt_distance/2;
boy     = mcr + bolt_offset_from_top;
hpox    = box + br;
hpoy    = boy + br;


//Scale
//scale(1)
//3D
//linear_extrude(height=h) // uncomment for 3D model - keep commented for DXF export
    //Kong
    translate([mcr, mcr])
        difference() {
            //Main circle and hanger plate
            union() {
                //Main circle
                circle(r=mcr);
                //Hanger plate
                hull() {
                    translate([-hpox,0]) circle(r=2*br);
                    translate([+hpox,0]) circle(r=2*br);
                    translate([-hpox,hpoy]) circle(r=2*br);
                    translate([+hpox,hpoy]) circle(r=2*br);
                };
            };
            if (bolt_square) {
                //Exclude square bolts
                translate([-box,boy]) square(size=bd, center=true);
                translate([+box,boy]) square(size=bd, center=true);
            } else {
                //Exclude bolts
                translate([-box,boy]) circle(r=br);
                translate([+box,boy]) circle(r=br);
            }
            
        };
