import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';

import '../../services/auth.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({Key? key}) : super(key: key);

  Future<void> _logout(AuthConroller model, context) async {
    try {
      await model.logout();
      Navigator.pop(context);
    } catch (e) {
      debugPrint('logout error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthConroller>(
      builder: (_, model) => Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: MainButton(
                text: 'Log Out',
                onTap: () {
                  _logout(model, context);
                }),
          )
        ],
      ),
    );
  }
}
