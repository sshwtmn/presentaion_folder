//implement

//details and save to database

import 'package:flutter/material.dart';

import '../../models/name.dart';
import '../../shared/styled_text.dart';

class DetailsPage extends StatelessWidget {
  final Person person;
  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const StyledAppBarText('Details Page'),
        backgroundColor: Colors.blue[500],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16.0,),
            Image.network(person.picture),
            const SizedBox(height: 16.0,),
            ElevatedButton(onPressed: () {}, child: const StyledBodyText("Save to List")),
            SizedBox(height: 16.0,),
            StyledBodyText("${person.name.first} ${person.name.last}"),
          ],
        ),
      ),
    );
  }
}
