import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/MyNotesFlow/auth/auth_widgets/custome_Textfield.dart';
import 'package:riverpod_learning/MyNotesFlow/auth/providers/authProvider.dart';
import 'package:riverpod_learning/MyNotesFlow/auth/screens/singup_screen.dart';

class ForgotpasswordScreen extends ConsumerStatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  ConsumerState<ForgotpasswordScreen> createState() =>
      _ForgotpasswordScreenState();
}

class _ForgotpasswordScreenState extends ConsumerState<ForgotpasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgotPassword = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password"), centerTitle: true),
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

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await forgotPassword.userForgotPassword(
                  email: emailController.text,
                );
              },
              child: Text("Reset Password"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text("Go to SingUp Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
