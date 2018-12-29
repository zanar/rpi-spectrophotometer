/* 
 * This file is part of rpi-spectrophotometer (https://github.com/zanar/rpi-spectrophotometer).
 * Copyright (c) 2018 zanar.
 * 
 * This program is free software: you can redistribute it and/or modify  
 * it under the terms of the GNU General Public License as published by  
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but 
 * WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License 
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

use <lib/camera.scad>

module measure_raw(width, thin, dled, grind_t) {
	// led support
	translate([5, -20/2, -50/2])
		cube([thin, 20, 50/2]);
	translate([5, 0, 0])
		rotate([0, 90, 0]) {
			cylinder(r=20/2, h=thin);
			cylinder(r=dled/2+thin, h=4);
		}

	// slit
	translate([45, 0, 0])
		cube([thin, 50, 50], center=true);

	// grind + cam
	translate([45 + (50+8*thin)/2*sin(30), 0, 0])
		rotate([0, 0, 30]) {
			cube([2*thin+grind_t, 50+4*thin, 50], center=true);
			translate([9-thin+0.2, 0, 0])
				cube([thin, 75, 50], center=true);
		}

	// border
	translate([0, (50+2*thin)/2*cos(30), -50/2])
		cube([width, thin, 50]);

	// back
	translate([5, -50/2, -50/2])
		cube([width-10, 50, thin]);
}

module measure_neg(width, thin, dled, grind_t, cam_rot) {
	// led
	translate([5-0.1, 0, 0])
		rotate([0, 90, 0]) {
			#cylinder(r=dled/2, h=7.6-dled/2);
			translate([0, 0, 7.6-dled/2])
				#sphere(r=dled/2);
		}

	// cuve
	translate([20, -12/2, -50/2-0.1])
		#cube([12, 12, 45]);

	// slit
	translate([45, 0, 0])
		#cube([thin+0.2, 1, 20], center=true);

	// grind + cam
	translate([45 + (50+8*thin)/2*sin(30), 0, 0])
		rotate([0, 0, 30]) {
			translate([0, 0, thin/2])
				cube([3*thin+grind_t, 50-3*thin, 50-thin+0.1], center=true);
			#cube([grind_t, 50, 51], center=true);
			//translate([9+grind_t/2 + 0.5, 0, 0]) {
			translate([0.5+grind_t/2+9, 0, 0]) {
				rotate([cam_rot, 0, 180])
					#cam();
				translate([-thin-0.5, -width/2, -51/2])
					cube([50, width, 51]);
			}
		}

	// border
	translate([-0.1, (50+2*thin)/2*cos(30)+thin, -50/2-0.1])
		cube([width+0.2, 20, 50.2]);
	rotate([0, 0, 180])
		translate([-width-0.1, (50+2*thin)/2*cos(30)+thin, -50/2-0.1])
			cube([width+0.2, 20, 50.2]);

	//cover
	translate([-0.1, 0, 50/2-thin])
		cube([thin+0.1, 50, thin+0.1]);
	rotate([0, 0, 180])
		translate([-width-0.1, (50+2*thin)/2*cos(30), 50/2-thin])
			cube([100.2, thin+0.1, thin+0.1]);

	// wire hole
	translate([-0.1, 0, -50/2-0.1])
		cube([3*thin+0.1, 50, 2*thin+0.1]);

	// back
	translate([0, 20/2, -50/2-0.1])
		cube([45-thin/2, (50+2*thin)/2*cos(30)-20/2, thin+0.2]);
	translate([45-thin/2, -20/2, -50/2-0.1])
		rotate([0, 0, 180])
			cube([45, 50, thin+0.2]);

	// fix
	translate([7.5, 15, 0])
		rotate([-90, 0, 0])
			cylinder(r=1.1, h=20);
	translate([40, 7.5-(504*thin)/2*cos(30), 0])
		rotate([0, 90, 0])
			cylinder(r=1.1, h=10);
}

module measure(width, thin, grind_t, cam_rot, alpha=1) {
	$fn=100;

	dled=5.2;

	color("silver", alpha)
	translate([0, 0, 50/2])
	difference() {
		measure_raw(width, thin, dled, grind_t);
		measure_neg(width, thin, dled, grind_t, cam_rot);
	}
}

measure(110, 1, 1.5, 0);