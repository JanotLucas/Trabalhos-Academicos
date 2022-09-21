/*
 *  Carros Antigos - Problema de Lógica
 *  Cinco carros estão estacionados lado a lado(junto com os seus
 *  respectivos donos) numa exibição de carros antigos. Coloque o
 *  cérebro pra funcionar e use a lógica para associar os donos e as
 *  características aos carros antigos.
 *  São:
 *     05 colunas
 *     06 linhas
 *     19 instruções
 *Fonte: https://rachacuca.com.br/logica/problemas/carros-antigos/
 */

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fatos


%COR
cor(amarelo).
cor(azul).
cor(branco).
cor(verde).
cor(vermelho).

%ANO
ano(1950).
ano(1955).
ano(1960).
ano(1965).
ano(1970).

%MONTADORA
montadora(chevrolet).
montadora(ford).
montadora(mercedes).
montadora(porsche).
montadora(volkswagen).

%DONO
dono(aguiar).
dono(glenn).
dono(harley).
dono(ponce).
dono(thales).

%PLACA
placa('AAA-1111').
placa('BBB-2222').
placa('CCC-3333').
placa('DDD-4444').
placa('EEE-5555').

%KM
km('80 mil').
km('100 mil').
km('140 mil').
km('190 mil').
km('210 mil').

% Função ALLDIFFERENT - Garante que as variáveis na lista dever ter
% valores diferentes.

alldifferent([]). % define uma lista vazia
alldifferent([Elemento|Lista]) :-
    not(member(Elemento,Lista)), %Retorna TRUE se o elemento não for membro da lista
    alldifferent(Lista).

