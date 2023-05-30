:- dynamic duda_possui/1.
:- dynamic local_duda/1.
:- dynamic banhado/0.
:- dynamic harold_kumar/0.

local_duda(patio).

acessivel(patio, lagoa).
acessivel(lagoa, casa).
acessivel(casa, floresta).
acessivel(floresta, galinheiro).
acessivel(casa, burger_shack).

no_local(chicken, floresta).
no_local(rede, casa).
no_local(burger, burger_shack).

iniciar :-
    local_duda(X),
    write('Duda esta em '), write(X), write('.'), nl,
    write('Objetivos:'), nl,
    write('1. Pegar a rede na casa.'), nl,
    write('2. Comer um burger no burger shack com Harold e Kumar.'), nl,
    write('3. Pegar a galinha na floresta.'), nl,
    write('4. Levar a galinha para o galinheiro.'), nl,
    write('Comandos: digite ajuda'), nl,
    random(0, 100, R),
    (R < 50 -> asserta(harold_kumar); true),
    rodar.

ajuda :-
    write('Mover: ir_para(lugar).'), nl,
    write('Tomar Banho: banhar.'), nl,
    write('Coletar Objetos: pegar(objeto).'), nl.

requisitos(chicken) :-
    duda_possui(rede).

ir_para(burger_shack) :-
    \+ harold_kumar,
    write('Você não pode ir para o burger shack sem encontrar Harold e Kumar na casa.'), nl.
ir_para(casa) :-
    \+ banhado,
    retract(local_duda(_)),
    asserta(local_duda(patio)),
    write('vc nao pode entrar na casa da dona Lurdes sem tomar banho. Duda voltou para o patio.'), nl.
ir_para(casa) :-
    harold_kumar,
    local_duda(Y),
    acessivel(Y, casa),
    retract(local_duda(Y)),
    asserta(local_duda(casa)),
    write('Duda esta em casa. Harold e Kumar estão aqui também!'), nl.
ir_para(X) :-
    local_duda(Y),
    acessivel(Y, X),
    retract(local_duda(Y)),
    asserta(local_duda(X)),
    write('Duda esta em '), write(X), write('.'), nl.

pegar(chicken) :-
    local_duda(Y),
    no_local(chicken, Y),
    \+ duda_possui(rede),
    write('Você nao tem a rede para pegar a galinha.'), nl.
pegar(X) :-
    local_duda(Y),
    no_local(X, Y),
    (requisitos(X) -> true; true),
    asserta(duda_possui(X)),
    write('Duda pegou '), write(X), write('.'), nl.

comer_burger :-
  duda_possui(burger),
  retract(duda_possui(burger)),
  finalizado_burger.

finalizado_burger :-
  local_duda(burger_shack),
  \+ duda_possui(burger),
  write('Duda comeu um burger no burger shack com Harold e Kumar!'), nl.

finalizado :-
  finalizado_burger,
  local_duda(galinheiro),
  duda_possui(chicken),
  write('Duda levou a galinha para o galinheiro!'), nl.

banhar :-
  local_duda(lagoa),
  asserta(banhado),
  write('Duda tomou banho na lagoa.'), nl.
banhar :-
  \+ local_duda(lagoa),
  write('Duda não está na lagoa para tomar banho.'), nl.

rodar :-
  finalizado,
  finalizado_burger,
  write('Fim do jogo!'), nl.
rodar :-
  \+ finalizado,
  \+ finalizado_burger,
  write('Digite uma acao: '),
  read(Acao),
  (call(Acao) -> true; write('Comando inválido.'), nl),
  rodar.