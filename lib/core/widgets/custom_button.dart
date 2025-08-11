import 'package:flutter/material.dart';
import 'package:nabd/config/responsive/responsive.dart';
import 'package:nabd/core/theme/app_colors.dart';
import 'package:nabd/core/theme/app_size.dart';
import 'package:nabd/core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.color,
    required this.responsive,
  });

  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final Responsive responsive;
  @override
  Widget build(BuildContext context) {
    final textStyles = AppTextStyles(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primary,
         alignment: Alignment.center,
        minimumSize: Size(double.infinity, AppSize.buttonHeight),
        padding: EdgeInsets.symmetric(
          horizontal: responsive.padding(AppSize.padding),
          vertical: responsive.padding(AppSize.padding - 1),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(responsive.radius(2)),
        ),
      ),
      child:
          child ??
          Text(
            text ?? '',
            style: textStyles.button.copyWith(color: AppColors.darkTextPrimary),
          ),
    );
  }
}
