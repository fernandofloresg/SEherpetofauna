%PROTOTIPOS DE PREGUNTAS
esrespuesta('si').
esrespuesta('no').
%PARA Tortugas
espregunta('Lobulo posterior de plastron fijo?',X):-esrespuesta(X).
espregunta('Escama nasal dividida?',X):-esrespuesta(X).
%Segunda RAMA
espregunta('Escamas alrededor de la parte media del cuerpo perfectamente lisas, cicloides y de tamaño similar?',X):-esrespuesta(X).
espregunta('Frontonasal presente, pliegue lateral bien desarrollado?',X):-esrespuesta(X).
espregunta('Segundo par de escudos geniales separados por una escama?',X):-esrespuesta(X).

%MOSCA BLANCA
espregunta('se ubica en el enves de la hoja ?',X):-esrespuesta(X).
espregunta('tiene presencia de hojas picadas?',X):-esrespuesta(X).
espregunta('tiene presencia de hongos ?',X):-esrespuesta(X).
espregunta('tiene secreciones melosas ?',X):-esrespuesta(X).
%POLILLA
espregunta('tiene las hojas comidas?',X):-esrespuesta(X).
espregunta('tiene brotes comidas?',X):-esrespuesta(X).
espregunta('tiene la medula de tallo destruida ?',X):-esrespuesta(X).
espregunta('tiene el follaje destruida ?',X):-esrespuesta(X).
%PULGONES
espregunta('presenta las yemas caidas ?',X):-esrespuesta(X).
espregunta('presenta frutos peque�os?',X):-esrespuesta(X).
espregunta('presenta brotes muertos',X):-esrespuesta(X).
espregunta('son brotes peque�os?',X):-esrespuesta(X).
espregunta('presenta huevecillos?',X):-esrespuesta(X).
espregunta('baja produccion de vainas?',X):-esrespuesta(X).
espregunta('tiene las vainas encurvadas ?',X):-esrespuesta(X).
espregunta('tiene las hojas encrespadas?',X):-esrespuesta(X).
espregunta('vainas con peso normal?',X):-esrespuesta(X).
espregunta('vainas con tama�o normal?',X):-esrespuesta(X).
espregunta('presenta ceniza blanca en hojas?',X):-esrespuesta(X).
espregunta('enegrecimiento de brotes?',X):-esrespuesta(X).
espregunta('enegrecimiento de flores?',X):-esrespuesta(X).
espregunta('enegrecimiento de frutos?',X):-esrespuesta(X).
%ACARINA
espregunta('tiene manchas blanquesinas ?',X):-esrespuesta(X).
espregunta('tiene las hojas secas ?',X):-esrespuesta(X).
espregunta('tiene perdida de hojas?',X):-esrespuesta(X).
%CHINCHES
espregunta('tiene las hojas picadas?',X):-esrespuesta(X).
espregunta('tiene las hojas encojidas?',X):-esrespuesta(X).
%MOSCA MINADORA

espregunta('tiene las hojas minadas?',X):-esrespuesta(X).

%QUEREZA
espregunta('presenta larvas blancas?',X):-esrespuesta(X).
espregunta('la larva es alargada?',X):-esrespuesta(X).
espregunta('se encuentra en las vainas?',X):-esrespuesta(X).
espregunta('la larva es peque�a?',X):-esrespuesta(X).
espregunta('la larva es grande?',X):-esrespuesta(X).
espregunta('se encuentra en las ramas?',X):-esrespuesta(X).
espregunta('se encuentra  en los tallos?',X):-esrespuesta(X).

%PRINCIPAL
espregunta('Provisto de concha ósea que cubre el lomo ?',X):-esrespuesta(X).

main:-
        new(D,dialog('SISTEMA EXPERTO DE REPTILES DEL VALLE DE MEXICO')),
        send(D,size,size(560,400)),
        send(D,colour,colour(red)),
        send(D, append, new(Menu, menu_bar)),
        send(Menu, append, new(Iniciar, popup(iniciar))),
        send(Menu, append, new(Ayuda, popup(ayuda))),
        send_list(Iniciar, append,
                         [ menu_item(iniciar, message(@prolog,pp))
                         ]),
        send_list(Ayuda, append,
                         [ menu_item(autor, message(@display, inform, 'rolandopalermo.blogspot.com'))
                         ]),
        mostrar('C:/Programa/talla.bmp',D,Menu),
        send(D,open,point(200,200)).

