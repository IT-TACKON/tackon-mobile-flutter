import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tackon/common/constant.dart';
import 'package:tackon/data/repository/auth_repository.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthRepository _authRepository = AuthRepository();
  final GlobalKey<FormState> _authFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _authFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_authFormKey.currentState!.validate()) {
                  final bool status = await _authRepository.login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  if (status) {
                    Get.offAllNamed(RouteName.dashboard);
                  }
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
