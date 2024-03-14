// posição inicial da pergunta
var x_pergunta = 100;
var y_pergunta = 115;

//  cores
var cor_texto = c_black;
var cor_fundo = c_white;
var blue = #87CEFA;
var yellow = #F0E68C;
var violet = #D8BFD8;
var orange =  #FFE4B5;

var cor_destaque_correta = c_lime;
var cor_destaque_errada = c_red;

// Cores de fundo para as alternativas
var cores_fundo_alternativas = [blue, yellow, violet, orange]; 

// margens e espaçamentos para as alternativas
var margem_esquerda = 11;
var margem_superior = 100;
var largura_alternativa = 550; // Largura desejada para cada alternativa
var altura_alternativa = 180;
var espacamento_horizontal = 30; // Espaçamento entre as alternativas na horizontal
var espacamento_vertical = 30; // Espaçamento entre as alternativas na vertical

var alternativa_clicada = -1;
var numero_alternativas = 4; 



// Define uma margem após o texto da pergunta
var margem_final_pergunta = 30;
// var fonte_pergunta = font_add("Arial", 17, false, false, 0, 0);

// Desenha as alternativas
var numero_alternativas;
var altura_texto_pergunta = string_height_ext(texto_pergunta, 30, 1200);
var margem_final_pergunta = 40; 

// Calcula a altura total considerando as alternativas
var altura_total = y_pergunta + altura_texto_pergunta + margem_final_pergunta;

// Define a nova margem das alternativas
var margem_alternativas = 35;

// Define o padding lateral para as alternativas
var padding_lateral = 20;
// Define o padding superior e inferior
var padding_superior = 15; // Alterado para 30 pixels
var padding_inferior = 30; // Alterado para 30 pixels

// Altura inicial das alternativas
var y_alternativa = altura_total + margem_alternativas;

// Calcula a altura máxima entre as alternativas
var altura_maxima_alternativas = 0;


// Define a fonte antes de desenhar o texto
draw_set_font(fonte_pergunta);

// Variável para armazenar o índice da alternativa que o mouse está sobre
var alternativa_sobre_mouse = -1;

// Função para obter o texto da alternativa com base no índice
function getAlternativeText(index) {
    switch (index) {
        case 0: return alternativa_a;
        case 1: return alternativa_b;
        case 2: return alternativa_c;
        case 3: return alternativa_d;
        default: return ""; // Retorna uma string vazia se o índice for inválido
    }
}

// Desenha a pergunta
draw_set_color(cor_texto);
draw_text_ext(x_pergunta, y_pergunta, texto_pergunta, 30, 1200);

// Verifica o nível atual
if (global.nivel_atual == 1 || global.nivel_atual == 2) {
    numero_alternativas = 4;
} else if (global.nivel_atual == 3) {
    numero_alternativas = 2;
}


for (var i = 0; i < numero_alternativas; i++) {
    var altura_texto_alternativa = string_height_ext(getAlternativeText(i), 30, largura_alternativa - 2 * margem_esquerda);
    var altura_alternativa = altura_texto_alternativa + padding_superior + padding_inferior;

    if (altura_alternativa > altura_maxima_alternativas) {
        altura_maxima_alternativas = altura_alternativa;
    }
}

// DESENHA AS ALTERN
var coluna = 0;
for (var i = 0; i < numero_alternativas; i++) {
    var coluna = i % 2; // Determina a coluna (0 ou 1)

    // Desenha o fundo da alternativa com base na altura máxima
    draw_set_color(cores_fundo_alternativas[i]); // Usa uma cor diferente para cada alternativa
	
    draw_roundrect(
	x_pergunta + margem_esquerda + coluna * (largura_alternativa + espacamento_horizontal), 
	y_alternativa,
	x_pergunta + margem_esquerda + coluna * (largura_alternativa + espacamento_horizontal) + largura_alternativa,
	y_alternativa + altura_maxima_alternativas,
	false);

    // Desenha o texto da alternativa com largura máxima
    draw_set_color(cor_texto);
    var texto_alternativa = getAlternativeText(i);

    // Largura máxima fixa para quebrar o texto
    var largura_maxima_texto = largura_alternativa - 2 * margem_esquerda - 2 * padding_lateral;

    // Calcula a posição vertical do texto para centralizá-lo
    var altura_texto = string_height_ext(texto_alternativa, 30, largura_maxima_texto);
    var y_texto = y_alternativa + (altura_maxima_alternativas - altura_texto) / 2;

    // Desenha o texto centralizado
    draw_text_ext(
        x_pergunta + margem_esquerda + coluna * (largura_alternativa + espacamento_horizontal) + padding_lateral,
        y_texto,
        texto_alternativa,
        30,
        largura_maxima_texto
    );

    // Atualiza a posição para a próxima alternativa
    if (coluna == 1) {
        // Se estivermos na segunda coluna, ajustamos a posição vertical
        y_alternativa += altura_maxima_alternativas + espacamento_vertical;
    }
}