halt.qsave_program('c:/ejecutable.exe', [stand_alone(true), goal(main)]).

mostrar(V,D,M):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D1,below(M)).

pp:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('Provisto de concha ósea que cubre el lomo ?')),
       send_list(Pre1,append,[si , no]),
          send(D,append(Pre1)),

      new(B,button(siguiente,and(message(@prolog,principal,Pre1?selection),message(D,destroy)))),
      send(D,append,B),
      send(D,default_button,siguiente),
        send(D,open,point(350,350)).



%PARA Tortugas
principal(P1):-
espregunta('Provisto de concha ósea que cubre el lomo ?',P1),P1='si',
pc.

principal(P1):-
espregunta('Provisto de concha ósea que cubre el lomo ?',P1),P1='no',
ph.


principal(_,_,_):-new(D,dialog('ERROR')),
new(L,label(l,'ELIJA SOLO UNA OPCION',font('times','roman',16))),
send(D,append,L),
send(D,open,point(350,350)).

%PANTALLA DE TORTUGAS
pc:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('Lobulo posterior de plastron fijo?')),
       send_list(Pre1,append,[si , no]),
        new(Pre2,menu('Escama nasal dividida?')),
        send_list(Pre2,append,[si,no]),
       send(D,append(Pre1)),
       send(D,append(Pre2)),
       new(B1,button(atras,and(message(@prolog,pp),message(D,destroy)))),
                new(B,button(siguiente,message(@prolog,tortugas,Pre1?selection,Pre2?selection))),
        send(D,append,B1),
      send(D,append,B),
        send(D,open,point(300,300)).

%Kinosternon herrerai
tortugas(P1,P2):-
  espregunta('Lobulo posterior de plastron fijo?',P1),P1='si',
  espregunta('Escama nasal dividida?',P2),P2='no',
  pf1('./SEherpetofauna/imagenes/Kinosternon-herrerai.jpg','CHINCHES','./SEherpetofauna/imagenes/Kinosternon-herrerai.jpg').

%Kinosternon hirtipes
tortugas(P1,P2):-
  espregunta('Lobulo posterior de plastron fijo?',P1),P1='no',
  espregunta('Escama nasal dividida?',P2),P2='si',
  pf1('./SEherpetofauna/imagenes/Kinosternon hirtipes.jpg','CHINCHES','./SEherpetofauna/imagenes/Kinosternon hirtipes.jpg').

%Kinosternon integrum
tortugas(P1,P2):-
  espregunta('Lobulo posterior de plastron fijo?',P1),P1='no',
  espregunta('Escama nasal dividida?',P2),P2='no',
  pf1('./SEherpetofauna/imagenes/Kinosternon integrum.jpg','CHINCHES','./SEherpetofauna/imagenes/Kinosternon integrum.jpg').

  tortugas(_,_):-new(D,dialog('ERROR')),
  new(L,label(l,'ESPECIE NO DETERMINADA',font('times','roman',16))),
  send(D,append,L),
  send(D,open,point(350,350)).

ph:-new(D,dialog('PREGUNTAS')),
          new(Pre1,menu('Escamas alrededor de la parte media del cuerpo perfectamente lisas, cicloides y de tamaño similar?')),
         send_list(Pre1,append,[si , no]),
            send(D,append(Pre1)),
            new(B1,button(atras,and(message(@prolog,pp),message(D,destroy)))),
        new(B,button(siguiente,and(message(@prolog,barisia,Pre1?selection),message(D,destroy)))),
        send(D,append,B),
        send(D,default_button,siguiente),
          send(D,open,point(350,350)).

  %Segunda división
  barisia(P1):-
  espregunta('Escamas alrededor de la parte media del cuerpo perfectamente lisas, cicloides y de tamaño similar?',P1),P1='si',
  pb.

  barisia(P1):-
  espregunta('Escamas alrededor de la parte media del cuerpo perfectamente lisas, cicloides y de tamaño similar?',P1),P1='no',
  pescamasdorso.


  barisia(_,_):-new(D,dialog('ERROR')),
  new(L,label(l,'ELIJA SOLO UNA OPCION',font('times','roman',16))),
  send(D,append,L),
  send(D,open,point(350,350)).

