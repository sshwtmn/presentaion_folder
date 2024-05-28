import 'package:flutter/material.dart';
import 'package:flutter_presentaion/services/auth_service.dart';
import 'package:flutter_presentaion/shared/styled_button.dart';
import 'package:flutter_presentaion/shared/styled_text.dart';

import '../../models/app_user.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});

  final AppUser user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your Profile'),

      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const StyledHeading("Main Menu"),
            const SizedBox(height: 16.0),

            StyledText("Welcome to your Account, ${widget.user.email}"),
            const SizedBox(height: 16.0,),


            StyledButton(
                onPressed: () {
                  AuthService.signOut();
                },
                child: const StyledText("Log Out"))
          ],
        ),
      ),
    );
  }
}