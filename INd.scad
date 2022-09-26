//INd - It's not drugs
//Essential Oils Aromatherapy inhaler

$fa = 1;
$fs = 0.01; //0.01 for rendering, increase for quick work

module unit_body() {
    body_length = 1;
	body_depth  = 0.25;
    body_height = 2;
	union() {
		//main body
		scale([body_length,body_depth,body_height])
			cylinder(r1=body_length*0.75,r2=body_length,center=true);
		//rounded top
		translate([0,0,body_height/2])
			scale([body_length,body_depth,body_height/2])
				sphere();
		//nipple
		translate([0,0,body_height])
			cylinder(body_height/6,d=body_depth,center=true);
		//rounding nipple, doesn't always print well
		translate([0,0,body_height+body_height/12])
			sphere(d=body_depth);
	}
}

module unit_internals() {
	union() {
		//down stem
		translate([0,0,1.5])
			cylinder(h=3,d=0.2,center=true);
		//down and out
		translate([0,0,0])
			cylinder(h=4,d=0.125,center=true);
		//sideways
		translate([0,0,0])
			rotate([0,90,0])
				cylinder(h=0.75,d=0.2,center=true);
		//up left
		translate([0.5,0,1.5])
			rotate([0,5,0])
				cylinder(h=3,d=0.25,center=true);
		//up right
		translate([-0.5,0,1.5])
			rotate([0,-5,0])
				cylinder(h=3,d=0.25,center=true);
	}
}

module blank_unit() {
	difference() {
		unit_body();
		translate([0,0,0.25])
			unit_internals();
	}
}

module branding() {
	union() {
		translate([-0.4,-0.53,0.75])
			rotate([90,0,-7])
				linear_extrude(0.15,center=true)
					text("I",size=0.5,halign="center",font="liberation mono");
		translate([0,-0.55,0.75])
			rotate([90,0,0])
				linear_extrude(0.15,center=true)
					text("N",size=0.5,halign="center",font="liberation mono");
		translate([0.4,-0.53,0.75])
			rotate([90,0,7])
				linear_extrude(0.15,center=true)
					text("d",size=0.5,halign="center",font="liberation mono");
	}
}

difference() {
	blank_unit();
	translate([0,0.25,0])
		branding();
}