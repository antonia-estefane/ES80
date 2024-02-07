// posição inicial da pergunta
var x_pergunta = 50;
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

// margens e espaçamentos para as alternativas
var margem_esquerda = 11;
var margem_superior = 100;
var largura_alternativa = 550; // Largura desejada para cada alternativa
var altura_alternativa = 180;
var espacamento_horizontal = 30; // Espaçamento entre as alternativas na horizontal
var espacamento_vertical = 30; // Espaçamento entre as alternativas na vertical

// Cria uma nova fonte
//var fonte_pergunta = font_add("Arial", 22, false, false, 0, 0);

// Define a fonte antes de desenhar o texto
draw_set_font(fonte_pergunta);

// Verifica o clique do mouse
if (mouse_check_button_pressed(mb_left)) {
    var mouse_x_real = mouse_x;
    var mouse_y_real = mouse_y;

    for (var i = 0; i < 4; i++) {
        var linha = floor(i / 2); // Determina a linha (0 ou 1)
        var coluna = i % 2; // Determina a coluna (0 ou 1)

        var x_alternativa = x_pergunta + margem_esquerda + coluna * (largura_alternativa + espacamento_horizontal);
        var y_alternativa = y_pergunta + margem_superior + linha * (altura_alternativa + espacamento_vertical);

        // Verifica se o clique do mouse ocorreu dentro da área da alternativa
        if (mouse_x_real >= x_alternativa && mouse_x_real <= x_alternativa + largura_alternativa &&
            mouse_y_real >= y_alternativa && mouse_y_real <= y_alternativa + altura_alternativa) {
            // A alternativa i foi clicada
            alternativa_selecionada = i; // Atualiza a alternativa selecionada
            
            // Verifica se a alternativa selecionada é a correta
            if (alternativa_selecionada == (resposta_correta - 1)) {
                // Se a alternativa estiver correta, define a cor de fundo como verde
                cores_fundo_alternativas[i] = c_lime;
            } else {
                // Se a alternativa estiver incorreta, define a cor de fundo como vermelho
                cores_fundo_alternativas[i] = c_red;
            }
            
            // Saindo do loop após clicar em uma alternativa
            break;
        }
    }
}

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

// Define uma margem após o texto da pergunta
var margem_final_pergunta = 30;
// var fonte_pergunta = font_add("Arial", 17, false, false, 0, 0);

// Cores de fundo para as alternativas
var cores_fundo_alternativas = [blue, yellow, violet, orange]; 

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

// Verifica o nível atual
if (global.nivel_atual == 1 || global.nivel_atual == 2) {
    numero_alternativas = 4;
} else if (global.nivel_atual == 3) {
    numero_alternativas = 2;
}

// Altura inicial das alternativas
var y_alternativa = altura_total + margem_alternativas;

// Calcula a altura máxima entre as alternativas
var altura_maxima_alternativas = 0;

for (var i = 0; i < numero_alternativas; i++) {
    var altura_texto_alternativa = string_height_ext(getAlternativeText(i), 30, largura_alternativa - 2 * margem_esquerda);
    var altura_alternativa = altura_texto_alternativa + padding_superior + padding_inferior;

    if (altura_alternativa > altura_maxima_alternativas) {
        altura_maxima_alternativas = altura_alternativa;
    }
}

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


// Verifica se a pergunta foi respondida corretamente
if (alternativa_selecionada != -1) {
    if (alternativa_selecionada == (resposta_correta - 1)) {
        // A resposta está correta, adicione aqui a lógica adicional conforme necessário
        if (!pontuacao_incrementada) {
            global.pontuacao_do_nivel += 10;
            pontuacao_incrementada = true;
        }   
    }

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
    } else {
        // Todas as perguntas foram respondidas, você pode adicionar lógica adicional aqui
        global.nivel_atual += 1;
        global.quiz_concluido = true;
        room_goto(1);
    }
}
