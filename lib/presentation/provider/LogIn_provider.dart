import 'package:flutter/material.dart';
import 'package:log_aplication/config/helpers/login_helper.dart';
import 'package:log_aplication/infraestructure/models/LogIn_models.dart';

class LogInProvider extends ChangeNotifier {
  final LogInRepository logInRepository = LogInRepository();

  LogIn? logIn; 

  Future<void> getLogInParams(String nombre) async {
    


  

  }
}