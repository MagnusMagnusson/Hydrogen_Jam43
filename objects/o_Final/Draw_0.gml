draw_self();
draw_set_color(c_white);
draw_set_alpha(a);
draw_rectangle(0,0,room_width, room_height, false);

draw_set_alpha(1);

if(a > 1){
	draw_set_color(c_black);
	draw_set_font(fnt_big);
	var d = get_score();
	draw_text(room_width / 2, room_height / 2 - 64, string(d)+"%")
	var t = "";
	if (d == 100){
		t = "Flawless!";
	} else if (d > 95){
		t = "Amazing!"
	}else if (d > 90){
		t = "Excellent!"
	}else if (d > 85){
		t = "Great!"
	}else if (d > 80){
		t = "Good!"
	}else if (d > 70){
		t = "Satisfactory!"
	}else if (d > 60){
		t = "Decent"
	}else {
		t = "You can do better."
	}
	draw_text(room_width / 2, room_height / 2 , t)
	draw_text(room_width / 2, room_height / 2 + 64 , "Dash to return to the main menu")
}