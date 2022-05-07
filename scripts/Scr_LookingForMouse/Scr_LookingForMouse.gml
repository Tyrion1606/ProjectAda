function Scr_LookingForMouse(){
	self.image_angle = point_direction(self.x,self.y,mouse_x,mouse_y); // Returns a Vector pointing from player to Mouse
}