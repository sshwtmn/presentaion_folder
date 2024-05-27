import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/name.dart';


class PersonService {
  static Future<List<Person>> fetchPersons() async {
    final response = await http.get(Uri.
    parse('https://randomuser.me/api/?results=50'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List<Person> list = [];

      for(var i = 0; i < data["results"].length; i++){
        final entry = data["results"][i];
        list.add(Person.fromJson(entry));
      }
      return list;

    } else {
      throw Exception('Failed to load posts');
    }
  }
}