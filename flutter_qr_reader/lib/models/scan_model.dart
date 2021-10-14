import 'dart:convert';

ScanModel searchResponseFromJson(String str) =>
    ScanModel.fromJson(json.decode(str));
String searchResponseToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) {
    type = value.contains('http') ? 'http' : 'geo';
  }

  int? id;
  String? type;
  String value;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };
}
