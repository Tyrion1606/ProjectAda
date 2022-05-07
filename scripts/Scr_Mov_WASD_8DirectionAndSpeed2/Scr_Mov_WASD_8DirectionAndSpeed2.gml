function Scr_Mov_WASD_8DirectionAndSpeed2(Velocidade, ColisaoxPos = 0, ColisaoxNeg = 0, ColisaoyPos = 0, ColisaoyNeg = 0){

	#region Check Keyboard

	Up = keyboard_check(ord("W"));
	Down = keyboard_check(ord("S"));
	Right = keyboard_check(ord("D"));
	Left = keyboard_check(ord("A"));

	#endregion

	#region Movimento
	
	if(Up or Down or Right or Left){

		if(Up and !Down and !Right and !Left){
			vspeed = -(Velocidade-ColisaoyPos);
			hspeed = 0;
		} else if(Up and !Down and Right and !Left){
			vspeed = -(Velocidade-ColisaoyPos)*0.7;
			hspeed = (Velocidade-ColisaoxNeg)*0.7;
		} else if(Up and !Down and !Right and Left){
			vspeed = -(Velocidade-ColisaoyPos)*0.7;
			hspeed = -(Velocidade-ColisaoxPos)*0.7;
		} else if(!Up and Down and !Right and !Left){
			vspeed = (Velocidade-ColisaoyNeg);
			hspeed = 0;
		} else if(!Up and Down and Right and !Left){
			vspeed = (Velocidade-ColisaoyNeg)*0.7;
			hspeed = (Velocidade-ColisaoxNeg)*0.7;
		} else if(!Up and Down and !Right and Left){
			vspeed = (Velocidade-ColisaoyNeg)*0.7;
			hspeed = -(Velocidade-ColisaoxPos)*0.7;
		} else if(!Up and !Down and Right and !Left){
			hspeed = (Velocidade-ColisaoxNeg);
			vspeed = 0;
		} else if(!Up and !Down and !Right and Left){
			hspeed = -(Velocidade-ColisaoxPos);
			vspeed = 0;
		}
	} else {
		vspeed = 0;
		hspeed = 0;
		
	}
	
	#endregion
}
