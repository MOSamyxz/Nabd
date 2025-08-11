import 'package:flutter/material.dart';
import 'package:nabd/config/responsive/responsive.dart';
import 'package:nabd/core/theme/app_colors.dart';
import 'package:nabd/core/theme/app_size.dart';
  
class GradientTextField extends StatefulWidget {
  const GradientTextField({
    super.key,
    this.isPassword = false,
    this.suffix,
    this.suffixPressed,
    required this.hintText,
    this.labelText,
    this.validator,
    this.controller,
    this.prefix,
    this.isShowCursor = true,
    this.isReadOnly = false,
    this.onSubmit,
    this.onChange,
    this.onTab,
    this.inputType,
    required this.responsive,
  });

  final bool isPassword;
  final IconData? suffix;
  final void Function()? suffixPressed;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData? prefix;
  final bool isShowCursor;
  final bool isReadOnly;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final Function()? onTab;
  final TextInputType? inputType;
final Responsive responsive;
  @override
  _GradientTextFieldState createState() => _GradientTextFieldState();
}

class _GradientTextFieldState extends State<GradientTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      padding: EdgeInsets.all(widget.responsive.padding(AppSize.textFormFieldPadding)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.responsive.radius(3)),
        gradient:
            _isFocused
                ? LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [AppColors.primary, AppColors.accent],
                )
                : LinearGradient(
                  colors: [Colors.grey.shade300, Colors.grey.shade300],
                ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          borderRadius: BorderRadius.circular(widget.responsive.radius(3)),
        ),
        child: TextFormField(
          focusNode: _focusNode,
          readOnly: widget.isReadOnly,
          showCursor: widget.isShowCursor,
          keyboardType: widget.inputType,
          onFieldSubmitted: widget.onSubmit,
          onChanged: widget.onChange,
          onTap: widget.onTab,
          obscureText: widget.isPassword,
          controller: widget.controller,
          validator: widget.validator,
          style: TextStyle(color: AppColors.lightTextPrimary),
          decoration: InputDecoration(
            prefixIcon: Icon(
              color: AppColors.primary,
              size: widget.responsive.radius(6),
              widget.prefix,
            ),
            suffixIcon: IconButton(
              onPressed: widget.suffixPressed,
              icon: Icon(widget.suffix),
            ),
            label: widget.labelText == null ? null : Text(widget.labelText!),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.secondaryText),
           
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
