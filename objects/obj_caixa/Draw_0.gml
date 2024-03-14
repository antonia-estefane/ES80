if (mostrar_caixa) {
    // Defina a escala desejada para a caixa/modal
    var escala_x = 0.9; // Escala horizontal
    var escala_y = 0.9; // Escala vertical

    // Calcule as coordenadas da caixa/modal com base na escala
    var caixa_x = x;
    var caixa_y = y;
    var caixa_largura = sprite_width * escala_x;
    var caixa_altura = sprite_height * escala_y;

    // Desenhe a caixa/modal com a escala especificada
    draw_sprite_ext(sprite_index, image_index, caixa_x, caixa_y, escala_x, escala_y, image_angle, image_blend, image_alpha);
	
	depth_inst_nivel = -2;

	// Desenhe os níveis com a mesma escala
	var offset_x = 115 * escala_x; // Deslocamento horizontal entre os níveis
	var nivel_y = (room_height - 100) / 2; // Coordenada Y dos níveis

	var inst_nivel1 = instance_create_layer(caixa_x + offset_x + 50, nivel_y +50, "Instances", obj_nivel1);
	var inst_nivel2 = instance_create_layer(caixa_x + offset_x * 2.3, nivel_y, "Instances", obj_nivel2);
	var inst_nivel3 = instance_create_layer(caixa_x + offset_x * 3.6, nivel_y, "Instances", obj_nivel3);

	// Configure a profundidade dos níveis
	inst_nivel1.depth = depth_inst_nivel;
	inst_nivel2.depth = depth_inst_nivel;
	inst_nivel3.depth = depth_inst_nivel;
}
