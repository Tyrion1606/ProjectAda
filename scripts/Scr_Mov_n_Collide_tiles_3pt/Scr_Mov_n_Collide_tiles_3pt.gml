///@param tile_map_id (use: layer_tilemap_get_id())
///@param velocity
///@param tile_size
function Scr_Mov_n_Collide_tiles_3pt(tile_map_id, velocity, tile_size = 32) {
	
	#region Velocity Vector Declaration
	var velocity_array = [0,0]; // This hill hold the speed that the comands will set to the movement, in a 2D-Vector (ofcurse, this is a 2D Game with 2D Moviment...)
	
	//Just for making easier to acess the elements of the vector and providing easier reading.
	var Horizontal = 0;
	var Vertical = 1;
	#endregion
	
	#region Moviment Comands
		#region Check Keyboard
		Up = keyboard_check(ord("W"));		// "W" key Will Set the "UP"
		Left = keyboard_check(ord("A"));	// "A" key Will Set the "Left"
		Down = keyboard_check(ord("S"));	// "S" key Will Set the "Down"
		Right = keyboard_check(ord("D"));	// "D" key Will Set the "Right"
		#endregion
		
		#region Setting the Velocity Vector
		//Set the Velocity Vector Acording With the Comands Using the Checks on the Keybords Made Before
		if(Up or Down or Right or Left){
			if(Up and !Down and !Right and !Left){			// Up
				velocity_array = [0,-velocity];	
			} else if(Up and !Down and Right and !Left){	// Up + Right
				velocity_array = [velocity,-velocity];
			} else if(Up and !Down and !Right and Left){	// Up + Left
				velocity_array = [-velocity,-velocity];
			} else if(!Up and Down and !Right and !Left){	// Down
				velocity_array = [0,velocity];
			} else if(!Up and Down and Right and !Left){	// Down + Right
				velocity_array = [velocity,velocity];
			} else if(!Up and Down and !Right and Left){	// Down + Left
				velocity_array = [-velocity,velocity];
			} else if(!Up and !Down and Right and !Left){	// Right
				velocity_array = [velocity,0];
			} else if(!Up and !Down and !Right and Left){	// Left
				velocity_array = [-velocity,0];
			}
		} else {
			velocity_array = [0,0]							// No Moviment Key Pressed, Instantaneous Stop
		}
		#endregion
	#endregion
	
	#region Check for Collision than Move
	// Move horizontally
	x += velocity_array[Horizontal]; // Move (if Velocity_array[Horizontal] != 0)
	
	// lateral collisions
	if velocity_array[Horizontal] > 0 { // Check if there is a movement intention to the right
		var tile_right = Tile_Collide_at_points(tile_map_id, [bbox_right-2, bbox_top], [bbox_right-2, bbox_bottom-1], [bbox_right-2, bbox_top+int64((bbox_bottom-bbox_top)/2)]);
		if tile_right {					// Check if a collision with the specified "tile_map_id" was found in some of the 3 point (top+right , bot+right , midle+right)
			x = bbox_right & ~(tile_size-1); // x position will be set to the
			show_debug_message(bbox_right);
			show_debug_message(tile_size);
			show_debug_message(~tile_size);
			show_debug_message(~(tile_size-1));
			show_debug_message(x);
			show_debug_message(bbox_right & -32);
			x -= bbox_right-x;
			velocity_array[@ Horizontal] = 0;
		}
	} else {
		var tile_left = Tile_Collide_at_points(tile_map_id, [bbox_left, bbox_top], [bbox_left, bbox_bottom-1], [bbox_left, bbox_top+int64((bbox_bottom-bbox_top)/2)]);
		if tile_left {
			x = bbox_left & ~(tile_size-1);
			x += tile_size+x-bbox_left;
			velocity_array[@ Horizontal] = 0;
		}
	}

	// Move vertically
	y += velocity_array[Vertical];
	
	// Vertical collisions
	if velocity_array[Vertical] > 0 {
		var tile_bottom	=	Tile_Collide_at_points(tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom], [bbox_left+int64((bbox_right-bbox_left)/2), bbox_bottom]);
		if tile_bottom {
			y = bbox_bottom & ~(tile_size-1);
			y -= bbox_bottom-y;
			velocity_array[@ Vertical] = 0;
		}
	} else {
		var tile_top	=	Tile_Collide_at_points(tile_map_id, [bbox_left, bbox_top], [bbox_right-1, bbox_top], [bbox_left+int64((bbox_right-bbox_left)/2), bbox_top]);
		if tile_top {
			y = bbox_top & ~(tile_size-1);
			y += tile_size+y-bbox_top;
			velocity_array[@ Vertical] = 0;
		}
	}
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

