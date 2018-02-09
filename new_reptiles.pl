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

%Tercer RAMA
espregunta('Escamas ventrales grandes, cuadrangulares, en ocho series longitudinales?',X):-esrespuesta(X).
espregunta('Cabeza con una serie de espinas oseas en la parte posterior?',X):-esrespuesta(X).
espregunta('Con bolsa posfemoral?',X):-esrespuesta(X).

%Cuarta rama divisoria
espregunta('Con dos escamas postrostrales?',X):-esrespuesta(X).

%Escamas nucales
espregunta('Escamas nucales laterales mas pequeñas y bien diferenciadas de las escamas nucales dorsales?',X):-esrespuesta(X).
espregunta('La LHC en los adultos no sobrepasa los 61mm?',X):-esrespuesta(X).
espregunta('Region dorsal con 6 lineas transversales paralelas sobre un campo oscuro, con manchas oscuras en la ingle?',X):-esrespuesta(X).
espregunta('Posee una escama cantal?',X):-esrespuesta(X).
espregunta('Machos con el vientre de color gris oscuro, con manchas en forma de barra sobre la garganta y lados del abdomen?',X):-esrespuesta(X).

%Con collar completo
espregunta('Con collar completo en la region de la nuca de color oscuro, bordeado por lineas claras?',X):-esrespuesta(X).
espregunta('Escamas supraoculares en una sola serie, no divididas; color dorsal del cuerpo gris oscuro, sin puntos claros?',X):-esrespuesta(X).
espregunta('Escamas dorsales 31 o menos; cola sin bandas de igual amplitud, alternadas de color claro y negro?',X):-esrespuesta(X).

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
                         [ menu_item(autores, message(@display, inform, 'Edgar Espinosa Ordoñes, Fernando Flores, Mario Ivan Moreno Perez'))
                         ]),
        mostrar('C:/Programa/rep1.jpg',D,Menu),
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
        new(Pre1,menu('Provisto de concha osea que cubre el lomo ?')),
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
  pf1('./SEherpetofauna/imagenes/Kinosternon herrerai.jpg',' ','./SEherpetofauna/imagenes/Kinosternon herrerai.jpg').


%Kinosternon hirtipes
tortugas(P1,P2):-
  espregunta('Lobulo posterior de plastron fijo?',P1),P1='no',
  espregunta('Escama nasal dividida?',P2),P2='si',
  pf1('./SEherpetofauna/imagenes/Kinosternon hirtipes.jpg',' ','./SEherpetofauna/imagenes/Kinosternon hirtipes.jpg').

%Kinosternon integrum
tortugas(P1,P2):-
  espregunta('Lobulo posterior de plastron fijo?',P1),P1='no',
  espregunta('Escama nasal dividida?',P2),P2='no',
  pf1('./SEherpetofauna/imagenes/Kinosternon integrum.jpg',' ','./SEherpetofauna/imagenes/Kinosternon integrum.jpg').

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
  pescamasventrales.


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
    new(B1,button(atras,and(message(@prolog,ph),message(D,destroy)))),
            new(B,button(siguiente,message(@prolog,fronto,Pre1?selection,Pre2?selection))),
    send(D,append,B1),
    send(D,append,B),
    send(D,open,point(300,300)).

    %Abronia deppii
    fronto(P1,P2):-
    espregunta('Frontonasal presente, pliegue lateral bien desarrollado?',P1),P1='si',
    espregunta('Segundo par de escudos geniales separados por una escama?',P2),P2='no',
    pf1('./SEherpetofauna/imagenes/Abronia deppii.jpg',' ','./SEherpetofauna/imagenes/Abronia deppii.jpg').

    %Barisia imbricata
    fronto(P1,P2):-
    espregunta('Frontonasal presente, pliegue lateral bien desarrollado?',P1),P1='no',
    espregunta('Segundo par de escudos geniales separados por una escama?',P2),P2='si',
    pf1('./SEherpetofauna/imagenes/Barisia imbricata.jpg',' ','./SEherpetofauna/imagenes/Barisia imbricata.jpg').

    %Barisia herrerae
    fronto(P1,P2):-
    espregunta('Frontonasal presente, pliegue lateral bien desarrollado?',P1),P1='no',
    espregunta('Segundo par de escudos geniales separados por una escama?',P2),P2='si',
    pf1('./SEherpetofauna/imagenes/Barisia herrerae.jpg',' ','./SEherpetofauna/imagenes/Barisia herrerae.jpg').

    fronto(_,_):-new(D,dialog('ERROR')),
    new(L,label(l,'ESPECIE NO DETERMINADA',font('times','roman',16))),
    send(D,append,L),
    send(D,open,point(350,350)).

