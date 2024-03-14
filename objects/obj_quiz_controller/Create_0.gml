// Inicialize a variável pergunta_atual
global.item = 0;
global.pontuacao_do_nivel = 0;
global.pontos = 0;
global.numero_total_perguntas_fase =0;
global.pontos += global.pontuacao_do_nivel;
global.erros_na_questao = 0;
global.nivel_atual = 1;
global.pergunta_atual= 0;

P_gan_n1 = [
    ["Qual a finalidade da criação de projetos de software?",
	"Mobilizar pessoas a fim de atender as necessidades de empresas",
	"Mobilizar projetistas a fim de atender a prototipagem de recursos",
	"Mobilizar esforços e recursos a fim de atender as necessidades de pessoas",
	"Mobilizar necessidades a fim de atender requisitos de empresas",
	3,
	"Gerenciamento de requisitos sem mistério.mp4"
	],
    ["A especificação de requisitos busca",
	"Concretizar os termos dos contratos",
	"Concretizar as funcionalidades do software",
	"Concretizar as necessidades das pessoas",
	"Concretizar os termos do projeto", 3,
	"Gerenciamento de requisitos sem mistério.mp4"],
	["Quais das opções abaixo não devem caracterizar os requisitos",
	"Ambíguos",
	"Específicos",
	"Não Ambíguos",
	"Verificáveis", 1,
	"Gerenciamento de requisitos sem mistério.mp4"],
	["Qual das tarefas abaixo está relacionada ao Gerenciamento de Requisitos?",
	"Reaproveitar requisitos",
	"Priorizar requisitos",
	"Copiar requisitos",
	"Disputar autoria de requisitos", 2,
	"Gerenciamento de requisitos sem mistério.mp4"],
	["O versionamento dos requisitos deve ser feito com:",
	"Dinâmica, sendo informado imediatamente a todos os membros do projeto a respeito de suas modificações;",
	"Armazenamento em repositórios, visto que requisito algum deve ter seu histórico descartado, isso por conta da gestão de mudanças;",
	"Fidelidade às vontades do cliente, independente se haverão mudanças no valor, tempo do projeto ou aumento do time de desenvolvedores;",
	"Independência, visto que os requisitos do cliente devem ser atendidos de forma individual, desconsiderando os requisitos anteriores;", 
	2,
	"Gerenciamento de requisitos sem mistério.mp4"],
	["A compreensão sobre os relacionamentos entre requisitos está relacionada a tarefa de",
	"Manter requisitos",
	"Priorizar requisitos",
	"Rastrear requisitos",
	"Avaliar mudanças", 3,
	"Gerenciamento de requisitos sem mistério.mp4"],
	["É um problema comum no versionamento de requisitos",
	"Projetos concorrentes",
	"Versões concorrentes",
	"Armazenamento desnecessário",
	"Restrição do escopo do projeto", 2,
	"Gerenciamento de requisitos sem mistério.mp4"]
];

