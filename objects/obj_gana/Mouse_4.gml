/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (mouse_check_button_pressed(mb_left)) {
    // Crie a instância da caixa/modal
    var inst_caixa_niveis = instance_create_layer((room_width - 600)/2, 200, "Instances", obj_caixa);
    inst_caixa_niveis.depth = -1; // Ajuste a profundidade conforme necessário
	inst_caixa_niveis.mostrar_caixa = true; // Isso pode ser uma variável na caixa/modal
	
}



