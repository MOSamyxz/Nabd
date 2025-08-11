import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:nabd/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:nabd/features/auth/presentation/sign_up/widgets/sign_up_bloc_listener.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp')),
      body: Center(
        child: Column(
          children: [
            Text('SignUp Page'),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<SignUpCubit>().emitSignUpState();
              },
              child: Text('SignUp with Email'),
            ),
            SignUpBlocListener(),
          ],
        ),
      ),
    );
  }
}