pescamasventrales:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('Escamas ventrales grandes, cuadrangulares, en ocho series longitudinales?')),
        send_list(Pre1,append,[si , no]),
        new(Pre2,menu('Cabeza con una serie de espinas oseas en la parte posterior?')),
        send_list(Pre2,append,[si,no]),
        new(Pre3,menu('Con bolsa posfemoral?')),
        send_list(Pre3,append,[si,no]),
        send(D,append(Pre1)),
        send(D,append(Pre2)),
        send(D,append(Pre3)),
        new(B1,button(atras,and(message(@prolog,ph),message(D,destroy)))),
                new(B,button(siguiente,message(@prolog,ventrales,Pre1?selection,Pre2?selection,Pre3?selection))),
        send(D,append,B1),
        send(D,append,B),
        send(D,open,point(300,300)).


        %Aspidoscelis gularis.
        ventrales(P1,P2,P3):-
        espregunta('Escamas ventrales grandes, cuadrangulares, en ocho series longitudinales?',P1),P1='si',
        espregunta('Cabeza con una serie de espinas oseas en la parte posterior?',P2),P2='no',
        espregunta('Con bolsa posfemoral?',P3),P3='no',
        pf1('./SEherpetofauna/imagenes/Aspidoscelis gularis.jpg',' ','./SEherpetofauna/imagenes/Aspidoscelis gularis.jpg').

        %Phrynosoma orbiculare.
        ventrales(P1,P2,P3):-
        espregunta('Escamas ventrales grandes, cuadrangulares, en ocho series longitudinales?',P1),P1='no',
        espregunta('Cabeza con una serie de espinas oseas en la parte posterior?',P2),P2='si',
        espregunta('Con bolsa posfemoral?',P3),P3='no',
        pf1('./SEherpetofauna/imagenes/Phrynosoma orbiculare.jpg',' ','./SEherpetofauna/imagenes/Phrynosoma orbiculare.jpg').

        %Sceloporus parvus.
        ventrales(P1,P2,P3):-
        espregunta('Escamas ventrales grandes, cuadrangulares, en ocho series longitudinales?',P1),P1='no',
        espregunta('Cabeza con una serie de espinas oseas en la parte posterior?',P2),P2='no',
        espregunta('Con bolsa posfemoral?',P3),P3='si',
        pf1('./SEherpetofauna/imagenes/Sceloporus parvus.jpg',' ','./SEherpetofauna/imagenes/Sceloporus parvus.jpg').

        %Siguiente rama
        ventrales(P1,P2,P3):-
        espregunta('Escamas ventrales grandes, cuadrangulares, en ocho series longitudinales?',P1),P1='no',
        espregunta('Cabeza con una serie de espinas oseas en la parte posterior?',P2),P2='no',
        espregunta('Con bolsa posfemoral?',P3),P3='no',
        postros.

        ventrales(_,_,_):-new(D,dialog('ERROR')),
        new(L,label(l,'ESPECIE NO DETERMINADA',font('times','roman',16))),
        send(D,append,L),
        send(D,open,point(350,350)).

postros:-new(D,dialog('PREGUNTAS')),
                  new(Pre1,menu('Con dos escamas postrostrales?')),
                 send_list(Pre1,append,[si , no]),
                    send(D,append(Pre1)),
                    new(B1,button(atras,and(message(@prolog,pescamasventrales),message(D,destroy)))),
                new(B,button(siguiente,and(message(@prolog,postros17,Pre1?selection),message(D,destroy)))),
                send(D,append,B),
                send(D,default_button,siguiente),
                  send(D,open,point(350,350)).

          %Segunda divisiónespregunta('',X):-esrespuesta(X).
          postros17(P1):-
          espregunta('Con dos escamas postrostrales?',P1),P1='si',
          nucales.

          postros17(P1):-
          espregunta('Con dos escamas postrostrales?',P1),P1='no',
          collares.


          postros17(_,_):-new(D,dialog('ERROR')),
          new(L,label(l,'ELIJA SOLO UNA OPCION',font('times','roman',16))),
          send(D,append,L),
          send(D,open,point(350,350)).


