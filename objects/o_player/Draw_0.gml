if(!instance_exists(o_conductor)){
	draw_set_color(c_white);
} else{
	draw_set_color(player_color);
}

for(var i = 0; i < 16; i+=2){
	if(i <= 4){
		draw_set_alpha(1/2);
	} else{
		draw_set_alpha(1/8);
	}
	draw_circle(x,y,i,false)
}

draw_set_alpha(1);