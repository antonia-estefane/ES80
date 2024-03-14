// Variáveis para armazenar a posição do mouse na GUI
var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0);


image_index = global.clique_mouse;

if(mouse_check_button_pressed(mb_left)){
	if(global.clique_mouse == 0) {
			image_index = global.clique_mouse;
			global.clique_mouse = 2;
		}else if(global.clique_mouse == 2){
			image_index = global.clique_mouse;
			global.clique_mouse = 0;
		}
}

if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
{
	
	// Alterna entre os estados normal (0) e clique (1)
	// Se estiver, muda para o frame de hover (1)
	if(global.clique_mouse == 0) {
			image_index = 1;
		
	}else if(global.clique_mouse == 2){
			image_index = 3;
	}

	// Se o botão esquerdo do mouse for pressionado
	if (mouse_check_button_pressed(mb_left))
	{
		// Reduce the scale of the instance so it appears smaller while it's pressed
		image_xscale = 0.78;
		image_yscale = 0.78;
		
		if(global.clique_mouse == 0) {
			image_index = global.clique_mouse;
			global.clique_mouse = 2;
		}else if(global.clique_mouse == 2){
			image_index = global.clique_mouse;
			global.clique_mouse = 0;
		}
		
	}
	// Se o botão esquerdo do mouse for liberado (clique)
	else if (mouse_check_button_released(mb_left))
	{
		// Redefine a escala para o tamanho normal do botão
		image_xscale = 0.79;
		image_yscale = 0.79;
	}
}

