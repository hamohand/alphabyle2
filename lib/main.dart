import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import './models/lettre.dart';
import 'affichage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Alphabet';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

//class MyHomePage extends StatelessWidget {
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text.rich(
        TextSpan(
          text: 'Alphabet : ', // default text style
          children: <TextSpan>[
            TextSpan(
              text: 'Tamazi\$t-Taqbaylit',
              style: const TextStyle(
                  fontFamily: 'Amazigh',
                  color: Color.fromRGBO(205, 1, 51, 1.0)),
            ),
            TextSpan(
              text: ' (Berbère - Kabyle)',
              style: const TextStyle(color: Color.fromRGBO(205, 1, 51, 1.0)),
            ),
          ],
        ),
      )),
      body: //FutureBuilder<List<Photo>>(
          FutureBuilder<List<Lettre>>(
        /*future: _chargerHttp(http.Client()), // http.client*/
        future: _chargerRoot(), // rootBundle.loadString
        /*future: appelChargerRoot(), // rootBundle.loadString*/
        builder: (context, AsyncSnapshot snapshot) {
          //print(snapshot.data[0].id);
          //print(snapshot.data[0].title);
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              // ? PhotosList(photos: snapshot.data)
              ? LettresList(tabLettres: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  /* *********** */
  // méthode 1 OK
//Future<List<Photo>> _chargerHttp(http.Client client) async {
  Future<List<Lettre>> _chargerHttp(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    //.get(Uri.parse('assets/json/photos.json'));
    //.get(Uri.parse('https://drive.google.com/file/d/1AxJHclljcFX7b03G7B9G-QOuVDaNxlXS/view?usp=sharing'));

    // Use the compute function to run parsePhotos : methode 1
    return convertir(response.body);
    // Use the compute function to run parsePhotos in a separate isolate : : methode 2
    //return compute(parsePhotos, response.body);
  }

//List<Photo> convertir(String responseBody) {
  List<Lettre> convertir(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    // print(parsed);
    // List x = parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
//  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
    return parsed.map<Lettre>((json) => Lettre.fromJson(json)).toList();
  }

// méthode 2 OK
//Future<List<Photo>> _chargerRoot() async {
  Future<List<Lettre>> _chargerRoot() async {
    String jsonString = //await rootBundle.loadString('json/photos.json');
        //await rootBundle.loadString('https://drive.google.com/file/d/1AxJHclljcFX7b03G7B9G-QOuVDaNxlXS/view?usp=sharing');
        await rootBundle.loadString('assets/json/lettres.json');
    // print('main jsonString: $jsonString');
    return convertir(jsonString);
  }
/* ********** */
}