P_gan_n2 = [
	["É característica de protótipos de baixa fidelidade:",
	"Possibilita a interação do usuário, como se fosse o produto final.",
	"Valida uma funcionalidade específica.",
	"É apresentado obrigatoriamente no formato final.",
	"Menor custo de criação e alteração. Mais barato e rápido para a equipe desenvolvê-lo.",
	 4],
	["O que são protótipos em papel?",
	"São modelos funcionais de como ficará o software",
	"São exemplos de Hi-Fi",
	"São representações de interfaces gráficas",
	"São técnicas dispensáveis para grandes softwares",
	3],
	[
	"Em que momento deve ser criado um protótipo de baixa fidelidade?",
	"Quando o cliente solicitar por meio de formulário de requisitos",
	"Quando o stakeholder não souber utilizar as funcionalidades do novo sistema",
	"Quando for necessário representar a UX do sistema",
	"Quando for necessário avaliar o fluxo de informações e navegação de sistema",
	4],
	[
	"Dizer que um protótipo é Hi-Fi é o mesmo que dizer que",
	"Ele é muito utilizado para demonstrar recursos interativos da interface.",
	"Ele possui cores altamente  realistas",
	"Ele possui alta fidelidade",
	"Ele possui baixa fidelidade",
	3],
	[
	"Das opções abaixo, qual caracteriza a diferença entre um MVP (produto mínimo viável) e um protótipo?",
	"Protótipos são implementados para testar a viabilidade de um sistema junto aos seus usuários finais, enquanto MVP's não garantem essa finalidade",
	"Protótipos podem incluir toda a interface de um sistema, com milhares de funcionalidades, enquanto MVP's implementam um número mínimo de funcionalidades",
	"MVP's podem ser construídos para demonstrar o sistema apenas para os executivos de uma empresa contratante. Por isso mesmo, eles também não são produtos, diferente dos protótipos.",
	"MVP é uma técnica conhecida em Engenharia de Software para elicitação e validação de requisitos, enquanto protótipos devem ser apresentados com todas as funcionalidades válidas para teste.",
	2],
	[
	"Apesar de não existir uma definição muito clara a respeito, o que pode ser usado como definição para Requisitos  Ágeis?",
	"Conjunto de técnicas para gerar alinhamento entre os clientes e o time de desenvolvimento.",
	"Conjunto de recomendações e técnicas para projetos de desenvolvimento de produtos seguindo uma abordagem Agile",
	"Conjunto de técnicas para gerenciar alterações nos requisitos acordados, gerenciar relacionamentos entre requisitos, gerenciar dependências entre requisitos e outros documentos produzidos durante o processo de software",
	"Conjunto de técnica que você irá disponibilizar para teste do seu público-alvo, bem como o nível de interação que essas ferramentas também influenciarão na percepção de valor do usuário.",
	2],
	[
	"Qual das opções abaixo representa um princípio que está por trás das recomendações quando se trata de requisitos ágeis",
	"Deve ser possível reduzir o preço da entrega sem alterar as funcionalidades exigidas pelo cliente e acordadas em contrato. Desta forma, agregando valor de mercado para a empresa e promovendo o networking.",
	"Deve ser possível oferecer suporte os requisitos em sua totalidade. Isto resulta da associação existente entre arquitetura de software e requisitos não funcionais",
	"Deve ser possível mudar um requisito durante o projeto de desenvolvimento da solução  para entregar um produto que maximize valor ao cliente",
	"Deve ser feito cópias (backup) de todos os dados do sistema a cada 24 horas e estas cópias devem ser guardadas em um local seguro",
	3],
	[
	"Qual dessas premissas NÃO faz parte do conceito INVEST (essencial para a escrita de histórias de usuário)",
	"Inaccurate (Impreciso): não precisa de clareza no início, apenas na implentação",
	"Negotiable (Negociável): pode ser removida a qualquer instante se descobrir que não é útil",
	"Valuable (Valorosa): entregar valor",
	"Estimable (Estimável): capaz de ser estimada",
	1],
	[
	"À medida que os sistemas tornam-se maiores e mais complexos, o suporte a requisitos não funcionais depende cada vez mais de decisões tomadas no projeto da (...). Trata-se de uma visão compartilhada pelos profissionais da área e, especificamente, pela comunidade de (...).                                          A melhor substituição para (...) é:",
	"Arquitetura de software",
	"Reutilização de software",
	"Auditoria de software",
	"Informação do domínio",
	1],
	[
	"Um profissional da área administrativa de certa instituição recebeu um Analista de Sistemas que estava fazendo o levantamento de requisitos para a construção de um novo software. Ao informar ao Analista um requisito não funcional para seu departamento, o profissional corretamente disse que",
	"O sistema deveria permitir a alteração de dados incluídos de forma equivocada",
	"O acesso ao sistema deveria ser por meio de uma senha composta por letras e números e não apenas por números.",
	"O sistema deveria permitir a exclusão de registros de pessoas que deixaram de ser clientes da instituição.",
	"A resposta a uma consulta de dados deveria durar no máximo dois segundos para não atrasar seu trabalho.",
	4],
	[
	"Qual das opções abaixo não pode ser considerada como classificação para Requisitos Não Funcionais",
	"Requisitos do Produto, que especifica o comportamento do software. Ex.: Desempenho",
	"Requisitos Externos, que são derivados do ambiente ou fatores externos ao sistema. Ex.: Legislação.",
	"Requisitos de Completude, ou seja, todas os serviços devem estar definidos. Ex.: Consulta de um caixa eletrônico ao extrato bancário do cliente.",
	"Requisitos Organizacionais, que dizem respeito à maneira da empresa organizar-se. Ex.: Todos os documentos entregues devem seguir o padrão de relatórios XYZ-00",
	3],
	[
	"Suponha que um Analista de TI, participando da etapa de análise de requisitos de um sistema de emissão de certidão negativa para o TRF4, tenha elencado os requisitos apresentados abaixo:         1. Utilizar interface responsiva para que possa ser executado em dispositivos móveis e na web;  2. Validar o tipo de certidão solicitado; 3. Emitir certidão negativa após verificação de situação do requerente; 4. Solicitar o CPF do requerente 5. Responder ao clique único do usuário em qualquer botão da interface; 6. Validar o CPF do requerente; 7. Restaurar os dados automaticamente após falhas não programadas;  8. Solicitar o nome do requerente; 9. Oferecer dois tipos de certidão: para fins gerais e para fins eleitorais; 10. Emitir aviso de impossibilidade de emissão da certidão. Sobre os requisitos, é correto afirmar que",
	"todos são funcionais.",
	"todos são não funcionais.",
	"1, 5 e 7 são não funcionais.",
	"apenas 3, 4, 8, 9 e 10 são funcionais.",
	3]
];

