// To parse this JSON data, do
//
//     final authenticationM = authenticationMFromJson(jsonString);

import 'dart:convert';

AuthenticationM authenticationMFromJson(String str) => AuthenticationM.fromJson(json.decode(str));

String authenticationMToJson(AuthenticationM data) => json.encode(data.toJson());

class AuthenticationM {
    bool valid;
    String message;
    String conductor;
    String dni;
    String ruc;

    AuthenticationM({
        required this.valid,
        required this.message,
        required this.conductor,
        required this.dni,
        required this.ruc,
    });

    factory AuthenticationM.fromJson(Map<String, dynamic> json) => AuthenticationM(
        valid: json["valid"],
        message: json["message"],
        conductor: json["CONDUCTOR"],
        dni: json["DNI"],
        ruc: json["RUC"],
    );

    Map<String, dynamic> toJson() => {
        "valid": valid,
        "message": message,
        "CONDUCTOR": conductor,
        "DNI": dni,
        "RUC": ruc,
    };
}
