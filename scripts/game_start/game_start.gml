function game_start(){
		instance_deactivate_object(o_menu_buttons);
		instance_deactivate_object(o_menu);
		instance_create_depth(0,0,1,o_conductor);
}

function delta(){
	return (delta_time/1000000)/room_speed;
}