modelo([
    (   Cor_1, Ano_1, Montadora_1, Dono_1, Placa_1, KM_1),
    (   Cor_2, Ano_2, Montadora_2, Dono_2, Placa_2, KM_2),
    (   Cor_3, Ano_3, Montadora_3, Dono_3, Placa_3, KM_3),
    (   Cor_4, Ano_4, Montadora_4, Dono_4, Placa_4, KM_4),
    (   Cor_5, Ano_5, Montadora_5, Dono_5, Placa_5, KM_5)]) :-

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%INTRUÇÕES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


   % COR
   cor(Cor_1),
   cor(Cor_2),
   cor(Cor_3),
   cor(Cor_4),
   cor(Cor_5),

   %8
   (Cor_3 == verde),

   alldifferent([Cor_1,Cor_2,Cor_3,Cor_4,Cor_5]),

   % KM
   km(KM_1),
   km(KM_2),
   km(KM_3),
   km(KM_4),
   km(KM_5),

   %12

   (KM_1 == '210 mil'; KM_5 == '210 mil'),

   alldifferent([KM_1 , KM_2, KM_3, KM_4, KM_5]),

   %7

   ((Cor_1 == amarelo,(KM_2 == '140 mil';KM_3 == '140 mil';KM_4 == '140 mil';KM_5 == '140 mil'));
    (Cor_2 == amarelo,(KM_3 == '140 mil';KM_4 == '140 mil';KM_5 == '140 mil'));
    (Cor_3 == amarelo,(KM_4 == '140 mil';KM_5 == '140 mil'));
    (Cor_4 == amarelo, KM_5 == '140 mil')),

   %15

    ((Cor_1 == branco,(KM_2 == '100 mil';KM_3 == '100 mil';KM_4 == '100 mil';KM_5 == '100 mil'));
     (Cor_2 == branco,(KM_3 == '100 mil';KM_4 == '100 mil';KM_5 == '100 mil'));
     (Cor_3 == branco,(KM_4 == '100 mil';KM_5 == '100 mil'));
     (Cor_4 == branco, KM_5 == '100 mil')),

    %17

    ((Cor_1 == branco,(KM_2 == '140 mil';KM_3 == '140 mil';KM_4 == '140 mil';KM_5 == '140 mil'));
     (Cor_2 == branco,(KM_3 == '140 mil';KM_4 == '140 mil';KM_5 == '140 mil'));
     (Cor_3 == branco,(KM_4 == '140 mil';KM_5 == '140 mil'));
     (Cor_4 == branco, KM_5 == '140 mil')),

    %Dono
    dono(Dono_1),
    dono(Dono_2),
    dono(Dono_3),
    dono(Dono_4),
    dono(Dono_5),

    %4

    (Dono_1 == harley; Dono_5 == harley),

    alldifferent([Dono_1, Dono_2, Dono_3, Dono_4, Dono_5]),

    %2
    ((KM_1 == '140 mil',Dono_2 == glenn);
     (KM_2== '140 mil',Dono_3 == glenn);
     (KM_3 == '140 mil',Dono_4 == glenn);
     (KM_4 == '140 mil',Dono_5 == glenn)),

    %MONTADORA
    montadora(Montadora_1),
    montadora(Montadora_2),
    montadora(Montadora_3),
    montadora(Montadora_4),
    montadora(Montadora_5),

    alldifferent([Montadora_1, Montadora_2, Montadora_3, Montadora_4, Montadora_5]),

    %10
    ((Cor_1 == vermelho, (Montadora_2 == volkswagen;Montadora_3 == volkswagen;Montadora_4 == volkswagen;Montadora_5 == volkswagen));
     (Cor_2 == vermelho, (Montadora_3 == volkswagen;Montadora_4 == volkswagen;Montadora_5 == volkswagen));
     (Cor_3 == vermelho, (Montadora_4 == volkswagen;Montadora_5 == volkswagen));
     (Cor_4 == vermelho, Montadora_5 == volkswagen)),

    %11
    ((Montadora_1 == chevrolet, KM_2 == '140 mil');
     (Montadora_2 == chevrolet,(KM_1 == '140 mil';KM_3 == '140 mil'));
     (Montadora_3 == chevrolet,(KM_2 == '140 mil';KM_4 == '140 mil'));
     (Montadora_4 == chevrolet,(KM_3 == '140 mil';KM_5 == '140 mil'));
     (Montadora_5 == chevrolet, KM_4 == '140 mil')),

    %13

    ((Cor_2 == branco, KM_1 == '190 mil', (Montadora_3 == porsche;Montadora_4 == porsche;Montadora_5 == porsche));
     (Cor_3 == branco, (KM_1 == '190 mil';KM_2 == '190 mil'), (Montadora_4 == porsche;Montadora_5 == porsche));
     (Cor_4 == branco, (KM_1 == '190 mil';KM_2 == '190 mil';KM_3 == '190 mil'),Montadora_5 == porsche)),


   %PLACA
   placa(Placa_1),
   placa(Placa_2),
   placa(Placa_3),
   placa(Placa_4),
   placa(Placa_5),

   alldifferent([Placa_1,Placa_2,Placa_3,Placa_4,Placa_5]),

   %1
    ((Placa_2 == 'CCC-3333', Cor_1 = branco, (Placa_3 == 'DDD-4444';Placa_4 == 'DDD-4444';Placa_5 == 'DDD-4444'));
     (Placa_3 == 'CCC-3333',(Cor_1 = branco;Cor_2 = branco),(Placa_4 == 'DDD-4444';Placa_5 == 'DDD-4444'));
     (Placa_4 == 'CCC-3333',(Cor_1 = branco;Cor_2 = branco;Cor_2 = branco),Placa_5 == 'DDD-4444')),

    %14

    ((Placa_1 == 'AAA-1111',Montadora_2==mercedes);
     (Placa_2 == 'AAA-1111',Montadora_3==mercedes);
     (Placa_3 == 'AAA-1111',Montadora_4==mercedes);
     (Placa_4 == 'AAA-1111',Montadora_5==mercedes)),

     %16
     ((Dono_1 == ponce, Placa_1 == 'EEE-5555');
     (Dono_2 == ponce, Placa_2 == 'EEE-5555');
     (Dono_3 == ponce, Placa_3 == 'EEE-5555');
     (Dono_4 == ponce, Placa_4 == 'EEE-5555');
     (Dono_5 == ponce, Placa_5 == 'EEE-5555')),


   % ANO
   ano(Ano_1),
   ano(Ano_2),
   ano(Ano_3),
   ano(Ano_4),
   ano(Ano_5),

  alldifferent([Ano_1,Ano_2,Ano_3,Ano_4,Ano_5]),

  %3
  ((Ano_1 == 1960, KM_1 == '140 mil');
   (Ano_2 == 1960, KM_2 == '140 mil');
   (Ano_3 == 1960, KM_3 == '140 mil');
   (Ano_4 == 1960, KM_4 == '140 mil');
   (Ano_5 == 1960, KM_5 == '140 mil')),

  %5
  ((Cor_2 == branco,Montadora_1== ford,(Ano_3==1970;Ano_4==1970;Ano_5==1970));
   (Cor_3 == branco,(Montadora_1== ford;Montadora_2==ford),(Ano_4==1970;Ano_5==1970));
   (Cor_4 == branco,(Montadora_1== ford;Montadora_2==ford;Montadora_3==ford),Ano_5==1970)),


  %6
   ((Placa_1 == 'AAA-1111',Ano_2==1955);
    (Placa_2 == 'AAA-1111',Ano_3==1955);
    (Placa_3 == 'AAA-1111',Ano_4==1955);
    (Placa_4 == 'AAA-1111',Ano_5==1955)),

  %9
   ((Placa_2 == 'BBB-2222',Ano_1==1955);
    (Placa_3 == 'BBB-2222',Ano_2==1955);
    (Placa_4 == 'BBB-2222',Ano_3==1955);
    (Placa_5 == 'BBB-2222',Ano_4==1955)),

  %18
   ((Dono_2 == thales, Ano_1 == 1970, (Dono_3 == glenn;Dono_4 == glenn;Dono_5 == glenn));
    (Dono_3 == thales,(Ano_1 == 1970;Ano_2 == 1970);(Dono_4 == glenn;Dono_5== glenn));
    (Dono_4 == thales,(Ano_1 == 1970;Ano_2 == 1970;Ano_3==1970),Dono_5 == glenn)),

  %19
   ((Ano_1 == 1965, (Montadora_2== chevrolet;Montadora_3== chevrolet;Montadora_4== chevrolet;Montadora_5== chevrolet)),
    (Ano_2 == 1965, (Montadora_3== chevrolet;Montadora_4== chevrolet;Montadora_5== chevrolet)),
    (Ano_3 == 1965, (Montadora_4== chevrolet;Montadora_5== chevrolet)),
    (Ano_4 == 1965, Montadora_5== chevrolet)),

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




































