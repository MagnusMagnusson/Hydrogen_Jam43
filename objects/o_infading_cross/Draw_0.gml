draw_set_color(hazard_color);
draw_set_alpha(a);
draw_rectangle(room_width / 2 - 16,0,room_width / 2 + 16, room_height, false);
draw_rectangle(0,room_height / 2 - 16,room_width, room_height/2 + 16, false);

draw_set_alpha(a/4);
draw_rectangle(room_width / 2 - 20,0,room_width / 2 + 20, room_height, false);
draw_rectangle(0,room_height / 2 - 20,room_width, room_height/2 + 20, false);

draw_rectangle(room_width / 2 - 24,0,room_width / 2 + 24, room_height, false);
draw_rectangle(0,room_height / 2 - 24,room_width, room_height/2 + 24, false);
draw_set_alpha(1);