import 'dart:io';
import 'package:hospital_application/Models/PersonModels.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Person>> getPerson() async {
  final Dataa = await http
      .get(Uri.parse("http://192.168.0.100:8000/Person/PersonAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        "token b194bda7a92bc7000d569b830a565a89a2b66993"
  });
  var jsonData = json.decode(Dataa.body);
  List<Person> ch_all = [];

  for (var t in jsonData) {
    ch_all.add(Person.fromJson(t));
  }
  return ch_all;
}
