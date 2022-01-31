draw_set_alpha(1);
draw_set_font(fnt_med);

var margin = 8;
touch = rectangle_in_rectangle(o_player.x - 4, o_player.y - 4, o_player.x + 4, o_player.y + 4 , x - string_width(txt)/2 - margin, y - string_height(y)/2 - margin, x + string_width(txt)/2 + margin, margin + y + string_height(txt)/2);
if(!touch){
	draw_set_color(c_gray);
} else{
	draw_set_color(c_white);
}
draw_text(x,y,txt);

draw_set_color(c_white);
