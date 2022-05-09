///@param tile_map_id (use: layer_tilemap_get_id())
///@param velocity
///@param tile_size
function Scr_Mov_Collide_tiles_2pt(tile_map_id, velocity, tile_size = 32) {
	
	#region Velocity Vector Declaration
	var velocity_array = [0,0]; // This hill hold the speed that the comands will set to the movement, in a 2D-Vector (ofcurse, this is a 2D Game with 2D Moviment...)
	
	//Just for making easier to acess the elements of the vector and providing easier reading.
	var Horizontal = 0;
	var Vertical = 1;
	#endregion
	
	#region Check Keyboard
	Up = keyboard_check(ord("W"));		// "W" key Will Set the "UP"
	Left = keyboard_check(ord("A"));	// "A" key Will Set the "Left"
	Down = keyboard_check(ord("S"));	// "S" key Will Set the "Down"
	Right = keyboard_check(ord("D"));	// "D" key Will Set the "Right"
	#endregion

	#region Check for Collisions with a margin of "Velocity", so one colision dont interfere with another perpendicular colision
	var Collide_right	= Tile_Collide_at_points(tile_map_id, [bbox_right, bbox_top+velocity]	, [bbox_right, bbox_bottom-velocity]);
	var Collide_left	= Tile_Collide_at_points(tile_map_id, [bbox_left, bbox_top+velocity]	, [bbox_left, bbox_bottom-velocity])
	var Collide_bottom	= Tile_Collide_at_points(tile_map_id, [bbox_left+velocity, bbox_bottom]	, [bbox_right-velocity, bbox_bottom]);
	var Collide_top		= Tile_Collide_at_points(tile_map_id, [bbox_left+velocity, bbox_top]	, [bbox_right-velocity, bbox_top]);
	#endregion
	show_debug_message(Collide_bottom);
	show_debug_message(Collide_left);
	show_debug_message(Collide_right);
	show_debug_message(Collide_top);
	
	
	#region Setting the Velocity Vector
	velocity_array[Horizontal] = ((Right and !Collide_right)-(Left and !Collide_left))*velocity;
	velocity_array[Vertical] = ((Down and !Collide_bottom)-(Up and !Collide_top))*velocity;
	#endregion
	
	#region Move
		hspeed = velocity_array[Horizontal];
		vspeed = velocity_array[Vertical];
	#endregion

}

///@param tile_map_id
///@param point_arrays...
function Tile_Collide_at_points() {
	var tile_map_id = argument[0];

	// Found variable
	var found = false;

	// for the point arrays
	var vector2_x = 0;
	var vector2_y = 1;

	// Loop through the points and check for a tile
	for (var i=1; i<argument_count; i++) {
		var point = argument[i];
		found = found || tilemap_get_at_pixel(tile_map_id, point[vector2_x], point[vector2_y]);
	}
	// return found
	return found;
}

