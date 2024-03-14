if (mouse_check_button_pressed(mb_left)) {
	global.revisarClicado = true;

   if (point_in_rectangle(mouse_x, mouse_y, obj_btn_revisar.x, obj_btn_revisar.y, obj_btn_revisar.x + sprite_get_width(obj_btn_revisar.sprite_index), obj_btn_revisar.y + sprite_get_height(obj_btn_revisar.sprite_index))) {
		obj_btn_revisar.visible = false;
		obj_intervencao.visible = false;
	}
}


