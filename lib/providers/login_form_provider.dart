import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = "";
  String password = "";

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... Login');
      return true;
    } else {
      print('Form no valid');
      return false;
    }
  }
}