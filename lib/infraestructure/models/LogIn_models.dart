import 'dart:convert';

class Usuario {
    final String id;
    final String nombre;
    final String clave;

    Usuario({
        required this.id,
        required this.nombre,
        required this.clave,
    });

    factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
