
import 'dart:convert';

List<Usuario> usuarioFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

class Usuario {
    final String id;
    final String nombre;
    final String clave;

    Usuario({
        required this.id,
        required this.nombre,
        required this.clave,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        clave: json["clave"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "clave": clave,
    };
}
