a += delta()*8;

if(a > 1){
	if(o_player.dash_cooldown > 0){
		game_restart();
	}
}