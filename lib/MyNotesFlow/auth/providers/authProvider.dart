import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_learning/MyNotesFlow/auth/services/auth_firebase_services.dart';

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  final _authServices = AuthFirebaseServices();

  Future<void> userSingup({
    required String name,
    required String email,
    required String password,
  }) async {
    state = true;
    await _authServices.singUp(name: name, email: email, password: password);
    state = false;
  }

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    state = true;

    await _authServices.login(email: email, password: password);
  }

  Future<void> userForgotPassword({required String email}) async {
    state = true;
    await _authServices.forgotPassword(email: email);
  }
}
