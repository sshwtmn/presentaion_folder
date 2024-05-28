import 'package:flutter_presentaion/screens/welcome/sign_in.dart';
import 'package:flutter_presentaion/screens/welcome/sign_up.dart';
import 'package:flutter_presentaion/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  bool isSignUpForm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Braids creation'),
      ),
      body: SingleChildScrollView(
        child: Container(

          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 300,),
              const StyledHeading('Welcome'),
              // sign up screen
              if(isSignUpForm)
                Column(
                  children: [
                    const SignUpForm(),
                    const StyledText("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isSignUpForm = false;
                          });
                        },
                        child: Text("Sign in instead", style: GoogleFonts.poppins())),
                  ],
                ),

              // sign in screen
              if(!isSignUpForm)
                Column(
                  children: [
                    const SignInForm(),
                    const StyledText("Need an account?"),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isSignUpForm = true;
                          });
                        },
                        child: Text("Sign up instead", style: GoogleFonts.poppins())),
                  ],
                ),

            ]
          )
        ),
      ),
    );
  }
}