

draw_set_font(fnt_med);

var margin = 8;
touch = rectangle_in_rectangle(o_player.x - 4, o_player.y - 4, o_player.x + 4, o_player.y + 4 , x - string_width(txt)/2 - margin, y - string_height(y)/2 - margin, x + string_width(txt)/2 + margin, margin + y + string_height(txt)/2);
if(o_player.dash_cooldown > 0 && touch){
	o_player.dash_cooldown = 0;
	action();
}