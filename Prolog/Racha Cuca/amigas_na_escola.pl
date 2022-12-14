/*
* Amigas na Escola - Problema de Lógica
* Neste problema, cinco amigas estão sentadas uma ao lado da outra na
* escola. Cada uma delas prefere tomar um suco, quer viajar para uma
* cidade e tem uma matéria favorita. Além disso, possuem uma mochila
* de cor diferente e gostam de uma animal cada uma. A partir das
* dicas, qual é a menina que tem garos como animal de estimação
* São:
*    05 colunas
*    06 linhas
*    22 instruções
*Fonte: https://rachacuca.com.br/logica/problemas/amigas-na-escola/
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fatos
%% O que a gente tem de base de dados?

        %MOCHILAS
        mochila(amarela).
        mochila(azul).
        mochila(preta).
        mochila(verde).
        mochila(vermelha).

        %NOME
        nome(ana).
        nome(jessica).
        nome(joana).
        nome(pati).
        nome(renata).

        %MATÉRIA
        materia(artes).
        materia(biologia).
        materia(historia).
        materia(matematica).
        materia(portugues).

        %ANIMAL
        animal(cachorro).
        animal(cavalo).
        animal(gato).
        animal(hamster).
        animal(passaro).


        %CIDADE
        cidade('fernando de noronha').
        cidade(recife).
        cidade(salvador).
        cidade(florianopolis).
        cidade('rio de janeiro').

        %SUCO
        suco(abacaxi).
        suco(laranja).
        suco(limao).
        suco(maracuja).
        suco(morango).


% Vamos estabelecemos uma regra com a função ALLDIFERENT
% podemos ter apenas um único resultado
% A restrição alldifferent garante que as variáveis ​​na lista devem
% ter valores diferentes

alldifferent([]).%define uma lista vazia (nenhum membro)
alldifferent([Elemento|Lista]) :-
    not(member(Elemento,Lista)),%retorna TRUE se o elemento NÃO for membro da lista
    alldifferent(Lista).

% Qual o modelo que a gente quer chegar?
modelo([
        (Mochila_1, Nome_1, Materia_1, Animal_1, Cidade_1, Suco_1),
        (Mochila_2, Nome_2, Materia_2, Animal_2, Cidade_2, Suco_2),
        (Mochila_3, Nome_3, Materia_3, Animal_3, Cidade_3, Suco_3),
        (Mochila_4, Nome_4, Materia_4, Animal_4, Cidade_4, Suco_4),
        (Mochila_5, Nome_5, Materia_5, Animal_5, Cidade_5, Suco_5)]) :-

% Vamos analisar cada uma das instruções do problema,
% sem seguir uma ordem pré-definida

%%%%%%%%%%%%%%%%%%%%%%%% Nome
nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),

%5 - Pati é a primeira da esquerda.
(Nome_1==pati),

%4 - Jéssica está exatamente à esquerda da Renata.
((Nome_1==jessica,Nome_2==renata);
(Nome_2==jessica,Nome_3==renata);
(Nome_3==jessica,Nome_4==renata);
(Nome_4==jessica,Nome_5==renata)),

alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

%%%%%%%%%%%%%%%%%%%%%%%% MATERIA
materia(Materia_1),
materia(Materia_2),
materia(Materia_3),
materia(Materia_4),
materia(Materia_5),

%6 - A menina mais à direita gosta de estudar Artes.
(Materia_5==artes),

%17 - A garota que senta exatamente à direita de quem gosta de História prefere Matemática.
((Materia_1==historia,Materia_2==matematica);
(Materia_2==historia,Materia_3==matematica);
(Materia_3==historia,Materia_4==matematica);
(Materia_4==historia,Materia_5==matematica)),

%21 - A menina que gosta de Biologia senta ao lado da que gosta de Português.
((Materia_1==biologia,Materia_2==portugues);
(Materia_2==biologia,(Materia_1==portugues;Materia_3==portugues));
(Materia_3==biologia,(Materia_2==portugues;Materia_4==portugues));
(Materia_4==biologia,(Materia_3==portugues;Materia_5==portugues));
(Materia_5==biologia,Materia_4==portugues)),

alldifferent([Materia_1, Materia_2, Materia_3, Materia_4, Materia_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Suco
suco(Suco_1),
suco(Suco_2),
suco(Suco_3),
suco(Suco_4),
suco(Suco_5),

%8 - A pessoa que gosta de suco de Limão está no meio.
(Suco_3==limao),

%18 - Quem gosta de suco de Laranja senta ao lado de quem gosta de suco de Maracujá.
((Suco_1==laranja,Suco_2==maracuja);
(Suco_2==laranja,(Suco_1==maracuja;Suco_3==maracuja));
(Suco_3==laranja,(Suco_2==maracuja;Suco_4==maracuja));
(Suco_4==laranja,(Suco_3==maracuja;Suco_5==maracuja));
(Suco_5==laranja,Suco_4==maracuja)),

%3 - O suco favorito de Ana é de Limão.
((Nome_1==ana,Suco_1==limao);
(Nome_2==ana,Suco_2==limao);
(Nome_3==ana,Suco_3==limao);
(Nome_4==ana,Suco_4==limao);
(Nome_5==ana,Suco_5==limao)),

%1 - Joana gosta de suco de Abacaxi.
((Nome_1==joana,Suco_1==abacaxi);
(Nome_2==joana,Suco_2==abacaxi);
(Nome_3==joana,Suco_3==abacaxi);
(Nome_4==joana,Suco_4==abacaxi);
(Nome_5==joana,Suco_5==abacaxi)),

alldifferent([Suco_1, Suco_2, Suco_3, Suco_4, Suco_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Mochila
mochila(Mochila_1),
mochila(Mochila_2),
mochila(Mochila_3),
mochila(Mochila_4),
mochila(Mochila_5),

%14 - A primeira menina da esquerda usa uma mochila Amarela.
(Mochila_1==amarela),

%9 - A mochila da Jéssica é Verde.
((Nome_1==jessica,Mochila_1==verde);
(Nome_2==jessica,Mochila_2==verde);
(Nome_3==jessica,Mochila_3==verde);
(Nome_4==jessica,Mochila_4==verde);
(Nome_5==jessica,Mochila_5==verde)),

alldifferent([Mochila_1, Mochila_2, Mochila_3, Mochila_4, Mochila_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Cidade
cidade(Cidade_1),
cidade(Cidade_2),
cidade(Cidade_3),
cidade(Cidade_4),
cidade(Cidade_5),

%10 - A menina exatamente à esquerda da do meio viajará Florianópolis.
(Cidade_2==florianopolis),

%11 - Quem quer viajar pra Recife tem a mochila Amarela.
((Mochila_1==amarela,Cidade_1==recife);
(Mochila_2==amarela,Cidade_2==recife);
(Mochila_3==amarela,Cidade_3==recife);
(Mochila_4==amarela,Cidade_4==recife);
(Mochila_5==amarela,Cidade_5==recife)),

%12 - A menina que gosta do suco de Abacaxi senta ao lado da que viajará para Fernando de Noronha.
((Cidade_1=='fernando de noronha',Suco_2==abacaxi);
(Cidade_2=='fernando de noronha',(Suco_1==abacaxi;Suco_3==abacaxi));
(Cidade_3=='fernando de noronha',(Suco_4==abacaxi;Suco_2==abacaxi));
(Cidade_4=='fernando de noronha',(Suco_5==abacaxi;Suco_3==abacaxi));
(Cidade_5=='fernando de noronha',Suco_4==abacaxi)),

%13 - A dona da mochila Vermelha vai viajar para Fernando de Noronha.
((Mochila_1==vermelha,Cidade_1=='fernando de noronha');
(Mochila_2==vermelha,Cidade_2=='fernando de noronha');
(Mochila_3==vermelha,Cidade_3=='fernando de noronha');
(Mochila_4==vermelha,Cidade_4=='fernando de noronha');
(Mochila_5==vermelha,Cidade_5=='fernando de noronha')),

%19 - Viajará para o Rio de Janeiro a menina que tem a mochila Preta.
((Mochila_1==preta,Cidade_1=='rio de janeiro');
(Mochila_2==preta,Cidade_2=='rio de janeiro');
(Mochila_3==preta,Cidade_3=='rio de janeiro');
(Mochila_4==preta,Cidade_4=='rio de janeiro');
(Mochila_5==preta,Cidade_5=='rio de janeiro')),

%22 - Jéssica viajará para Salvador nas férias.
((Nome_1==jessica,Cidade_1==salvador);
(Nome_2==jessica,Cidade_2==salvador);
(Nome_3==jessica,Cidade_3==salvador);
(Nome_4==jessica,Cidade_4==salvador);
(Nome_5==jessica,Cidade_5==salvador)),

alldifferent([Cidade_1, Cidade_2, Cidade_3, Cidade_4, Cidade_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Animal
animal(Animal_1),
animal(Animal_2),
animal(Animal_3),
animal(Animal_4),
animal(Animal_5),

alldifferent([Animal_1, Animal_2, Animal_3, Animal_4, Animal_5]),

%2 - A menina que tem Hamsters gosta de estudar Artes.
((Animal_1==hamster,Materia_1==artes);
(Animal_2==hamster,Materia_2==artes);
(Animal_3==hamster,Materia_3==artes);
(Animal_4==hamster,Materia_4==artes);
(Animal_5==hamster,Materia_5==artes)),

%7 - Quem toma suco de Laranja gosta de Cavalos.
((Animal_1==cavalo,Suco_1==laranja);
(Animal_2==cavalo,Suco_2==laranja);
(Animal_3==cavalo,Suco_3==laranja);
(Animal_4==cavalo,Suco_4==laranja);
(Animal_5==cavalo,Suco_5==laranja)),

%15 - A menina da mochila Azul tem Cachorros.
((Animal_1==cachorro,Mochila_1==azul);
(Animal_2==cachorro,Mochila_2==azul);
(Animal_3==cachorro,Mochila_3==azul);
(Animal_4==cachorro,Mochila_4==azul);
(Animal_5==cachorro,Mochila_5==azul)),

%16 - Quem gosta de Biologia senta ao lado da menina que tem Hamsters.
((Animal_1==hamster,Materia_2==biologia);
(Animal_2==hamster,(Materia_1==biologia;Materia_3==biologia));
(Animal_3==hamster,(Materia_2==biologia;Materia_4==biologia));
(Animal_4==hamster,(Materia_3==biologia;Materia_5==biologia));
(Animal_5==hamster,Materia_4==biologia)),

%20 - A garota que gosta de suco de Morango tem Pássaros como animal de estimação.
((Suco_1==morango,Animal_1==passaro);
(Suco_2==morango,Animal_2==passaro);
(Suco_3==morango,Animal_3==passaro);
(Suco_4==morango,Animal_4==passaro);
(Suco_5==morango,Animal_5==passaro)),


nl,%insere uma nova linha (coloca o cursor no início da linha de baixo)
write('CHEGAMOS AO FIM DO MODELO')
.% fechando o modelo

%%%%%%%%%%%%%%%%%%%%%%%% Imprimindo a lista
imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
	write('\n......................................\n'),
	write(H), write(' : '),
              imprime_lista(T).

/**********************************************************/
%% main fornece ponto de entrada para scripts
main :-
   %% statistics mostra informações sobre o uso de recursos
   %% Obtém o tempo inicial baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime,Tempo_inicial),

    %%chama modelo
    %% lembrando que modelo foi definido como:
    %%  modelo([
    %%     (Mochila_1, Nome_1, Matéria_1, Animal_1, Cidade_1, Suco_1),
    %%     (Mochila_2, Nome_2, Matéria_2, Animal_2, Cidade_2, Suco_2),
    %%     (Mochila_3, Nome_3, Matéria_3, Animal_3, Cidade_3, Suco_3),
    %%     (Mochila_4, Nome_4, Matéria_4, Animal_4, Cidade_4, Suco_4),
    %%     (Mochila_5, Nome_5, Matéria_5, Animal_5, Cidade_5, Suco_5),
    %%  ])

    modelo(  [Coluna1, Coluna2, Coluna3, Coluna4,Coluna5]),

    %%chama imprime_lista
    imprime_lista(  [Coluna1, Coluna2, Coluna3, Coluna4, Coluna5] ),

    %% Obtém o tempo final baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime ,Tempo_final),
    Tempo_BUSCA is Tempo_final - Tempo_inicial,

    %%define o formato do tempo na saída
    format('\n Tempo inicial: ~f \t Tempo final: ~f  msec', [Tempo_inicial, Tempo_final]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.
main :-

    nl,
    write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
    nl,
    write('........ UFA apos o fail .......').





















































