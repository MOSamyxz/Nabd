extension StringExtensions on String {
  bool get isValidEmail => RegExp(r'\S+@\S+\.\S+').hasMatch(this);
}
