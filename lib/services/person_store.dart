import 'package:flutter/cupertino.dart';

import '../models/name.dart';

class PersonalStore extends ChangeNotifier{

  final List<Person> _persons = [];

  get persons => _persons;

}