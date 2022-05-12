PlayerSpeed = 5;				// Sets the move speed of the player(this way is bad for a future upgrade system)
MyBase = instance_create_layer(x,y,"Instances", Obj_Base);	// Creates a "Base" that will be the move and colision pivot
MyBase.Velocity=PlayerSpeed;	// The Recent created Base will receive the speed that is suposed to be the PlayerSpeed
