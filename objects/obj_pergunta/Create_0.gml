/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

indice_pergunta = 0;

// pegando a pergunta do array de perguntas no objeto_controller
texto_pergunta = variable_instance_get(obj_quiz_controller, obj_quiz_controller.nome_array)[indice_pergunta][0];
// alternativas pergunta
alternativa_a = variable_instance_get(obj_quiz_controller, obj_quiz_controller.nome_array)[indice_pergunta][1];
alternativa_b = variable_instance_get(obj_quiz_controller, obj_quiz_controller.nome_array)[indice_pergunta][2];
alternativa_c = variable_instance_get(obj_quiz_controller, obj_quiz_controller.nome_array)[indice_pergunta][3];
alternativa_d = variable_instance_get(obj_quiz_controller, obj_quiz_controller.nome_array)[indice_pergunta][4];
// resposta da pergunta
resposta_correta = variable_instance_get(obj_quiz_controller, obj_quiz_controller.nome_array)[indice_pergunta][5];

// ... (verificação de disponibilidade de perguntas)
var haMaisPerguntas = false;

if (global.nivel_atual == 1 && indice_pergunta < array_length(obj_quiz_controller.P_gan_n1) - 1) {
    haMaisPerguntas = true;
} else if (global.nivel_atual == 2 && indice_pergunta < array_length(obj_quiz_controller.P_gan_n2) - 1) {
    haMaisPerguntas = true;
} else if (global.nivel_atual == 3 && indice_pergunta < array_length(obj_quiz_controller.P_gan_n3) - 1) {
    haMaisPerguntas = true;
}

// Se não houver mais perguntas, avance para o próximo nível ou termine o quiz
if (!haMaisPerguntas) {
    global.nivel_atual += 1;
    global.quiz_concluido = true;
    room_goto(1);
}

fonte_pergunta = font_add("Arial", 17, false, false, 0, 0);


alternativa_selecionada = -1; // ou qualquer valor inicial desejado

pontuacao_incrementada = false;



