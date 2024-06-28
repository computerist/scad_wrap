include<wrap.scad>


difference() {
    cylinder(r = 70, h = 220, $fn = 100);
    
    union() {
        translate([0, 0, 2]) wrap(
            filename="test.svg",
            x= 200,
            y= 100,
            r=70,
            h = 216,
            thick = 3,
            segments = 50);
        cylinder(r = 67.5, h = 221, $fn = 100);
    }
}
    
 
/*    
    segment(filename = "triq_profile.svg",
        x = 400,
        y = 50, 
        r = 20,
        h = 5,
        thick = 3,
        segments = 30,
        seg = 0);
  */      