import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/components/button.dart';
import 'package:restoorder/components/logo.dart';
import 'package:restoorder/components/text_field.dart';

import 'package:restoorder/provider/services/auth/auth_services.dart';

import '../../provider/services/auth/login_or_register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  final Function() onTap;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void forgetPassword() {
      if (_emailController.text != '') {
        context.read<AuthServices>().resetThePassword(_emailController.text);
        context.read<AuthServices>().error != ''
            ? showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(
                        context.read<AuthServices>().error.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    ))
            : showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(
                        "Check Your email to change the password and login again",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Please fill Email field",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ));
      }
    }

    void login() {
      if (_passwordController.text != '' && _emailController.text != '') {
        context.read<AuthServices>().signInWithEmailAndPassword(
            _emailController.text, _passwordController.text);
        if (context.read<AuthServices>().error != null) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      context.read<AuthServices>().error.toString(),
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  ));
        }
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Please complete the all fields to proceed.",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ));
      }
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Logo
            const Logo(),
            //Hello again
            Text(
              "Hello Again !",
              style: GoogleFonts.bebasNeue(
                  fontSize: screenHeight * 0.0645,
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.tertiary),
            ),
            //Email Field
            MyTextField(
              controller: _emailController,
              text: "Email",
            ),
            //password field
            MyTextField(
                controller: _passwordController,
                text: 'Password',
                obscure: Provider.of<ObscureProvider>(context).obscure,
                suffix: GestureDetector(
                    onTap: () {
                      Provider.of<ObscureProvider>(context, listen: false)
                          .changeObscure();
                    },
                    child: Icon(
                      Provider.of<ObscureProvider>(context).obscure
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      color: Theme.of(context).colorScheme.tertiary,
                    ))),

            //Forget Password ?
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.026,
                  top: screenHeight * 0.02,
                  bottom: screenHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: forgetPassword,
                      child: Text(
                        'Forget password?',
                        style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).colorScheme.tertiary,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            //Login button
            Button(
              padding: screenWidth * 0.026,
              text: "Login",
              onTap: login,
            ),
            //not a member ? Register Now
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member ?  ",
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Register Now ',
                      style: TextStyle(
                          fontSize: 17,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
