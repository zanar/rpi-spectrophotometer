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

use <lib/hinge.scad>

module cover_raw(width, length, thin) {
	hull() {
		for(x=[thin/2, width - thin/2])
			for(y=[thin/2, length - thin/2]) {
				translate([x, y, thin/2])
					sphere(r=thin/2);
				translate([x, y, 0])
					cylinder(r=thin/2, h=thin/2);
			}
	}

	translate([thin, thin, -thin])
		difference() {
			cube([width - 2*thin, length - 2*thin, thin]);
			translate([thin, thin, -1])
				cube([width - 4*thin, length - 4*thin, thin+2]);
		}

	translate([2*thin, 2*thin, -thin])
		cube([45-3*thin+0.1-thin, 45-3*thin-0.1, thin]);


	translate([width-thin/2-10, thin, -3])
		cube([10-thin/2, 10-thin/2, 3+thin]);	

	translate([thin, length-thin/2-10, -3])
		cube([10-thin/2, 10-thin/2, 3+thin]);	

	translate([width-thin/2-10, length-thin/2-10, -3])
		cube([10-thin/2, 10-thin/2, 3+thin]);	
}

module cover_neg(width, length, thin) {
	translate([-0.1, -0.1, 0])
		cube([45-3*thin+0.1, 45-thin, 2*thin+0.2]);

	translate([3*thin, 3*thin, -thin-0.1])
		cube([45-3*thin+0.1-5*thin, 45-thin-3*thin, 2*thin+0.1]);

	translate([width-thin/2-10, thin, -3]) {
		translate([5, 5-thin/2, -0.1])
			cylinder(r=1.5, h=3*thin+0.2);
		translate([5, 5-thin/2, thin+0.1])
			cylinder(r=3, h=3.1);
	}

	translate([thin, length-thin/2-10, -3]) {
		translate([5-thin/2, 5, -0.1])
			cylinder(r=1.5, h=3*thin+0.2);
		translate([5-thin/2, 5, thin+0.1])
			cylinder(r=3, h=3.1);
	}

	translate([width-thin/2-10, length-thin/2-10, -3]) {
		translate([5, 5, -0.1])
			cylinder(r=1.5, h=3*thin+0.2);
		translate([5, 5, thin+0.1])
			cylinder(r=3, h=3.1);
	}
}

module cover(width, length, thin, alpha=1) {
	$fn=100;

	color("chartreuse", alpha) {
		translate([-width/2, -length/2, 0])
			difference() {
				cover_raw(width, length, thin);
				cover_neg(width, length, thin);
			}

		translate([-width/2+((45-3*thin)-(4*5+3*5.2))/2, 45-length/2-thin, 2.5+3*thin/2])
			rotate([90, 0, 0])
				hinge(5, 5.2, 4, r_outer=2.5, r_inner=1.05, max_height=2.5);
	}
}

cover(100, 115, 1);
