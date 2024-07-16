import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:restoorder/components/button.dart';
import 'package:restoorder/components/logo.dart';
import 'package:restoorder/components/text_field.dart';
import 'package:restoorder/provider/services/auth/auth_services.dart';

import '../../provider/services/auth/login_or_register.dart';
import '../../provider/services/database/firestore.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});
  final Function() onTap;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void register() {
      if (_passwordController.text != '' &&
          _emailController.text != '' &&
          _nameController.text != '' &&
          _phoneController.text != '') {
        context.read<AuthServices>().signUpWithEmailAndPassword(
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
        } else {
          context.read<FirestoreService>().saveUserToDatabase(
              _emailController.text,
              _phoneController.text,
              _nameController.text);
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
            //Create an Account
            Text(
              "Create an Account",
              style: GoogleFonts.bebasNeue(
                  fontSize: screenHeight * 0.0645,
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.tertiary),
            ),
//Email Field
            MyTextField(controller: _nameController, text: "Your Name"),
            //Email Field
            MyTextField(controller: _emailController, text: "Email"),
            //Phone Field
            PhoneField(
              controller: _phoneController,
            ),
            //password field
            MyTextField(
                controller: _passwordController,
                text: "Password",
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

            //Sign Up button
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapShot.connectionState == ConnectionState.done) {}
                return Column(children: [
                  SizedBox(
                    height: screenHeight * 0.026,
                  ),
                  Button(
                    padding: screenWidth * 0.026,
                    text: "Sign Up",
                    onTap: register,
                  ),
                ]);
              },
            ),
            //you have an account ? Login Here
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "you have an account ?  ",
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login Here ',
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
