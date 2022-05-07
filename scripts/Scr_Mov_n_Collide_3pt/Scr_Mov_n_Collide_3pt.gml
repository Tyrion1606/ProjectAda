function Scr_Mov_n_Collide_3pt(tile_map_id, tile_size, Velocidade) {
	
	//Apenas para facilitar o acesso ao array "Velocidade"
	var Horizontal = 0;
	var Vertical = 1;
	
	// Move horizontally

	x += Velocidade[Horizontal];
	
	// Right collisions

	if Velocidade[Horizontal] > 0 {
		var tile_right = tile_collide_at_points(tile_map_id, [bbox_right-2, bbox_top], [bbox_right-2, bbox_bottom-1], [bbox_right-2, bbox_top+int64((bbox_bottom-bbox_top)/2)]);
		if tile_right {
			x = bbox_right & ~(tile_size-1);
			x -= bbox_right-x;
			Velocidade[@ Horizontal] = 0;
		}
	} else {
		var tile_left = tile_collide_at_points(tile_map_id, [bbox_left, bbox_top], [bbox_left, bbox_bottom-1], [bbox_left, bbox_top+int64((bbox_bottom-bbox_top)/2)]);
		if tile_left {
			x = bbox_left & ~(tile_size-1);
			x += tile_size+x-bbox_left;
			Velocidade[@ Horizontal] = 0;
		}
	}

	// Move vertically
	
	y += Velocidade[Vertical];
	
	// Vertical collisions
	
	if Velocidade[Vertical] > 0 {
		var tile_bottom = tile_collide_at_points(tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom], [bbox_left+int64((bbox_right-bbox_left)/2), bbox_bottom]);
		if tile_bottom {
			y = bbox_bottom & ~(tile_size-1);
			y -= bbox_bottom-y;
			Velocidade[@ Vertical] = 0;
		}
	} else {
		var tile_top = tile_collide_at_points(tile_map_id, [bbox_left, bbox_top], [bbox_right-1, bbox_top], [bbox_left+int64((bbox_right-bbox_left)/2), bbox_top]);
		if tile_top {
			y = bbox_top & ~(tile_size-1);
			y += tile_size+y-bbox_top;
			Velocidade[@ Vertical] = 0;
		}
	}
}