nucales:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('Escamas nucales laterales mas pequeñas y bien diferenciadas de las escamas nucales dorsales?')),
        send_list(Pre1,append,[si , no]),
        new(Pre2,menu('La LHC en los adultos no sobrepasa los 61mm?')),
        send_list(Pre2,append,[si,no]),
        new(Pre3,menu('Region dorsal con 6 lineas transversales paralelas sobre un campo oscuro, con manchas oscuras en la ingle?')),
        send_list(Pre3,append,[si,no]),
        new(Pre4,menu('Posee una escama cantal?')),
        send_list(Pre4,append,[si,no]),
        new(Pre5,menu('Machos con el vientre de color gris oscuro, con manchas en forma de barra sobre la garganta y lados del abdomen?')),
        send_list(Pre5,append,[si,no]),
        send(D,append(Pre1)),
        send(D,append(Pre2)),
        send(D,append(Pre3)),
        send(D,append(Pre4)),
        send(D,append(Pre5)),
        new(B1,button(atras,and(message(@prolog,postros),message(D,destroy)))),
                new(B,button(siguiente,message(@prolog,laterales,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection,Pre5?selection))),
        send(D,append,B1),
        send(D,append,B),
        send(D,open,point(300,300)).


        %Sceloporus anahuacus.
        laterales(P1,P2,P3,P4,P5):-
        espregunta('Escamas nucales laterales mas pequeñas y bien diferenciadas de las escamas nucales dorsales?',P1),P1='si',
        espregunta('La LHC en los adultos no sobrepasa los 61mm?',P2),P2='si',
        espregunta('Region dorsal con 6 lineas transversales paralelas sobre un campo oscuro, con manchas oscuras en la ingle?',P3),P3='si',
        espregunta('Posee una escama cantal?',P4),P4='no',
        espregunta('Machos con el vientre de color gris oscuro, con manchas en forma de barra sobre la garganta y lados del abdomen?',P5),P5='no',
        pf1('./SEherpetofauna/imagenes/Sceloporus anahuacus.jpg',' ','./SEherpetofauna/imagenes/Sceloporus anahuacus.jpg').

        %Sceloporus palaciosi.
        laterales(P1,P2,P3,P4,P5):-
        espregunta('Escamas nucales laterales mas pequeñas y bien diferenciadas de las escamas nucales dorsales?',P1),P1='si',
        espregunta('La LHC en los adultos no sobrepasa los 61mm?',P2),P2='si',
        espregunta('Region dorsal con 6 lineas transversales paralelas sobre un campo oscuro, con manchas oscuras en la ingle?',P3),P3='no',
        espregunta('Posee una escama cantal?',P4),P4='no',
        espregunta('Machos con el vientre de color gris oscuro, con manchas en forma de barra sobre la garganta y lados del abdomen?',P5),P5='no',
        pf1('./SEherpetofauna/imagenes/Sceloporus palaciosi.jpg',' ','./SEherpetofauna/imagenes/Sceloporus palaciosi.jpg').

        %Sceloporus grammicus.
        laterales(P1,P2,P3,P4,P5):-
        espregunta('Escamas nucales laterales mas pequeñas y bien diferenciadas de las escamas nucales dorsales?',P1),P1='si',
        espregunta('La LHC en los adultos no sobrepasa los 61mm?',P2),P2='no',
        espregunta('Region dorsal con 6 lineas transversales paralelas sobre un campo oscuro, con manchas oscuras en la ingle?',P3),P3='no',
        espregunta('Posee una escama cantal?',P4),P4='no',
        espregunta('Machos con el vientre de color gris oscuro, con manchas en forma de barra sobre la garganta y lados del abdomen?',P5),P5='no',
        pf1('./SEherpetofauna/imagenes/Sceloporus grammicus.jpg',' ','./SEherpetofauna/imagenes/Sceloporus grammicus.jpg').

        %Sceloporus aeneus.
        laterales(P1,P2,P3,P4,P5):-
        espregunta('Escamas nucales laterales mas pequeñas y bien diferenciadas de las escamas nucales dorsales?',P1),P1='no',
        espregunta('La LHC en los adultos no sobrepasa los 61mm?',P2),P2='no',
        espregunta('Region dorsal con 6 lineas transversales paralelas sobre un campo oscuro, con manchas oscuras en la ingle?',P3),P3='no',
        espregunta('Posee una escama cantal?',P4),P4='si',
        espregunta('Machos con el vientre de color gris oscuro, con manchas en forma de barra sobre la garganta y lados del abdomen?',P5),P5='no',
        pf1('./SEherpetofauna/imagenes/sceloporus aeneus.jpg',' ','./SEherpetofauna/imagenes/sceloporus aeneus.jpg').

        %Sceloporus scalaris.
        laterales(P1,P2,P3,P4,P5):-
        espregunta('Escamas nucales laterales mas pequeñas y bien diferenciadas de las escamas nucales dorsales?',P1),P1='no',
        espregunta('La LHC en los adultos no sobrepasa los 61mm?',P2),P2='no',
        espregunta('Region dorsal con 6 lineas transversales paralelas sobre un campo oscuro, con manchas oscuras en la ingle?',P3),P3='no',
        espregunta('Posee una escama cantal?',P4),P4='no',
        espregunta('Machos con el vientre de color gris oscuro, con manchas en forma de barra sobre la garganta y lados del abdomen?',P5),P5='si',
        pf1('./SEherpetofauna/imagenes/Sceloporus scalaris.jpg',' ','./SEherpetofauna/imagenes/Sceloporus scalaris.jpg').

        %Sceloporus bicanthalis.
        laterales(P1,P2,P3,P4,P5):-
        espregunta('Escamas nucales laterales mas pequeñas y bien diferenciadas de las escamas nucales dorsales?',P1),P1='no',
        espregunta('La LHC en los adultos no sobrepasa los 61mm?',P2),P2='no',
        espregunta('Region dorsal con 6 lineas transversales paralelas sobre un campo oscuro, con manchas oscuras en la ingle?',P3),P3='no',
        espregunta('Posee una escama cantal?',P4),P4='no',
        espregunta('Machos con el vientre de color gris oscuro, con manchas en forma de barra sobre la garganta y lados del abdomen?',P5),P5='no',
        pf1('./SEherpetofauna/imagenes/Sceloporus bicanthalis.jpg',' ','./SEherpetofauna/imagenes/Sceloporus bicanthalis.jpg').


        laterales(_,_,_,_,_):-new(D,dialog('ERROR')),
        new(L,label(l,'ESPECIE NO DETERMINADA',font('times','roman',16))),
        send(D,append,L),
        send(D,open,point(350,350)).

