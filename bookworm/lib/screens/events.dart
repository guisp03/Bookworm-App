import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/models/evento.dart';

class EventsScreen extends StatefulWidget {
  final int id;

  const EventsScreen(this.id);
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  EventoClienteWeb eventoClienteWeb = new EventoClienteWeb();
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
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return Column(
                        children: [
                          Center(
                            child: Image.asset(
                                'assets/images/ratinhoprateleira.png'),
                          ),
                          Text(
                            'Buscando eventos',
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      );
                      break;
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        eventoWeb = snapshot.data;
                        count = count + eventoWeb.count;
                        eventoWeb.eventos
                            .forEach((element) => eventos.add(element));
                        if (eventos.isNotEmpty) {
                          return Column(children: <Widget>[
                            Image.asset(
                              'assets/images/eventos-animacao.gif',
                              height: 210,
                            ),
                            MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemCount: eventos.length,
                                    itemBuilder: (context, i) {
                                      return Column(
                                        children: <Widget>[
                                          Divider(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                          ),
                                          Text(
                                            eventos[i].titulo + '\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          ),
                                          Text(
                                            'Descrição: ' +
                                                eventos[i].descricao +
                                                '\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            'Responsável: ' +
                                                eventos[i].responsavel +
                                                '\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            'Email: ' + eventos[i].email,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Divider(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                          )
                                        ],
                                      );
                                    })),
                            eventoWeb.totalCount > count
                                ? ClickableText(16, 16, () {
                                    setState(() {
                                      page++;
                                      future =
                                          eventoClienteWeb.getEventoWeb(page);
                                    });
                                  }, Text('Carregar mais'))
                                : Text(''),
                          ]);
                        }
                      }
                      return Text('Falha ao buscar eventos');
                  }
                  return Text('Falha desconhecida');
                })),
        widget.id);
  }
}
