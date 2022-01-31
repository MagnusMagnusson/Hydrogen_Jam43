if(global.paused){
	draw_set_color(c_black);
	draw_set_font(fnt_big);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,room_width, room_height,0);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(room_width / 2, room_height / 2, "Paused");
	draw_text(room_width / 2, room_height / 2 + string_height("P"), "Press esc/start to resume");
}


var d = get_score();
draw_set_font(fnt_med);
draw_set_color(c_white);
draw_text(64, 64, string(d) + "%");