P_gan_n3 =[
["É importante ressaltar que a fase de prototipação pode ser realizada em diversos momentos",
"Verdadeiro",
"Falso",
1],
["A redução de etapas de desenvolvimento é um dos benefícios da prototipação",
"Verdadeiro",
"Falso",
2],
["O caso da prototipação descartável ou temporária, é aquela elaborada no primeiro momento do projeto e, conforme o desenvolvimento for avançando, esse protótipo é refeito, adaptado e alinhado às fases de elaboração.",
"Verdadeiro",
"Falso",
2],
["Mock up é, no contexto de software, uma simulação do que será o software, os usuários podem validar todas as funcionalidades em tempo real, já também com uma representação visual.",
"Verdadeiro",
"Falso",
1
],
["Versionamento é a propriedade que um software exibe para solucionar problemas reais",
"Verdadeiro",
"Falso",
2],
["Resolver o problema do cliente sempre será o foco de qualquer projeto de software",
"Verdadeiro",
"Falso",
1
],
["Os requisitos estão presentes apenas durante o ciclo de controle de qualidade de um software",
"Verdadeiro",
"Falso",
2 ],
["Emissão de relatórios de clientes ou vendas é um exemplo de um requisito não-funcional",
"Verdadeiro",
"Falso",
2
],
[" Requisitos Não Funcionais definem como o sistema fará cada funcionalidade",
"Verdadeiro",
"Falso",
1

],
["Os requisitos funcionais definem características e impõe limites do sistema como método de desenvolvimento, tempo, espaço",
"Verdadeiro",
"Falso",
2 ],
["O sistema deve ser implementado na linguagem Java é um exemplo de requisito não-funcional.",
"Verdadeiro",
"Falso",
1],
]





// var obj_pergunta = instance_nearest(x, y, obj_pergunta); // ou outra forma de obter a instância de obj_pergunta
nome_array = "P_gan_n" + string(global.nivel_atual);