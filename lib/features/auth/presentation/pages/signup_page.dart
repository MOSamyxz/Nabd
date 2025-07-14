import 'package:flutter/material.dart';
import 'package:nabd/features/auth/presentation/widgets/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SignUpForm(),
        ),
      ),
    );
  }
}

