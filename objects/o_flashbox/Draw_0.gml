draw_set_color(hazard_color);
draw_set_alpha(a < 0.75 ? a : 1);

draw_rectangle(x,y,x+w,y+h,false);

draw_set_alpha(1);