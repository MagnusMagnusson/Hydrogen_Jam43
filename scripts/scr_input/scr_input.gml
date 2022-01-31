global.gb_count = 0;
global.gb = [];
global.gp_main = undefined;

global.paused = false; 

function detect_gamepad(){
	var gp_count = gamepad_get_device_count();
	global.gb_count = 0;
	global.gb = [];
	var j = 0;
	for(var i = 0; i < gp_count; i++){
		if(gamepad_is_connected(i)){
			global.gb_count++;
			global.gb[j++] = i;
			gamepad_set_axis_deadzone(i, 0.1);
			if(gamepad_button_check_pressed(i, gp_start)){
				if(i != global.gp_main){
					if(!is_undefined(global.gp_main)){
						gamepad_set_color(global.gp_main, c_black);
					}
					global.gp_main = i;
					gamepad_set_color(global.gp_main, c_white);
				}
				else {
					global.gp_main = undefined;
				}
			}
		}
	}
	return global.gb_count;
}


#macro ATOM_SPEED 8
#macro ATOM_DASH_LENGTH 128
#macro ATOM_DASH_COOLDOWN 5
function atom_input(){
	if(!global.paused){
		var h,v;
		h = 0;
		v = 0;
		var dash_cooldown = o_player.dash_cooldown;
		var d = false;
		if(dash_cooldown > 0){
			o_player.dash_cooldown--;
			if(dash_cooldown > ATOM_DASH_COOLDOWN){
				o_player.x += lengthdir_x(ATOM_DASH_LENGTH / 3, o_player.direction);
				o_player.y += lengthdir_y(ATOM_DASH_LENGTH / 3, o_player.direction);
			}
		}
	
		if(!is_undefined(global.gp_main)){
			var device = global.gp_main
			h += gamepad_button_check(device, gp_padr) - gamepad_button_check(device, gp_padl) + gamepad_axis_value(device, gp_axislh) + gamepad_axis_value(device, gp_axisrh);
			v += gamepad_button_check(device, gp_padd) - gamepad_button_check(device, gp_padu)+ gamepad_axis_value(device, gp_axislv)	+ gamepad_axis_value(device, gp_axisrv);
			d = gamepad_button_check_pressed(device, gp_shoulderl) || gamepad_button_check_pressed(device, gp_shoulderr) || gamepad_button_check_pressed(device, gp_shoulderlb) || gamepad_button_check_pressed(device, gp_shoulderrb);
		
		}
		h += keyboard_check(vk_right) - keyboard_check(vk_left) + keyboard_check(ord("D")) - keyboard_check(ord("A"))
		v += keyboard_check(vk_down) - keyboard_check(vk_up) + keyboard_check(ord("S")) - keyboard_check(ord("W"))
		d = d || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
	
		if(dash_cooldown == 0 and d){
			o_player.dash_cooldown = 3 + ATOM_DASH_COOLDOWN;
			dash_cooldown = 3 + ATOM_DASH_COOLDOWN;
		}
		o_player.hspeed = h*ATOM_SPEED;
		o_player.vspeed = v*ATOM_SPEED;
		o_player.speed = min(o_player.speed, ATOM_SPEED);
	
		o_player.x = clamp(o_player.x, 32, room_width - 32);
		o_player.y = clamp(o_player.y, 32, room_height - 32);
	}else{
		o_player.speed = 0;
	}
}
	
function is_vulnerable(){			
	return o_player.dash_cooldown < ATOM_DASH_COOLDOWN;
}

function pauseAll(){
	global.paused = true;			
	audio_pause_sound(hydrogen_dance);
	with(all){
		pspeed = speed;
		pdir = direction;
		speed = 0; 
		direction = 0;
	}
}

function resumeAll(){
	global.paused = false;			
	audio_resume_sound(hydrogen_dance);
	with(all){
		speed = pspeed; 
		direction = pdir;
	}
}

function pause_input(){
	if(!global.paused){
		if(!is_undefined(global.gp_main)){
			var device = global.gp_main
			if(gamepad_button_check_pressed(device, gp_start)){
				pauseAll();
			}
		}
		if (keyboard_check_pressed(vk_escape)){
				pauseAll();
		}
	}else{		
		if(!is_undefined(global.gp_main)){
			var device = global.gp_main
			if(gamepad_button_check_pressed(device, gp_start)){
				resumeAll();
			}
		}
		if (keyboard_check_pressed(vk_escape)){
			resumeAll();
		}
	}
}
