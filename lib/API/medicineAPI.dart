import 'dart:io';
import 'package:hospital_application/Models/MedicineModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<medicine>> getMedicin() async {
  final dataa = await http
      .get(Uri.parse("http://192.168.1.4:8000/Items/MedicineAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        //"token b194bda7a92bc7000d569b830a565a89a2b66993"
        "token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(dataa.body);
  List<medicine> med_all = [];

  for (var t in jsonData) {
    med_all.add(medicine.fromJson(t));
  }
  print(med_all[0].name);
  return med_all;
}
