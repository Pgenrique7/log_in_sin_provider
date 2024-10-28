import 'package:dio/dio.dart';
import 'package:log_aplication/infraestructure/models/LogIn_models.dart';

class LogInRepository {
  final Dio dio = Dio();
  late List<Usuario> usuarios;

  Future<List<Usuario>> getLogInParams() async {
    try {
      final response = await dio.get(
        'https://opensheet.elk.sh/1jBewLl-1zdAIdiGeXv-ltMrEterezIBzKDcLaurcGko/usuarios',
      );

      final List<dynamic> data = response.data;
      usuarios = data.map((userJson) => Usuario.fromJson(userJson)).toList();

      return usuarios;
    } catch (e) {
      throw Exception('Error al obtener datos de usuarios: $e');
    }
  }
}
