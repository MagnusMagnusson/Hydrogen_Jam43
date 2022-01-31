draw_set_font(fnt_big);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(room_width / 2, room_height / 4, "Hydrogen: the Dance of Creation");

draw_set_font(fnt_med);
draw_text(room_width / 2, room_height / 3, "Use WASD or the arrow keys to move around. Use space or enter to dash");
draw_text(room_width / 2, room_height / 3 + string_height("a"), "ESC/Start to pause, F11 to toggle fullscreen");

var gp = detect_gamepad()
if(gp == 0){
	draw_text(room_width / 2, room_height /  3 + 2*string_height("a"), "No controllers detected, but we do recommend using a controller for this game.");
} else if(is_undefined(global.gp_main)){
	draw_text(room_width / 2, room_height /  3 + 2*string_height("a"), "We detected " + string(gp) + " connected controllers! We suggest using them. Press start/options on the controller you wish to use to enable it");
} else{	
	draw_text(room_width / 2, room_height /  3 + 2*string_height("a"), "Move with the D-pad or either analog stick. Use any bumper to dash");
}


	draw_text(room_width / 2, room_height /  3 + 3*string_height("a"), "Move to an option, and dash to select it");