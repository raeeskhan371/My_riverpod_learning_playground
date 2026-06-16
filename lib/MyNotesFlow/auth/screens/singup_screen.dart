import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/MyNotesFlow/auth/auth_widgets/custome_Textfield.dart';
import 'package:riverpod_learning/MyNotesFlow/auth/providers/authProvider.dart';
import 'package:riverpod_learning/MyNotesFlow/auth/screens/login_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SingUp Screen"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextformField(
              controller: nameController,
              hintText: "Full Name",
              prefixIcon: Icons.person,
            ),
            SizedBox(height: 20),
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
            AppTextformField(
              controller: confirmPasswordController,
              hintText: "Confirm your Password",
              prefixIcon: Icons.lock,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await ref
                    .read(authProvider.notifier)
                    .userSingup(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
              child: Text("Singup"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
