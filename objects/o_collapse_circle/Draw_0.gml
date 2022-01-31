draw_primitive_begin(pr_trianglestrip);
var _steps = 40;

for(var i = 0; i <= _steps; ++i;){
    draw_vertex_color(x + lengthdir_x(radius - width/2, 360 * (i/_steps)), y + lengthdir_y(radius - width/2, 360 * (i/_steps)),hazard_color, 1);
    draw_vertex_color(x + lengthdir_x(radius + width/2, 360 * (i/_steps)), y + lengthdir_y(radius + width/2, 360 * (i/_steps)), hazard_color, 1);
}
draw_primitive_end(); 

draw_primitive_begin(pr_trianglestrip);
var _steps = 40;

for(var i = 0; i <= _steps; ++i;){
    draw_vertex_color(x + lengthdir_x(radius - width, 360 * (i/_steps)), y + lengthdir_y(radius - width, 360 * (i/_steps)),hazard_color, 0.25);
    draw_vertex_color(x + lengthdir_x(radius + width, 360 * (i/_steps)), y + lengthdir_y(radius + width, 360 * (i/_steps)), hazard_color, 0.25);
}
draw_primitive_end(); 