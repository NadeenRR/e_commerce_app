import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/views/pages/home_page.dart';
import 'package:e_commerce_app/views/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'buttom_navbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChange(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return ChangeNotifierProvider<AuthConroller>(
                create: (_) => AuthConroller(auth: auth),
                child: const AuthPage());
          }
          return const ButtomNavBar();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
