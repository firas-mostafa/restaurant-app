import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      this.suffix,
      required this.text,
      this.obscure = false,
      this.validator});
  final TextEditingController controller;
  final bool obscure;
  final Widget? suffix;
  final String text;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.026, vertical: screenWidth * 0.015),
      child: TextFormField(
        // validator: validator,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.026)),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error)),
            suffixIcon: suffix,
            hintText: text,
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.026)),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.026)),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.026, vertical: screenWidth * 0.015),
      child: IntlPhoneField(
        controller: controller,
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.026)),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error)),
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.026)),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.026)),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onPrimary),
        initialCountryCode: 'SY',
      ),
    );
  }
}
