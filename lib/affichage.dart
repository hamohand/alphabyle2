import 'package:alpha_kaberbere/sonlettre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/lettre.dart';

// ignore: must_be_immutable
class LettresList extends StatelessWidget {
  final List<Lettre> tabLettres;
  int codeCouleurFond = 500;
  LettresList({Key key, this.tabLettres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ), */
    return laListe();
  }

  Widget laListe() {
    //readJson();
    return //Column(children: [Row(children: [Text('Lettre'),Text('Exemples')]),
        ListView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: tabLettres.length,
      itemBuilder: (BuildContext context, int index) {
        //print('tabLettres.lettre: ${tabLettres[index].lettre}');
        //print('index: $index');
        (codeCouleurFond == 400)
            ? codeCouleurFond = 600
            : codeCouleurFond = 400;
        return Expanded(
            child: Container(
          color: Colors.amber[codeCouleurFond],
          child: Row(children: [
            //wAfficheLettre(index),
            AfficheLettre(tabLettres[index]),
            SonLettre(
                titre: tabLettres[index].lettre,
                fichier: 'assets/audio/${tabLettres[index].son}'),
            Text(
              '    ${tabLettres[index].exemples}',
            ),
            Text('  '),
            Image.asset(
              'assets/images/${tabLettres[index].image}',
              width: 50,
            ),
            Expanded(
                child: ListTile(
              //title: Text('...'),
              leading: Icon(
                Icons.arrow_right_alt_rounded,
              ),
              //subtitle: Text('${tabLettres[index].francais}'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            //fctDetails(tabLettres[index].exemples)));
                            // wAfficheLettreDetail(index))
                            AfficheLettreDetail(tabLettres[index])));
              },
            ))
          ]),
        ));
      },
    );
  }
}

class AfficheLettreDetail extends StatelessWidget {
  final Lettre lettre;
  AfficheLettreDetail(this.lettre);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lettre.lettre),
      ),
      body: Container(
          child: Column(
        children: [
          Row(
            children: [
              //wAfficheLettre(index),
              Text('Lettre : '),
              AfficheLettre(lettre),
              Text('   '),
              Icon(
                Icons.record_voice_over,
                color: Colors.lightBlue[50],
              ),
            ],
          ),
          Row(
            children: [
              Text('Exemples : ${lettre.exemples}'),
              Text('   '),
              Icon(
                Icons.record_voice_over,
                color: Colors.lightBlue,
              ),
            ],
          ),
          Column(children: [
            Text(
              'En français : ${lettre.francais}',
              textAlign: TextAlign.left,
            ),
            Text('En arabe : ${lettre.arabe}'),
          ])
        ],
      )),
    );
  }
}

class AfficheLettre extends StatelessWidget {
  final Lettre lettre;

  AfficheLettre(this.lettre);

  @override
  Widget build(BuildContext context) {
    return Container(
      /* decoration: BoxDecoration(
      border: Border.all(width: 10, color: Colors.black38),
      borderRadius: const BorderRadius.all(const Radius.circular(8)),
    ),*/
      margin: const EdgeInsets.all(10.0),
      color: Color.fromRGBO(255, 230, 19, 1),
      // fond
      width: 30.0,
      height: 25.0,
      alignment: Alignment.center,
      child: Expanded(
          child: Text('${lettre.lettre}',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Color.fromRGBO(205, 1, 51, 1.0), // lettres
                fontSize: 20,
              ))),
    );
  }
}
