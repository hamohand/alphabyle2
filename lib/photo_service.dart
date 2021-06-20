import 'dart:convert';
import 'package:alpha_kaberbere/models/photo_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'dart:async' show Future;

// méthode 1 OK
Future<List<Photo>> _chargerHttp(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //.get(Uri.parse('assets/json/photos.json'));
  //.get(Uri.parse('https://drive.google.com/file/d/1AxJHclljcFX7b03G7B9G-QOuVDaNxlXS/view?usp=sharing'));

  // Use the compute function to run parsePhotos : methode 1
  return convertir(response.body);
  // Use the compute function to run parsePhotos in a separate isolate : : methode 2
  //return compute(parsePhotos, response.body);
}

List<Photo> convertir(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  // print(parsed);
  // List x = parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  //print('x: ${x[0].id}');
  // print('x[0]: ${x[0].title} ---');
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
// méthode 2 OK
Future<List<Photo>> _chargerRoot() async {
  String jsonString = await rootBundle.loadString('json/photos.json');
  //await rootBundle.loadString('https://drive.google.com/file/d/1AxJHclljcFX7b03G7B9G-QOuVDaNxlXS/view?usp=sharing');
  print(jsonString);
  return convertir(jsonString);
}

// A function that converts a response body into a List<Photo>.