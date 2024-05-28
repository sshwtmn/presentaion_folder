import "package:flutter/material.dart";
import "package:flutter_presentaion/services/auth_service.dart";

import "../../shared/styled_button.dart";
import "../../shared/styled_text.dart";

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorFeedback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: StyledText("Sign In into your account")),
            const SizedBox(height: 16.0),
            //email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: "Email"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),

            if (_errorFeedback != null)
              Text(
                _errorFeedback!,
                style: const TextStyle(color: Colors.red),
              ),

            StyledButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _errorFeedback = null;
                    });
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();

                    final user = await AuthService.signIn(email, password);

                    if (user == null) {
                      setState(() {
                        _errorFeedback = "Incorrect login credentials";
                      });
                    }
                  }
                },
                child: const StyledText("Sign In"))
          ],
        ),
      ),
    );
  }
}
