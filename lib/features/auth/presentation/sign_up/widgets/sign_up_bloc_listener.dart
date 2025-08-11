import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nabd/core/theme/app_colors.dart';
import 'package:nabd/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:nabd/features/auth/presentation/sign_up/cubit/sign_up_state.dart';
 

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) =>   Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            );
          },
          success: (signUpResponse) {
                        context.pop();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('SignUp successful! Welcome ${signUpResponse.user?.email}'),
              backgroundColor: AppColors.success,
            ),
           );
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
        ),
        actions: [
          TextButton(
            onPressed: () {
            Navigator.of(context).pop();
            },
            child: Text(
              'Got it',
            ),
          ),
        ],
      ),
    );
  }
}