collares:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('Con collar completo en la region de la nuca de color oscuro, bordeado por lineas claras?')),
        send_list(Pre1,append,[si , no]),
        new(Pre2,menu('Escamas supraoculares en una sola serie, no divididas; color dorsal del cuerpo gris oscuro, sin puntos claros?')),
        send_list(Pre2,append,[si,no]),
        new(Pre3,menu('Escamas dorsales 31 o menos; cola sin bandas de igual amplitud, alternadas de color claro y negro?')),
        send_list(Pre3,append,[si,no]),
        send(D,append(Pre1)),
        send(D,append(Pre2)),
        send(D,append(Pre3)),
        new(B1,button(atras,and(message(@prolog,postros),message(D,destroy)))),
                new(B,button(siguiente,message(@prolog,completo,Pre1?selection,Pre2?selection,Pre3?selection))),
        send(D,append,B1),
        send(D,append,B),
        send(D,open,point(300,300)).

        %Sceloporus torquatus.
        completo(P1,P2,P3):-
        espregunta('Con collar completo en la region de la nuca de color oscuro, bordeado por lineas claras?',P1),P1='si',
        espregunta('Escamas supraoculares en una sola serie, no divididas; color dorsal del cuerpo gris oscuro, sin puntos claros?',P2),P2='si',
        espregunta('Escamas dorsales 31 o menos; cola sin bandas de igual amplitud, alternadas de color claro y negro?',P3),P3='no',
        pf1('./SEherpetofauna/imagenes/Sceloporus torquatus.jpg',' ','./SEherpetofauna/imagenes/Sceloporus torquatus.jpg').

        %Sceloporus spinosus
        completo(P1,P2,P3):-
        espregunta('Con collar completo en la region de la nuca de color oscuro, bordeado por lineas claras?',P1),P1='no',
        espregunta('Escamas supraoculares en una sola serie, no divididas; color dorsal del cuerpo gris oscuro, sin puntos claros?',P2),P2='no',
        espregunta('Escamas dorsales 31 o menos; cola sin bandas de igual amplitud, alternadas de color claro y negro?',P3),P3='no',
        pf1('./SEherpetofauna/imagenes/Sceloporus spinosus.jpg',' ','./SEherpetofauna/imagenes/Sceloporus spinosus.jpg').

        %Sceloporus mucronatus.
        completo(P1,P2,P3):-
        espregunta('Con collar completo en la region de la nuca de color oscuro, bordeado por lineas claras?',P1),P1='si',
        espregunta('Escamas supraoculares en una sola serie, no divididas; color dorsal del cuerpo gris oscuro, sin puntos claros?',P2),P2='no',
        espregunta('Escamas dorsales 31 o menos; cola sin bandas de igual amplitud, alternadas de color claro y negro?',P3),P3='si',
        pf1('./SEherpetofauna/imagenes/Sceloporus mucronatus.jpg',' ','./SEherpetofauna/imagenes/Sceloporus mucronatus.jpg').

        %Sceloporus sugillatus.
        completo(P1,P2,P3):-
        espregunta('Con collar completo en la region de la nuca de color oscuro, bordeado por lineas claras?',P1),P1='si',
        espregunta('Escamas supraoculares en una sola serie, no divididas; color dorsal del cuerpo gris oscuro, sin puntos claros?',P2),P2='no',
        espregunta('Escamas dorsales 31 o menos; cola sin bandas de igual amplitud, alternadas de color claro y negro?',P3),P3='no',
        pf1('./SEherpetofauna/imagenes/Sceloporus sugillatus.jpg',' ','./SEherpetofauna/imagenes/Sceloporus sugillatus.jpg').

        completo(_,_,_):-new(D,dialog('ERROR')),
        new(L,label(l,'ESPECIE NO DETERMINADA',font('times','roman',16))),
        send(D,append,L),
        send(D,open,point(350,350)).

