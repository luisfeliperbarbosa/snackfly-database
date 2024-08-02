Criação de Banco de Dados para o projeto de faculdade "SnackFly".
===

Modelagem Conceitual
---

Quando eu comecei o processo de modelagem conceitual tive uma certa dificuldade em compreender com precisão cada funcionalidade do sistema e onde cada coisa se encaixava, tive que olhar para as outras partes do desenvolvimento para me situar melhor. 
Muitas coisas foram mudando antes de estar do jeito atual mas nada muito difícil já que essa primeira parte é mais fácil, comecei listando todas as entidades que eu consegui identificar e depois seus atributos. 
Os atributos que estão na bolinha roxa são as chaves estrangeiras da tabela. Olhando em retrospecto eu deveria tomar mais cuidado com a nomenclatura de cada atributo e entidade para evitar problemas futuros, já que depois eu tive que mudar tudo aos poucos.
---

Modelagem Física e DDL

Com minha modelagem conceitual pronta eu comecei a modelagem física, no começo eu não sabia muito bem onde eu poderia fazer mas achei uma ferramenta MUITO interessante chamada dbdiagrama.io, lá eu pude "codar" todas as tabelas, os tipos de dados e ter um feedback visual simultaneamente. Criar as tabelas foi a parte fácil, o que demorou um pouco mais foram seus relacionamentos, onde eu tive que parar e pensar bem em cada coisa e conversar com o resto da equipe sobre. No final chegamos em um resultado agradável e que funcionava dentro da plataforma, agora era preciso passar tudo para o banco de fato, o dbdiagram possui uma funcionalidade muito legal de importar para o banco de sua escolha então essa etapa foi bem fácil, só precisei corrigir alguns bugs por falta de organização mas nada muito complicado.
---

Procedures

Essa foi com certeza a parte mais complexa, onde precisei voltar e corrigir algumas coisas, foi aqui onde percebi alguns erros da minha própria modelagem. Eu nunca tinha de fato usado stored procedures e nem diversos comandos que aprendi durante sua criação, então eu
demorei bastante até, aqui foi essencial minha comunicação com o resto da equipe, gastamos boas horas pensando em como desenvolver uma lógica que funcionasse e chegamos num resultado agradável também. Fiz muito uso de Junção de tabelas e lógica de programação aprendi novas funções dentro do próprio MySQL. Fizemos um total de 15 procedures para cada feature disponível.
