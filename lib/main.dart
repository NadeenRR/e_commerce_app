import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/utils/router.dart';
import 'package:e_commerce_app/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommarce App',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffE5E5E5),
          primaryColor: const Color(0xffDB3022),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.labelLarge,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.grey)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.grey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(color: Colors.red)),
          ),
        ),
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.landingPageRoute,
      ),
    );
  }
}
