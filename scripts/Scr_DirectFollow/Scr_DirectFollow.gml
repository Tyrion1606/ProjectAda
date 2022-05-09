
function Scr_DirectFollow(Follower, Targuet, Max_Distance = 50, Min_Distance = 5, Velocity = 5){
	Follower.image_angle = point_direction(Follower.x,Follower.y,Targuet.x,Targuet.y); // Returns a Vector pointing from Follower to Targuet
	Follower.direction = Follower.image_angle;
	Distance = point_distance(Follower.x,Follower.y,Targuet.x,Targuet.y)
	

	speed = Velocity * ((Distance < Max_Distance and Distance > Min_Distance))

	
}