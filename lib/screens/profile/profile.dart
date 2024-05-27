import 'package:flutter/material.dart';
import 'package:flutter_auth_tut/screens/profile/profile_list_details.dart';
import 'package:flutter_auth_tut/services/auth_service.dart';
import 'package:flutter_auth_tut/shared/styled_button.dart';
import 'package:flutter_auth_tut/shared/styled_text.dart';

import '../../models/app_user.dart';
import '../../models/name.dart';
import '../../services/person_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});

  final AppUser user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<List<Person>> futurePersons;

  @override
  void initState() {
    super.initState();
    futurePersons = PersonService.fetchPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledAppBarText('Your Profile'),
        backgroundColor: Colors.blue[500],
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const StyledHeading("profile"),
            const SizedBox(height: 16.0),

            StyledBodyText("Welcome to your profile, ${widget.user.email}"),
            const SizedBox(height: 16.0,),

            FutureBuilder<List<Person>>(
              future: futurePersons,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        Person person = snapshot.data?[index];
                        return ListTile(
                          title: StyledBodyText(person.email),
                          subtitle: StyledBodyText(person.name.first),
                          trailing: const Icon(Icons.chevron_right_outlined),
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailsPage(person: person)))

                        );
                      }, itemCount: snapshot.data!.length, separatorBuilder: (BuildContext context, int index) {
                         return const Divider(color:Colors.black26);
                    },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),

            StyledButton(
                onPressed: () {
                  AuthService.signOut();
                },
                child: const StyledButtonText("Log Out"))
          ],
        ),
      ),
    );
  }
}