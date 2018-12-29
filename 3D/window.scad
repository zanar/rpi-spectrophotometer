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

module window(thin, alpha=1) {
	$fn=100;
	pr=2.5;

	color("green", alpha)
	translate([0, 0, -2.5-3*thin/2]) {
		translate([(5*3 + 2*5.2)/2, 0, 2.5+3*thin/2])
			rotate([90, 0, 180])
				hinge(5, 5.2, 3, r_outer=2.5, r_inner=1.05, max_height=2.5);

		hull() {
			translate([thin/2-(45-3*thin)/2, -45+thin+thin/2, 0]) {
				cylinder(r=thin/2, h=thin/2);
				translate([0, 0, thin/2])
					sphere(r=thin/2);
			}

			translate([-(45-3*thin)/2, -thin, 0]) {
				cube([thin, thin, thin/2]);
				translate([thin/2, 0, thin/2])
					rotate([-90, 0, 0])
						cylinder(r=thin/2, h=thin);
			}

			translate([(45-3*thin)/2-thin, -thin, 0]) {
				cube([thin, thin, thin/2]);
				translate([0, 0, thin/2])
					cube([thin, thin, thin/2]);
			}

			translate([(45-3*thin)/2-thin, -45+thin, 0])  {
				cube([thin, thin, thin/2]);
				translate([0, thin/2, thin/2])
					rotate([0, 90, 0])
						cylinder(r=thin/2, h=thin);
			}
		}

		translate([-(45-3*thin)/2+3*thin, -thin, -thin])
			cube([45-9*thin, 3*thin, thin]);


		hull() {
			translate([-6, -37, 0]) {
				cylinder(r=pr, h=5);
				translate([0, 0, 7])
					sphere(r=pr);
			}
			translate([6, -37, 0]) {
				cylinder(r=pr, h=5);
				translate([0, 0, 7])
					sphere(r=pr);
			}
		}
	}
}


window(1);