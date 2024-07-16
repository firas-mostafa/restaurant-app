import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../pages/Auth/login_page.dart';

import '../../../pages/Auth/register_page.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<AuthProvider>(context).showLoginPage
        ? LoginPage(onTap: () {
            Provider.of<AuthProvider>(context, listen: false).toggleAuth();
          })
        : RegisterPage(onTap: () {
            Provider.of<AuthProvider>(context, listen: false).toggleAuth();
          });
  }
}

class AuthProvider with ChangeNotifier {
  bool showLoginPage = true;

  void toggleAuth() {
    showLoginPage = !showLoginPage;
    notifyListeners();
  }
}

class ObscureProvider with ChangeNotifier {
  bool obscure = true;
  void changeObscure() {
    obscure = obscure == true ? false : true;
    notifyListeners();
  }
}
