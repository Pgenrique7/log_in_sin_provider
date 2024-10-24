import 'dart:convert';

class LogIn {
    final String id;
    final String nombre;
    final String clave;

    LogIn({
        required this.id,
        required this.nombre,
        required this.clave,
    });

    factory LogIn.fromRawJson(String str) => LogIn.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LogIn.fromJson(Map<String, dynamic> json) => LogIn(
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
