///@description		This function make something follow something within a certain distance until a
///					certain distance with a certain velocity...
///					It does not plan any path, just go to the target direction with some velocity
function Scr_DirectFollow(Follower, Targuet, Max_Distance = 50, Min_Distance = 5, Velocity = 5){
	Follower.image_angle = point_direction(Follower.x,Follower.y,Targuet.x,Targuet.y);	// Returns a Vector pointing from Follower to Targuet
	Follower.direction = Follower.image_angle;											// Sets the direction as the same value that the image_angle (so they will walk forward)
	Distance = point_distance(Follower.x,Follower.y,Targuet.x,Targuet.y)				// Calculates the distance
	

	speed = Velocity * ((Distance < Max_Distance and Distance > Min_Distance))			// Sets the speed as Velocity IF the distance is betwen the min/max values

	
}