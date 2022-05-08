function Scr_Phy_LookingForMouse(){
	self.phy_rotation = -point_direction(self.x,self.y,mouse_x,mouse_y); // Returns a Vector pointing from player to Mouse
}
