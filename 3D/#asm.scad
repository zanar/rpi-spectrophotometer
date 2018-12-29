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
use <lib/rpi.scad>

use <axis.scad>
use <box.scad>
use <cover.scad>
use <measure.scad>
use <window.scad>

width=100;
length=115;
thin=1;
cam_rot=0;

show_cover=true;
show_window=true;

box(width, length, thin);

translate([-5.5, 28, 4.5])
	rotate([0, 0, 180])
		pi3();

translate([thin-width/2, (50+2*thin)/2*cos(30)+2*thin-length/2, thin])
	measure(width, thin, 1.5, cam_rot);


translate([45 + (50+8*thin)/2*sin(30) - width/2, (50+2*thin)/2*cos(30)+3*thin/2-length/2, 50/2+thin])
	rotate([0, 0, 30])
		translate([9+1.5/2 + 0.2 + thin, 0, 0])
			rotate([cam_rot, 0, 180])
				cam(1.5);

if( show_cover == true ) {
	translate([0, 0, 50+thin])
		cover(width, length, thin, alpha=0.6);
}

if( show_window == true ) {
	translate([(45-3*thin-width)/2, 45-length/2-thin, 50+thin+2.5+thin])
		rotate([-45, 0, 0])
			window(thin, 0.7);
}

if( show_cover == true || show_window == true ) {
	translate([-10, 45-length/2-thin, 50+5*thin/2+2.5])
		rotate([0, -90, 0])
			translate([0, 0, 0])
				axis();
}