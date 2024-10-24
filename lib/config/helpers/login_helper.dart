import 'package:dio/dio.dart';
import 'package:log_aplication/infraestructure/models/LogIn_models.dart';

class LogInRepository {
  final Dio dio = Dio();
   


  Future<LogIn?> getLogInParams() async {

      final response = await dio.get('https://opensheet.elk.sh/1jBewLl-1zdAIdiGeXv-ltMrEterezIBzKDcLaurcGko/usuarios');


      if (response.statusCode == 200 && response.data != null && response.data.isNotEmpty) {
        final logInData = response.data[0];
        return logInData;
      } else {
        return null; 
      }

  }
}