// Verifica o clique do mouse
// Verifica o clique do mouse apenas se uma alternativa não foi selecionada
if (mouse_check_button_pressed(mb_left)) {
    var mouse_x_real = mouse_x;
    var mouse_y_real = mouse_y;

    for (var i = 0; i < 4; i++) {
        var linha = floor(i / 2); // Determina a linha (0 ou 1)
        var coluna = i % 2; // Determina a coluna (0 ou 1)
    
        var x_alternativa = x_pergunta + margem_esquerda + coluna * (largura_alternativa + espacamento_horizontal);
        var y_alternativa = y_pergunta + margem_superior + linha * (altura_maxima_alternativas + espacamento_vertical);
		
		// Verifica se o clique do mouse ocorreu dentro da área da alternativa
        if (mouse_x_real >= x_alternativa && mouse_x_real <= x_alternativa + largura_alternativa &&
            mouse_y_real >= y_alternativa && mouse_y_real <= y_alternativa + altura_maxima_alternativas) {
            // A alternativa i foi clicada
            show_debug_message("Alternativa clicada: " + string(i));
            alternativa_selecionada = i; // Atualiza a alternativa selecionada // A alternativa i foi clicada
			audio_play_sound(snd_button_press_01, 0, 0); // Toca o som de clique
		}
    }
}

// Verifica se o mouse está sobre uma alternativa durante o evento Draw
for (var i = 0; i < 4; i++) {
    var linha = floor(i / 2); // Determina a linha (0 ou 1)
    var coluna = i % 2; // Determina a coluna (0 ou 1)

    var x_alternativa = x_pergunta + margem_esquerda + coluna * (largura_alternativa + espacamento_horizontal);
    var y_alternativa = y_pergunta + margem_superior + linha * (altura_maxima_alternativas + espacamento_vertical);
    
    // Verifica se o mouse está sobre a área da alternativa
    if (mouse_x >= x_alternativa && mouse_x <= x_alternativa + largura_alternativa &&
        mouse_y >= y_alternativa && mouse_y <= y_alternativa + altura_maxima_alternativas) {
        // Define qual alternativa o mouse está sobre
        alternativa_sobre_mouse = i;
        break; // Interrompe o loop assim que uma alternativa for encontrada
    } else {
        // Se o mouse não estiver sobre nenhuma alternativa, define alternativa_sobre_mouse como -1
        alternativa_sobre_mouse = -1;
    }
}

