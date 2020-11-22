import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/models/evento.dart';

class EventsScreen extends StatefulWidget {
  final String titulo;
  final String descricao;
  final String responsavel;
  final String email;

  const EventsScreen(this.titulo, this.descricao, this.responsavel, this.email);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  EventoClienteWeb eventoClienteWeb =  new EventoClienteWeb();
  EventoWeb eventoWeb;
  Future<EventoWeb> future;
  List<Evento> eventos = [];
  int page = 1;
  int count = 0;

  @override
  void initState() {
    super.initState();
    future = eventoClienteWeb.getEventoWeb(page);
  }

  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      'Eventos',
      SingleChildScrollView(
        child: FutureBuilder<EventoWeb>(
          future: future,
          builder: (context,snapshot){
           switch (snapshot.connectionState) {
             case ConnectionState.none:
                break;
             case ConnectionState.waiting:
               return CircularProgressIndicator();
               break;
             case ConnectionState.active:
               break;
             case ConnectionState.done:
               if (snapshot.hasData) {
                 eventoWeb = snapshot.data;
                 count = count + eventoWeb.count;
                 eventoWeb.eventos.forEach((element) => eventos.add(element));
                 if(eventos.isNotEmpty) {
                   return Column(
                     children: <Widget>[
                       MediaQuery.removePadding(
                           context: context,
                           removeTop: true,
                           child: ListView.builder(
                               scrollDirection: Axis.vertical,
                               shrinkWrap: true,
                               physics: ScrollPhysics(),
                               itemCount: eventos.length,
                               itemBuilder: (context, i) {
                                 List<Evento> eventos;
                                 return Column(
                                   children: <Widget>[
                                     Text(
                                       "Eventos",
                                     ),
                                     Text('Título: ' + eventos[i].titulo),
                                     Text('Descrição: ' + eventos[i].descricao),
                                     Text('Responsável: ' + eventos[i].responsavel),
                                     Text('Email: ' + eventos[i].email),
                                   ],
                                 );
                                 }
                           )
                       ),
                       eventoWeb.totalCount > count
                           ? ClickableText(16, 16, () {
                         setState(() {
                           page++;
                           future = eventoClienteWeb.getEventoWeb(page);
                         });
                       }, Text('Carregar mais'))
                           : Text(''),
                     ]
                   );
                       }
                   }
               return Text(
                 'Falha ao buscar eventos'
               );
                   }
                   return Text ('Falha desconhecida');
          }
                   )
                   )
                  );
                 }
                 }
