/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (mostrar_caixa) {
    // Desenhe a caixa/modal
    draw_self();

    // Desenhe os níveis
    var inst_nivel1 = instance_create_layer(x + 65 ,(room_height - 90) / 2 , "Instances", obj_nivel1);
    var inst_nivel2 = instance_create_layer(x + 215,(room_height - 90) / 2 , "Instances", obj_nivel2);
    var inst_nivel3 = instance_create_layer(x + 365, (room_height - 90) / 2 , "Instances", obj_nivel3);
    
	
	inst_nivel1.depth = -2;
	inst_nivel2.depth = -2;
	inst_nivel3.depth = -2;

	
	
}





