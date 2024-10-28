import 'package:flutter/material.dart';
import 'package:log_aplication/infraestructure/models/LogIn_models.dart';
import 'package:log_aplication/config/helpers/login_helper.dart';

class UsuarioProvider extends ChangeNotifier {
  final LogInRepository _logInRepository = LogInRepository();
  List<Usuario> _usuarios = [];
  bool _isLoading = false;

  List<Usuario> get usuarios => _usuarios;
  bool get isLoading => _isLoading;

  Future<void> cargarUsuarios() async {
    _isLoading = true;
    notifyListeners();

    try {
      _usuarios = await _logInRepository.getLogInParams();
    } catch (e) {
      print("Error al cargar usuarios: $e");
      _usuarios = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  bool verificarCredenciales(String nombre, String clave) {
    return _usuarios.any((usuario) => 
      usuario.nombre == nombre && usuario.clave == clave);
  }
}
