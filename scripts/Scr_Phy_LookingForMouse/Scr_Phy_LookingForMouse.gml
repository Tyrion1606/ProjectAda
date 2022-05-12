function Scr_Phy_LookingForMouse(){
	// Sets the phy_rotation by the inverse direction of the vector pointing from the object to the mouse...
	// its important to know that the phy_rotation is inverted with respect to non-phy directions (its something to do a better research later)
	self.phy_rotation = -point_direction(self.x,self.y,mouse_x,mouse_y); // Returns a Vector pointing from player to Mouse
}
