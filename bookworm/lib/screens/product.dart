import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/expandedText.dart';
import 'package:teste/components/pageModel.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  _ProductScreenState();

  @override
  Widget build(BuildContext context) {
    return PageModelScreen(
      'Acervo',
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Orgulho e Preconceito',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          height: 240,
                          width: 156,
                          child: Image.asset(
                            'assets/images/orgulho.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        _productInformation(context, 'CÓD: XYZABC'),
                        _productInformation(context, 'Editora: José \nOlympio'),
                        _productInformation(context, 'Ano edição: 2019'),
                        _productInformation(
                            context, 'Exemplares \ndisponíneis: 2'),
                        ClickableText(
                              () {},
                          Text(
                            'Reservar',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        _productInformation(context, 'Autora: Jane Austen'),
                        _productInformation(context, 'Gênero: Romance, \nFicção'),
                        ProductDescriptionExpanded(
                            'A história de um amor improvável em uma época em que sentimentos poderiam não ser suficientes. \n Quando Elizabeth Bennet conhece o cobiçado Fitzwilliam Darcy, não hesita em julgá-lo arrogante e presunçoso, afinal ele parece desprezar sua companhia, assim como a de todo mundo, demonstrando um temperamento rude e orgulhoso, impossível de agradar. Após descobrir o envolvimento do detestável cavalheiro nos eventos que separaram sua querida irmã, Jane, do jovem Bingley, Elizabeth está determinada a odiá-lo ainda mais. Uma surpreendente reviravolta, porém, poderá provar que as primeiras impressões nem sempre são incontestáveis.'),
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    ClickableText(
                          () {},
                      Text(
                        'Adicionar aos favoritos',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Padding _productInformation(BuildContext context, String information) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Text(
      information,
      style: Theme.of(context).textTheme.bodyText1,
    ),
  );
}
