// Creative commons Non-Commercial (CC-NC) license

//Configuration
$fn         = 10000;

//Editable kong variables
thickness   = 12;
diameter    = 300;
angle       = 90;
bolt_size   = 12;

//Helper variables
radius=diameter/2;
height=thickness;

//3D
//linear_extrude(height=height) // uncomment for 3D model - keep commented for DXF export
    //Kong
    translate([radius, radius])
        difference() {
            //Main circle and ears
            union() {
                //Main circle
                circle(r=radius);
                //Ears
                rotate(angle/2) translate([0, radius]) circle(d=2*bolt_size);
                rotate(-angle/2) translate([0, radius]) circle(d=2*bolt_size);
            };
            //Exclude bolts
            rotate(angle/2) translate([0, radius]) circle(d=bolt_size);
            rotate(-angle/2) translate([0, radius]) circle(d=bolt_size);
        }
