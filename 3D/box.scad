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

module box_raw(width, length, thin) {
	$fn=100;
	height=50;

	// bottom
	difference() {
		hull() {
			for(x=[thin/2, width - thin/2])
				for(y=[thin/2, length - thin/2])
					translate([x, y, thin/2]) {
						sphere(r=thin/2);
						translate([0, 0, 50])
							cylinder(r=thin/2, h=thin/2);
					}
		}
		union() {
			translate([thin, thin, thin])
				cube([width-2*thin, length-2*thin, height+1]);

			translate([29, length-thin-0.5, thin+3])
				cube([10, thin+1, 8]);
			translate([46, length-thin-0.5, thin+3])
				cube([18, thin+1, 10]);
			translate([71, length-thin-0.5, thin+3])
				cube([11, thin+1, 6]);
			translate([-0.5, length-56, thin+3])
				cube([thin+1, 52, 18]);
		}
	}

	// rpi fix
	for(x=[25.5, 25.5+58])
		for(y=[length-2-3, length-2-3-49])
			translate([x, y, thin-0.1]) {
				difference() {
					cylinder(r=3, h=3.1);
					union() {
						cylinder(r=1, h=10);
						translate([0, 0, 1])
							cylinder(r=2, h=2.5, $fn=6);
					}
				}
			}

	// measure fix
	difference() {
		translate([thin, (50+2*thin)*cos(30)+thin, 25-5+thin]) {
			cube([10, thin, 10]);
			translate([10, 0, 5])
				rotate([-90, 0, 0])
					cylinder(r=5, h=thin);
		}
		translate([thin+5, (50+2*thin)*cos(30)+thin-0.1, 25+thin]) {
			rotate([-90, 0, 0])
				cylinder(r=1.5, h=thin+0.2);
			translate([0, 0, -1.5])
				cube([5, thin+0.2, 3]);
			translate([5, 0, 0])
				rotate([-90, 0, 0])
					cylinder(r=1.5, h=thin+0.2);
		}
	}

	difference() {
		translate([45-thin/2, thin, 25-5+thin]) {
			cube([thin, 10, 10]);
			translate([0, 10, 5])
				rotate([0, 90, 0])
					cylinder(r=5, h=thin);
		}
		translate([45-thin/2-0.1, thin+5, 25+thin]) {
			rotate([0, 90, 0])
				cylinder(r=1.5, h=thin+0.2);
			translate([0, 0, -1.5])
				cube([thin+0.2, 5, 3]);
			translate([0, 5, 0])
				rotate([0, 90, 0])
					cylinder(r=1.5, h=thin+0.2);
		}
	}

	// closure
	difference() {
		translate([width-thin/2-10, thin/2, 50-3-3-thin])
			cube([10, 10, 3+thin]);
		translate([width-thin/2-10+5, thin/2+5, 50-3-3-thin-0.1]) {
			cylinder(r=3, h=3.1, $fn=6);
			cylinder(r=1.5, h=3+thin+0.2);
		}
	}
	difference() {
		translate([thin/2, length-thin/2-10, 50-3-3-thin])
			cube([10, 10, 3+thin]);
		translate([thin/2+5, length-thin/2-10+5, 50-3-3-thin-0.1]) {
			cylinder(r=3, h=3.1, $fn=6);
			cylinder(r=1.5, h=3+thin+0.2);
		}
	}
	difference() {
		translate([width-thin/2-10, length-thin/2-10, 50-3-3-thin])
			cube([10, 10, 3+thin]);
		translate([width-thin/2-10+5, length-thin/2-10+5, 50-3-3-thin-0.1]) {
			cylinder(r=3, h=3.1, $fn=6);
			cylinder(r=1.5, h=3+thin+0.2);
		}
	}
}

module box(width, length, thin, alpha=1) {
	color("gray", alpha)
	translate([-width/2, -length/2, 0])
		box_raw(width, length, thin);
}


box(100, 115, 1);
