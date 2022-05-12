function Scr_LookingForMouse(){
	// Gets the direction of the vector pointing from the object to the mouse and set the image_angle of the object as it
	id.image_angle = point_direction(id.x,id.y,mouse_x,mouse_y); // Returns a Vector pointing from player to Mouse
}