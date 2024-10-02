// To parse this JSON data, do
//
//     final webModelo = webModeloFromJson(jsonString);

import 'dart:convert';

List<WebModelo> webModeloFromJson(String str) => List<WebModelo>.from(json.decode(str).map((x) => WebModelo.fromJson(x)));

String webModeloToJson(List<WebModelo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WebModelo {
    int userId;
    int id;
    String title;
    String body;

    WebModelo({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory WebModelo.fromJson(Map<String, dynamic> json) => WebModelo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
