import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/async_notifier_Provider/auth/auth_widgets/custome_Textfield.dart';
import 'package:riverpod_learning/async_notifier_Provider/auth/providers/authProvider.dart';
import 'package:riverpod_learning/async_notifier_Provider/auth/screens/testing_home_Screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final login = ref.read(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text("SingUp Screen"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextformField(
              controller: emailController,
              hintText: "Email",
              prefixIcon: Icons.mail,
            ),
            SizedBox(height: 20),
            AppTextformField(
              controller: passwordController,
              hintText: "Create your Password",
              prefixIcon: Icons.lock,
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await login.userLogin(
                  email: emailController.text,
                  password: passwordController.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text("login"),
            ),
          ],
        ),
      ),
    );
  }
}
