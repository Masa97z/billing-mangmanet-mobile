import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends StateNotifier<String> {
  LoginNotifier() : super("");

  void updateStringData(String newData) {
    state = newData;
  }
}

class LoginState {
  final bool isLoginState;

  LoginState({required this.isLoginState});
}

final LoginProvider = StateNotifierProvider(
  (ref) => LoginNotifier(),
);