// Verifica se o mouse está sobre uma alternativa e aplica o efeito hover
if (alternativa_sobre_mouse != -1) {
    if (global.nivel_atual == 3) {
        // Para o nível 3, apenas aplique o efeito hover nas duas alternativas existentes
        if (alternativa_sobre_mouse < 2) {
            var linha = 0; // A linha é sempre 0 para o nível 3
            var coluna = alternativa_sobre_mouse; // A coluna é o próprio índice da alternativa

            var x_hover = x_pergunta + margem_esquerda + coluna * (largura_alternativa + espacamento_horizontal);
            var y_hover = altura_total + margem_alternativas; // A altura inicial é a mesma para ambas as alternativas do nível 3
            var largura_hover = largura_alternativa;
            var altura_hover = altura_maxima_alternativas;

            draw_set_color(c_white);

            // Desenha as bordas
            draw_rectangle(x_hover, y_hover, x_hover + largura_hover, y_hover + 2, false);
            draw_rectangle(x_hover, y_hover + altura_hover - 2, x_hover + largura_hover, y_hover + altura_hover, false);
            draw_rectangle(x_hover, y_hover, x_hover + 2, y_hover + altura_hover, false);
            draw_rectangle(x_hover + largura_hover - 2, y_hover, x_hover + largura_hover, y_hover + altura_hover, false);
        }
    } else {
        // Para os outros níveis, o comportamento permanece o mesmo
        var linha = floor(alternativa_sobre_mouse / 2); // Determina a linha (0 ou 1)
        var coluna = alternativa_sobre_mouse % 2; // Determina a coluna (0 ou 1)

        var x_hover = x_pergunta + margem_esquerda + coluna * (largura_alternativa + espacamento_horizontal);
        var y_hover = altura_total + margem_alternativas + linha * (altura_maxima_alternativas + espacamento_vertical);
        var largura_hover = largura_alternativa;
        var altura_hover = altura_maxima_alternativas;

        draw_set_color(c_white);

        // Desenha as bordas
        draw_rectangle(x_hover, y_hover, x_hover + largura_hover, y_hover + 2, false);
        draw_rectangle(x_hover, y_hover + altura_hover - 2, x_hover + largura_hover, y_hover + altura_hover, false);
        draw_rectangle(x_hover, y_hover, x_hover + 2, y_hover + altura_hover, false);
        draw_rectangle(x_hover + largura_hover - 2, y_hover, x_hover + largura_hover, y_hover + altura_hover, false);
    }
}


//show_debug_message("Alternativa selecionada: " + string(alternativa_selecionada));
// Verifica se a pergunta foi respondida corretamente

var feedback_object = obj_feedback;
var btn = obj_btn_fechar;
 
// Verifica se uma alternativa foi selecionada
if (alternativa_selecionada != -1) {
	global.revisarClicado = false;
    global.cont++; // Incrementa o contador global

	// Verifica se a pergunta já foi respondida para evitar múltiplas incrementações
	var pergunta_respondida = false; // Marca a pergunta como respondida
    // Verifica se a alternativa selecionada é correta
    // Verifica se a alternativa selecionada é correta
	show_debug_message(global.nivel_atual)
    if (alternativa_selecionada == (resposta_correta - 1)) {
        // A resposta está correta
        if (!pontuacao_incrementada) {
			 if (global.erros_na_questao == 0) {
                global.pontuacao_do_nivel += 10; // Atribui 10 pontos se não houve erros
            } else if (global.erros_na_questao == 1) {
                global.pontuacao_do_nivel += 5; // Atribui 5 pontos se houve 1 erro
            } else {
                global.pontuacao_do_nivel += 3; // Atribui 3 pontos se houve mais de 1 erro
            }
            pontuacao_incrementada = true;   
            feedback_object = obj_feedback; // Objeto para resposta correta
            btn = obj_btn_fechar;
			
			// Toca o som de feedback positivo
			audio_play_sound(snd_coin_collect_01, 0, 0);
			
        }   
		pergunta_respondida = true; // Marca a pergunta como respondida
   
    } else {
        // A resposta está incorreta  
        feedback_object = obj_intervencao; // Objeto para resposta incorreta
        btn = obj_btn_revisar;
		
    }

    // Exibe a caixa de feedback ou de intervenção e o botão
    feedback_object.visible = true;
    btn.visible = true;

    // Verifica se o botão "Refazer" foi clicado
   // if (mouse_check_button_pressed(mb_left)) {
        if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, btn.x, btn.y, btn.x + sprite_get_width(btn.sprite_index), btn.y + sprite_get_height(btn.sprite_index))) {
            // Se a resposta estiver incorreta, não avança para a próxima pergunta
            if (feedback_object == obj_intervencao) {
                global.revisarClicado = true; // Define o botão "Refazer" como clicado
                // Reseta as variáveis de pontuação e alternativa selecionada
                alternativa_selecionada = -1;
                pontuacao_incrementada = false;
				// Armazena o índice da pergunta atual
				global.indice_pergunta_atual = indice_pergunta;

				room_goto(4);
				
                if (!pergunta_respondida) { // Incrementa apenas se a pergunta não foi respondida antes
                    global.erros_na_questao += 1; // Incrementa o contador de erros
		        }
				pergunta_respondida = true; // Marca a pergunta como respondida
				
            } else {
                // Se a resposta estiver correta, esconde a caixa de feedback e o botão
                feedback_object.visible = false;
                btn.visible = false;
            }
        }       
    }
