function Scr_Phy_Mov(Velocity){
		#region Moviment Comands
	
		#region Check Keyboard
		Up = keyboard_check(ord("W"));
		Down = keyboard_check(ord("S"));
		Right = keyboard_check(ord("D"));
		Left = keyboard_check(ord("A"));
		#endregion
		
		#region Move
	
		if(Up or Down or Right or Left){
			if(Up and !Down and !Right and !Left){
				phy_speed_x = 0; 
				phy_speed_y = -Velocity;
			} else if(Up and !Down and Right and !Left){
				phy_speed_x = Velocity; 
				phy_speed_y = -Velocity;
			} else if(Up and !Down and !Right and Left){
				phy_speed_x = -Velocity; 
				phy_speed_y = -Velocity;
			} else if(!Up and Down and !Right and !Left){
				phy_speed_x = 0; 
				phy_speed_y = Velocity;
			} else if(!Up and Down and Right and !Left){
				phy_speed_x = Velocity; 
				phy_speed_y = Velocity;
			} else if(!Up and Down and !Right and Left){
				phy_speed_x = -Velocity; 
				phy_speed_y = Velocity;
			} else if(!Up and !Down and Right and !Left){
				phy_speed_x = Velocity; 
				phy_speed_y = 0;
			} else if(!Up and !Down and !Right and Left){
				phy_speed_x = -Velocity; 
				phy_speed_y = 0;
			}

		} else {
			phy_speed_x = 0; 
			phy_speed_y = 0; 
		}
	
		#endregion
		
	#endregion
}
