import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LocaleCubit extends HydratedCubit<Locale> {
  LocaleCubit() : super(const Locale('ar'));  

  void changeLocale(Locale locale) => emit(locale);

  @override
  Locale fromJson(Map<String, dynamic> json) {
    return Locale(json['languageCode']);
  }

  @override
  Map<String, dynamic> toJson(Locale state) {
    return {'languageCode': state.languageCode};
  }
}