image(X):-new(D,dialog('REPTIL')),
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



pf1(X,Y,Z):-new(D,dialog('IMAGEN DEL REPTIL')),
          mostrar2(X,D,20,30),
         send(D, append(label(n,' '))),
         send(D, append(label(n,Y))),
         %mostrar2(Z,D,20,350),
         send(D,open).

f1(X,Y):-new(F,frame('IMAGEN DEL REPTIL')),
  send(F,append(new(F1,browser))),
   mostrar(X,F1),
   send(new(D,dialog),below(F1)),
   send(D, append(label(n,'REPTILES'))),
   send(D, append(label(n,Y))),


   send(F,open,point(300,300)).


pf2(X,Y,Z):-new(D,dialog('IMAGEN DEL REPTIL')),
          mostrar2(X,D,20,40),
          new(L,label(n,' ')),
         send(D, append(label(n,'REPTIL'))),
         send(D, append(label(n,Y))),
         send(D,append,L),
          %mostrar2(Z,D,20,350),
         send(D,open).

f2(X,Y):-new(F,frame('IMAGEN DEL REPTIL')),
  send(F,append(new(F1,browser))),
   mostrar(X,F1),
   send(new(D,dialog),below(F1)),
   send(D, append(label(n,'REPTIL'))),
   send(D, append(label(n,Y))),

   send(F,open,point(300,300)).

pf3(X,Y,Z):-new(D,dialog('IMAGEN DEL REPTIL')),
          mostrar2(X,D,20,30),
           new(L,label(n,' ')),
          send(D, append(label(n,'REPTIL'))),
    send(D, append(label(n,' '))),
         send(D, append(label(n,Y))),
          send(D,append,L),
           %mostrar2(Z,D,20,350),
         send(D,open).

f3(X,Y):-new(F,frame('IMAGEN DEL REPTIL')),
  send(F,append(new(F1,browser))),
   mostrar(X,F1),
   send(new(D,dialog),below(F1)),
   send(D, append(label(n,'REPTIL'))),
    send(D, append(label(n,' '))),
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
