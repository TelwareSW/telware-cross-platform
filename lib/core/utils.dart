// common utility functions are added here

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String? emailValidator(String? value) {
  const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final RegExp regex = RegExp(emailPattern);

  if (value == null || value.isEmpty) {
    return null;
  } else if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

// Password validator to ensure at least 8 characters and contains both letters and digits
String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d._@&-]{8,}$')
      .hasMatch(value)) {
    return 'Must contain letters and digits and can contain . _ @ & -';
  }
  return null;
}

String? passwordValidatorLogIn(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}

// todo(ahmed): update this function to handle more cases
String? confirmPasswordValidation(String? password, String? confirmedPassword) {
  if (password!.isEmpty || confirmedPassword!.isEmpty) return null;
  if (password != confirmedPassword) return 'Passwords do not match.';
  return null;
}

bool isKeyboardOpen(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom != 0;
}

void showSnackBarMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Center(
          child: Text(message),
        ),
      ),
    );
}

void showToastMessage(String message) async {
  await Fluttertoast.cancel();
  Fluttertoast.showToast(msg: message);
}

String formatPhoneNumber(String phoneNumber) {
  // Ensure the input has the right length and starts with the correct prefix.
  if (phoneNumber.length == 13 && phoneNumber.startsWith("+20")) {
    return "${phoneNumber.substring(0, 3)} " // +20
        "${phoneNumber.substring(3, 6)} " // 109
        "${phoneNumber.substring(6)}"; // 3401932
  }
  return phoneNumber; // Return the original if it doesn't match the format.
}

String toSnakeCase(String input) {
  // Convert to lowercase and replace spaces with underscores
  String snakeCased = input.toLowerCase().replaceAll(RegExp(r'[\s]+'), '_');

  // Replace any non-alphanumeric characters with underscores
  snakeCased = snakeCased.replaceAll(RegExp(r'[^a-z0-9_]+'), '_');

  // Remove leading or trailing underscores
  return snakeCased.replaceAll(RegExp(r'^_+|_+$'), '');
}
