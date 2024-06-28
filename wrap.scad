module segment(filename, x, y, r, h, thick, segments = 30, seg) {
    
    extrude_length = thick == undef ? r : thick;
    extrude_scale = thick == undef ? 0.01 : 1 - (thick / r);
    
    window = x / segments;
    segment_angle = 360 / segments;
    circ = 2 * PI * r;
    window_circ = circ / segments;
    
    x_scale = x / circ;
    y_scale = h / y;
    
    offset = seg * window;
    angle = (seg * segment_angle) + (segment_angle / 2);
    
    rotate([0, 0, angle]) {
        // translate([-0.25, 0, -0.5]) cube([0.5, r, 1]);
        translate([0, r, 0])
            rotate([90, 0, 0])
                    linear_extrude(extrude_length, scale = [extrude_scale, 1])
                        translate([window_circ / 2, 0, 0])
                            scale([-1 / x_scale, y_scale, 1])
                                intersection() {
                                    polygon([
                                        [0,0],
                                        [0,y],
                                        [window, y],
                                        [window, 0]
                                    ]);
                                    translate([-offset, 0, 0])
                                        import(filename);
                                    }
    }
}

module wrap(filename, x, y, r, h = 50, thick, segments = 30) {
    for(seg = [0 : 1 : segments]) {
            segment(
                filename = filename,
                x = x,
                y = y,
                r = r,
                h = h,
                thick = thick,
                segments = segments,
                seg = seg) {
        }
    }
}
/*
wrap(
    filename="triq_profile.svg",
    x=400,
    y=50,
    r=20,
    h = 5,
    segments=100);
*/
/*
segment(filename = "triq_profile.svg",
        x = 400,
        y = 50, 
        r = 20,
        h = 5,
        segments = 30,
        seg = 2);
*/