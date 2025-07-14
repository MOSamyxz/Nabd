import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nabd/core/theme/app_size.dart';
import 'package:nabd/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nabd/features/auth/presentation/widgets/gradiant_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return  Form(
                  key: context.read<AuthCubit>().signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GradientTextField(
                        controller: context.read<AuthCubit>().signUpUserNameController,
                        prefix: Iconsax.user4,
                        hintText: "اسم المستخدم",
                      ),
                      const SizedBox(height: 10),
                      GradientTextField(
                        controller: context.read<AuthCubit>().signUpFullNameController,
                        prefix: Iconsax.user4,
                        hintText: "اسمك الكامل",
                      ),
                      const SizedBox(height: 10),
    
                      GradientTextField(
                        controller: context.read<AuthCubit>().signUpEmailController,
                        prefix: Iconsax.sms4,
                        hintText: "البريد الإلكتروني",
                      ),
                      const SizedBox(height: 10),
    
                      GradientTextField(
                        controller: context.read<AuthCubit>().signUpPasswordController,
                        prefix: Iconsax.lock4,
                        hintText: "كلمة المرور",
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "يرجى إدخال كلمة المرور";
                          }
                          if (value.length < 6) {
                            return "يجب أن تكون كلمة المرور 6 أحرف على الأقل";
                          }
                          return null;
                        },
                      ),
    
                      const SizedBox(height: 20),
    
                     ElevatedButton(
                            onPressed: () => context.read<AuthCubit>().signUp(),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppSize.borderRadius),
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: const Text("إنشاء حساب"),
                          ),
                    ],
                  ),
                );
  }
}