
module cam() {
    $fn=100;
	cam_fix=2;
	ci_h=1.5;

	color("red") {
	translate([0, -25/2, 9.462 - 23.862]) {
		cube([ci_h, 25, 23.862]);

		for(y=[2, 25-2])
			for(_z=[2, 14.5])
				translate([1.5/2, y, _z])
					rotate([0, 90, 0])
						cylinder(r=cam_fix/2, h=20, center=true);
	}

	rotate([0, 90, 0])
		cylinder(r=4, h=9);

	translate([4, 0, 0])
		cube([8, 8.5, 8.5], center=true);
	}
}

cam();