//}


if(alternativa_selecionada != -1 && feedback_object.visible == false && btn.visible == false){
		pontuacao_incrementada = false;
		// Carrega a próxima pergunta (se houver mais perguntas)
		
	    if (global.nivel_atual == 1 && indice_pergunta < array_length(obj_quiz_controller.P_gan_n1) - 1) {
	        indice_pergunta += 1;

	        // Reinicializa variáveis para a nova pergunta
	        texto_pergunta = obj_quiz_controller.P_gan_n1[indice_pergunta][0];
	        alternativa_a = obj_quiz_controller.P_gan_n1[indice_pergunta][1];
	        alternativa_b = obj_quiz_controller.P_gan_n1[indice_pergunta][2];
	        alternativa_c = obj_quiz_controller.P_gan_n1[indice_pergunta][3];
	        alternativa_d = obj_quiz_controller.P_gan_n1[indice_pergunta][4];
	        resposta_correta = obj_quiz_controller.P_gan_n1[indice_pergunta][5];
	        alternativa_selecionada = -1;
	        pontuacao_incrementada = false;
			global.erros_na_questao = 0;
	    } else if (global.nivel_atual == 2 && indice_pergunta < array_length(obj_quiz_controller.P_gan_n2) - 1) {
	        indice_pergunta += 1;

	        // Reinicializa variáveis para a nova pergunta
	        texto_pergunta = obj_quiz_controller.P_gan_n2[indice_pergunta][0];
	        alternativa_a = obj_quiz_controller.P_gan_n2[indice_pergunta][1];
	        alternativa_b = obj_quiz_controller.P_gan_n2[indice_pergunta][2];
	        alternativa_c = obj_quiz_controller.P_gan_n2[indice_pergunta][3];
	        alternativa_d = obj_quiz_controller.P_gan_n2[indice_pergunta][4];
	        resposta_correta = obj_quiz_controller.P_gan_n2[indice_pergunta][5];
	        alternativa_selecionada = -1;
	        pontuacao_incrementada = false;
			global.erros_na_questao = 0;
	    } else if (global.nivel_atual == 3 && indice_pergunta < array_length(obj_quiz_controller.P_gan_n3) - 1) {
	        indice_pergunta += 1;

	        // Reinicializa variáveis para a nova pergunta
	        texto_pergunta = obj_quiz_controller.P_gan_n3[indice_pergunta][0];
	        alternativa_a = obj_quiz_controller.P_gan_n3[indice_pergunta][1];
	        alternativa_b = obj_quiz_controller.P_gan_n3[indice_pergunta][2];
	        alternativa_c = ""; // Defina a alternativa C para vazio (True)
	        alternativa_d = ""; // Defina a alternativa D para vazio (False)
	        resposta_correta = obj_quiz_controller.P_gan_n3[indice_pergunta][3]; // Índice da resposta correta
	        alternativa_selecionada = -1;
	        pontuacao_incrementada = false;
			global.erros_na_questao = 0;
	    } else {
	        // Todas as perguntas foram respondidas, você pode adicionar lógica adicional aqui
	        global.nivel_atual += 1;
	        global.quiz_concluido = true;
			global.pontos += global.pontuacao_do_nivel;
			global.pontuacao_do_nivel = 0;
	        room_goto(1);
	    }
	}





// Função para calcular o número de estrelas com base na pontuação
function calcularEstrelas(pontuacao) {
    if (pontuacao >= 80) {
        return 3;
    } else if (pontuacao >= 50) {
        return 2;
    } else if (pontuacao >= 10) {
        return 1;
    } else {
        return 0;
    }
}
