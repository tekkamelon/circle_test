center_radius=10;
side_radius= 5;
side_position= 10;
height= 5;
tool_height=3;
$fn=40;

//引かれる部分
module target(){
	linear_extrude(height=height){
		hull(){
			#circle(r=center_radius);
				translate([side_position,0,0])
					circle(r=side_radius);
				translate([-side_position,0,0])
					circle(r=side_radius);
		}
	}
}

//引く部分
module tool(){
 	translate([0,0,height/2])
		#cylinder(h=tool_height, r1=center_radius/2, r2=center_radius/2);
 	translate([10,0,height/2])
		#cylinder(h=tool_height, r1=side_radius/2, r2=side_radius/2);
 	translate([-10,0,height/2])
		#cylinder(h=tool_height, r1=side_radius/2, r2=side_radius/2);
}

//引き算の実行
difference(){
	target();
	tool();
}
