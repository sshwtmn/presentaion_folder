import 'package:http/http.dart' as http;
import 'dart:convert';

class Name {
  final String first;
  final String last;

  const Name({
    required this.first,
    required this.last,
});
  factory Name.fromJson(Map<String, dynamic> json){
    return Name(
        first: json["first"],
        last: json["last"],
    );
  }
}

class Person{
  final String email;
  final String picture;
  final Name name;

  Person({required this.email, required this.picture, required this.name});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      email: json["email"],
      picture: json["picture"]["large"],
      name: Name.fromJson(json["name"]));
  }

}


