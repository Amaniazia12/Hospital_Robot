import 'dart:io';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Task>> getTask() async {
  final taskData = await http
      .get(Uri.parse("http://192.168.1.4:8000/Tasks/TaskAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        // "token b194bda7a92bc7000d569b830a565a89a2b66993"
        "token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(taskData.body);
  List<Task> task_all = [];

  for (var task in jsonData) {
    task_all.add(Task.fromJson(task));
  }
  print(task_all.length.toString() + "///////////");
  return task_all;
}
