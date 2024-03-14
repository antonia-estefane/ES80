if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, obj_btn_fechar.x, obj_btn_fechar.y, obj_btn_fechar.x + sprite_get_width(obj_btn_fechar.sprite_index), obj_btn_fechar.y + sprite_get_height(obj_btn_fechar.sprite_index))) {
		obj_feedback.visible = false;
		obj_btn_fechar.visible = false;
	}
}



