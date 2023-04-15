import 'package:e_commerce_app/utils/enums.dart';
import 'package:flutter/material.dart';

import '../widgets/main_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  var authType = AuthFormType.login;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(authType == AuthFormType.login ? 'Login' : 'Register',
                    style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(
                  height: authType == AuthFormType.login ? 70 : 50,
                ),
                if (authType == AuthFormType.register)
                  const SizedBox(
                    height: 16,
                  ),
                if (authType == AuthFormType.register)
                  TextFormField(
                    controller: nameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                    ),
                  ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  focusNode: emailFocusNode,
                  controller: emailController,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(passwordFocusNode),
                  textInputAction: TextInputAction.next,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your email' : null,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  focusNode: passwordFocusNode,
                  controller: passwordController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your password' : null,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                if (authType == AuthFormType.login)
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: const Text(
                        'Forget your password?',
                      ),
                      onTap: () {},
                    ),
                  ),
                const SizedBox(
                  height: 24,
                ),
                MainButton(
                  text: authType == AuthFormType.login ? 'LOGIN' : 'REGISTER',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      debugPrint('Validate is done');
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(
                      authType == AuthFormType.login
                          ? 'Don\'t have an account? Register'
                          : 'Have an account Login',
                    ),
                    onTap: () {
                      formKey.currentState!.reset();
                      setState(() {
                        if (authType == AuthFormType.login) {
                          authType = AuthFormType.register;
                        } else {
                          authType = AuthFormType.login;
                        }
                      });
                    },
                  ),
                ),
                // const Spacer(),
                SizedBox(height: size.height * 0.08),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      authType == AuthFormType.login
                          ? 'Or login with'
                          : 'Or register with',
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