pb:-new(D,dialog('PREGUNTAS')),
    new(Pre1,menu('Frontonasal presente, pliegue lateral bien desarrollado?')),
    send_list(Pre1,append,[si , no]),
    new(Pre2,menu('Segundo par de escudos geniales separados por una escama?')),
    send_list(Pre2,append,[si,no]),
    send(D,append(Pre1)),
    send(D,append(Pre2)),
    new(B1,button(atras,and(message(@prolog,pp),message(D,destroy)))),
            new(B,button(siguiente,message(@prolog,fronto,Pre1?selection,Pre2?selection))),
    send(D,append,B1),
    send(D,append,B),
    send(D,open,point(300,300)).

    %Abronia deppii
    fronto(P1,P2):-
    espregunta('Frontonasal presente, pliegue lateral bien desarrollado?',P1),P1='si',
    espregunta('Segundo par de escudos geniales separados por una escama?',P2),P2='no',
    pf1('./SEherpetofauna/imagenes/Abronia deppii.jpg','CHINCHES','./SEherpetofauna/imagenes/Abronia deppii.jpg').

    %Barisia imbricata
    fronto(P1,P2):-
    espregunta('Frontonasal presente, pliegue lateral bien desarrollado?',P1),P1='no',
    espregunta('Segundo par de escudos geniales separados por una escama?',P2),P2='si',
    pf1('./SEherpetofauna/imagenes/Barisia imbricata.jpg','CHINCHES','./SEherpetofauna/imagenes/Barisia imbricata.jpg').

    %Barisia herrerae
    fronto(P1,P2):-
    espregunta('Frontonasal presente, pliegue lateral bien desarrollado?',P1),P1='no',
    espregunta('Segundo par de escudos geniales separados por una escama?',P2),P2='si',
    pf1('./SEherpetofauna/imagenes/Barisia herrerae.jpg','CHINCHES','./SEherpetofauna/imagenes/Barisia herrerae.jpg').

    fronto(_,_):-new(D,dialog('ERROR')),
    new(L,label(l,'ESPECIE NO DETERMINADA',font('times','roman',16))),
    send(D,append,L),
    send(D,open,point(350,350)).


image(X):-new(D,dialog('PLAGA')),
        mostrar1(X,D),
%       new(B,label(salir,message(D,destroy))),
        %send(D,append,B),
        send(D,open).




mostrar1(V,D):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1).



pf1(X,Y,Z):-new(D,dialog('IMAGEN DE LA PLAGA')),
          mostrar2(X,D,20,30),
         send(D, append(label(n,'INSECTOS'))),
         send(D, append(label(n,Y))),
         mostrar2(Z,D,20,350),
         send(D,open).

f1(X,Y):-new(F,frame('IMAGEN DE LA PLAGA')),
  send(F,append(new(F1,browser))),
   mostrar(X,F1),
   send(new(D,dialog),below(F1)),
   send(D, append(label(n,'INSECTOS'))),
   send(D, append(label(n,Y))),


   send(F,open,point(300,300)).


pf2(X,Y,Z):-new(D,dialog('IMAGEN DE LA PLAGA')),
          mostrar2(X,D,20,40),
          new(L,label(n,'TRATAMIENTO')),
         send(D, append(label(n,'ACARO'))),
         send(D, append(label(n,Y))),
         send(D,append,L),
          mostrar2(Z,D,20,350),
         send(D,open).

f2(X,Y):-new(F,frame('IMAGEN DE LA PLAGA')),
  send(F,append(new(F1,browser))),
   mostrar(X,F1),
   send(new(D,dialog),below(F1)),
   send(D, append(label(n,'ACARO'))),
   send(D, append(label(n,Y))),

   send(F,open,point(300,300)).

pf3(X,Y,Z):-new(D,dialog('IMAGEN DE LA PLAGA')),
          mostrar2(X,D,20,30),
           new(L,label(n,'TRATAMIENTO')),
          send(D, append(label(n,'INSECTO'))),
    send(D, append(label(n,'QUEREZA'))),
         send(D, append(label(n,Y))),
          send(D,append,L),
           mostrar2(Z,D,20,350),
         send(D,open).

f3(X,Y):-new(F,frame('IMAGEN DE LA PLAGA')),
  send(F,append(new(F1,browser))),
   mostrar(X,F1),
   send(new(D,dialog),below(F1)),
   send(D, append(label(n,'INSECTO'))),
    send(D, append(label(n,'QUEREZA'))),
   send(D, append(label(n,Y))),

   send(F,open,point(300,300)).

mostrar(V,D):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1).

mostrar2(V,D,X,Y):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D,display,D1,point(X,Y)).
