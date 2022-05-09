CurrentX = camera_get_view_width(view_camera[0]);
CurrentY = camera_get_view_height(view_camera[0]);

if (CurrentX < room_width and CurrentY < room_height and CurrentX < 1280 and CurrentY < 720){
	camera_set_view_size(view_camera[0],CurrentX*1.02,CurrentY*1.02);
}

