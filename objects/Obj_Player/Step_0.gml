Scr_Mov_WASD_8DirectionAndSpeed(PlayerSpeed);
Scr_LookingForMouse();

tilemap = layer_tilemap_get_id("CollisionMask");
show_debug_message(tilemap.id);
