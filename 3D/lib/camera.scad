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