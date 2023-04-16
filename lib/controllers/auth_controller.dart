// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:e_commerce_app/utils/enums.dart';

import '../services/auth.dart';

class AuthConroller with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;

  AuthConroller({
    required this.auth,
    this.email = '',
    this.password = '',
    this.authFormType = AuthFormType.login,
  });

  void updateEmail(String email) {
    return copyWith(email: email);
  }

  void updatePassword(String password) {
    return copyWith(password: password);
  }

  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    // زي كانو استخدمت النوتفاي لسنر
    copyWith(email: '', password: '', authFormType: formType);
  }

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email, password);
      } else {
        await auth.signUpWithEmailAndPassword(email, password);
      }
    } on Exception catch (e) {
      rethrow;
    }
  }

// لو بدي اغير  اي قيمة من القيم المعرفة من خلال الدالة
  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }
}
