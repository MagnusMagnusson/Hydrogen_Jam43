function conductor_tick(){
	tick += delta_time / 1000000;
	if(tick >= nextStage){
		conductor_trigger_stage();
	}
}

#macro piss_yellow $CCFFFF
#macro noodle_red $AAAAFF
#macro hazard_blue $FF0000
#macro hazard_color o_conductor.red ? noodle_red : piss_yellow
#macro player_color o_conductor.red ? hazard_blue : c_white


function get_score(){
	var d = max(0,(180 - o_conductor.danger) / 180);
	d = ceil(d * d * 10000)/100;
	return d;
}

function conductor_trigger_stage(){
	stage++;
	switch(stage){
		case 1:
		case 2:
		case 3:{
			if(stage == 3){
				nextStage = 20;
			} else{
				nextStage += 4;
			}
			var i = instance_create_layer(room_width / 2, room_height / 2, "Instances", o_collapse_circle);
			i.min_radius = stage * 50;
			break;
		}
		case 4:{
			nextStage = 30;
			with(o_collapse_circle){
				instance_destroy();
			}
			instance_create_layer(0,0,"Instances", o_fadeout_white);
			for(var i = 0; i < 30; i++){
				for(var j = 0; j < 360; j+= 360/40){
					var o = instance_create_layer(room_width / 2, room_height / 2, "Instances", o_orb);
					o.direction = j + i/16;
					o.speed = (2+i)/7;
				}
			}
			break;
		}
		case 5:{
			nextStage = 40;
			var amount = 10;
			for(var j = 0; j < 10; j++){
				for(var i = 0; i < amount; i++){
					var i1 = instance_create_layer(i*room_width / amount, -24 * 5*j, "Instances", o_wiggly_orb);
					var i2 = instance_create_layer(i*room_width / amount, room_height+24 * 5*j, "Instances", o_wiggly_orb);
				
					i1.wiggledir = (j%2 ^ i%2) ? 1 : -1;
					i2.wiggledir = (((1+j)%2) ^ i%2)  ? 1 : -1;
					i1.vspeed = 1;
					i2.vspeed = -1;
				}
			}
			break;
		}
		case 6:{
			instance_create_layer(0,0, "Instances", o_infading_cross);
			nextStage = 45;
			break;
		}
		case 7 : {
			instance_create_layer(room_width / 2,room_height / 2, "Instances", o_spiraller);
			nextStage = 60;
			break;
		}		
		case 8 : {
			var a1,a2,a3,a4;
			a1 = instance_create_layer(0,0, "Instances", o_flashbox);
			a2 = instance_create_layer(room_width / 2,room_height / 2, "Instances", o_flashbox);
			a3 = instance_create_layer(0,room_height / 2, "Instances", o_flashbox);
			a4 = instance_create_layer(room_width / 2,0, "Instances", o_flashbox);
			
			a1.w = room_width / 2;
			a2.w = room_width / 2;
			a3.w = room_width / 2;
			a4.w = room_width / 2;
			a1.a = -0.5;
			a2.a = -0.5;
			a1.h = room_height / 2;
			a2.h = room_height / 2;
			a3.h = room_height / 2;
			a4.h = room_height / 2;
			nextStage = 80;
			break;
		}		
		case 9 : {
			instance_destroy(o_infading_cross);
			instance_destroy(o_spiraller);
			var i = instance_create_layer(room_width / 2, room_height / 2, "Instances", o_collapse_circle_full);
			nextStage += 3;
			break;
		}
		case 10:
		case 11:
		case 12:
		case 14:
		case 13:{	
			if(stage == 10){	
				var amount = 25;
				for(var j = 0; j < 10; j++){
					for(var i = 0; i < amount; i++){
						var i1 = instance_create_layer(i*room_width / amount, -24 * 5*j, "Instances", o_wiggly_orb);
						var i2 = instance_create_layer(i*room_width / amount, room_height+24 * 5*j, "Instances", o_wiggly_orb);
				
						i1.wiggledir = (j%2 ^ i%2) ? 1 : -1;
						i2.wiggledir = (((1+j)%2) ^ i%2)  ? 1 : -1;
						i1.vspeed = 1;
						i2.vspeed = -1;
					}
				}
			}
			var i = instance_create_layer(room_width / 2, room_height / 2, "Instances", o_collapse_circle_full);
			nextStage += 3;
			break;
		}
		case 15:{
			nextStage = 100;
			instance_create_layer(0,0,"Instances", o_targeter);
			instance_create_layer(room_width,0,"Instances", o_targeter);
			instance_create_layer(0,room_height,"Instances", o_targeter);
			instance_create_layer(room_width,room_height,"Instances", o_targeter);
			break;
		}
		case 16:{
			nextStage = 120;
			instance_create_layer(0,0,"Instances", o_tableshrinker)
			break;
		}
		case 17:{
			nextStage = 150;
			with(o_targeter){
				instance_destroy();
			}
			instance_create_layer(0,0,"Instances", o_spiraller);
			instance_create_layer(room_width,0,"Instances", o_spiraller);
			instance_create_layer(0,room_height,"Instances", o_spiraller);
			instance_create_layer(room_width,room_height,"Instances", o_spiraller);
			break;
		}
		case 18:{
			nextStage = 160;
			with(o_spinningOrb){
				angspeed = dir/4;
			}
			with(o_spiraller){
				instance_destroy();
			}
			break;
		}
		case 19:{
			nextStage = 200;
			with(o_spinningOrb){
				rspeed = -1/4;
			}
			break;
		}
		case 20:{
			with(o_spinningOrb){
				instance_destroy();
			}
			instance_create_layer(0,0,"Instances",o_Final);
			instance_create_layer(0,0,"Instances_1",o_fadeout_white);
			break;
		}
	}
}