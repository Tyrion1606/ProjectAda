function Scr_Mov_WASD_8DirectionAndSpeed(Velocidade){

	#region Check Keyboard

	Up = keyboard_check(ord("W"));
	Down = keyboard_check(ord("S"));
	Right = keyboard_check(ord("D"));
	Left = keyboard_check(ord("A"));

	#endregion

	#region Movimento
	
	if(Up or Down or Right or Left){
		
		if (0 < x and x < room_width and 0 < y and y < room_height){
			speed = Velocidade;
		} else{
			speed = Velocidade;
		}

		if(Up and !Down and !Right and !Left){
			direction = 90;
		} else if(Up and !Down and Right and !Left){
			direction = 45;
		} else if(Up and !Down and !Right and Left){
			direction = 135;
		} else if(!Up and Down and !Right and !Left){
			direction = 270;
		} else if(!Up and Down and Right and !Left){
			direction = 315;
		} else if(!Up and Down and !Right and Left){
			direction = 225;
		} else if(!Up and !Down and Right and !Left){
			direction = 0;
		} else if(!Up and !Down and !Right and Left){
			direction = 180;
		}
	} else {
		speed = 0;
	}
	
	#endregion
}