import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nabd/config/responsive/responsive_widget.dart';
import 'package:nabd/config/routes/app_routes.dart';
import 'package:nabd/core/cubits/theme/theme_cubit.dart';
import 'package:nabd/core/theme/app_size.dart';
import 'package:nabd/core/theme/app_text_styles.dart';
import 'package:nabd/core/widgets/custom_button.dart';
import 'package:nabd/core/widgets/gradiant_text_field.dart';
  import 'package:nabd/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:nabd/features/auth/data/models/user_model.dart';
import 'package:nabd/features/auth/presentation/log_in/login_cubit.dart/login_cubit.dart';
import 'package:nabd/features/auth/presentation/log_in/widgets/login_bloc_listener.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
 
UserLocalStorage localStorage = UserLocalStorage();
UserModel? userModel = localStorage.getUser();

 if (userModel != null) {
  log("Username: ${userModel.userName}");
} else {
  log("No user logged in");
}    final textStyles = AppTextStyles(context);

    return ResponsiveWidget(
      builder: (context, responsive) {
        return Scaffold(
          appBar: AppBar( actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
          ],),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: responsive.wp(AppSize.padding)),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login to Your\nAccount' ,style: textStyles.heading1),
                  AppSize.verticalSpace(responsive.hp(6)),
                GradientTextField(
                  hintText: 'Email',
                   controller: context.read<LoginCubit>().emailController,
                  inputType: TextInputType.emailAddress,
                  prefix: Icons.email_outlined,
                  responsive: responsive,
                ),
                AppSize.verticalSpace(responsive.hp(1)),
                GradientTextField(
                  hintText: 'Password',
                   controller: context.read<LoginCubit>().passwordController,
                  inputType: TextInputType.visiblePassword,
                  prefix: Icons.lock_outline,
                  isPassword: true,
                  responsive: responsive,
                ),                AppSize.verticalSpace(responsive.hp(1)),

                CustomButton(
                  onPressed: () {
                    context.read<LoginCubit>().emitLoginStates();
                  },
                  responsive: responsive,
                  child: Text('Login with Email'),
                ),
                    AppSize.verticalSpace(responsive.hp(1)),
                CustomButton(
                  onPressed: () {
                    context.push(AppRoutes.signUp);
                    },
                    responsive: responsive,
                    child: Text('Sign Up'),
                  ),
                  LoginBlocListener(),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
