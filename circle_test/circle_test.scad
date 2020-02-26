a = 10;//center_radius
b = 5;//side_radius
c = 10;//side_position
d = 5;//height
$fn = 40;//number of polygon

module target(){
	linear_extrude(height = d){
		hull(){
			circle(r = a);
			translate([c,0,0])
				circle(r = b);
			translate([-c,0,0])
				circle(r = b);
		}
	}
}

module tool(){
	#translate([0,0,d/2])
		cylinder(h = d, r1 = a/2, r2 = a/2);
	#translate([10,0,d/2])
		cylinder(h = 5, r1 = b/2, r2 = b/2);
	#translate([-10,0,d/2])
		cylinder(h = d, r1 = b/2, r2 = b/2);
}

difference(){
	target();
	tool();
}
