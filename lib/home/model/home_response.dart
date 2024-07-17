import 'dart:convert';

class HomeResponse {
  int status;
  String message;
  List<CityResult> result;

  HomeResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  factory HomeResponse.fromRawJson(String str) => HomeResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    status: json["status"],
    message: json["message"],
    result: List<CityResult>.from(json["result"].map((x) => CityResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class CityResult {
  int id;
  String cityName;

  CityResult({
    required this.id,
    required this.cityName,
  });

  factory CityResult.fromRawJson(String str) => CityResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityResult.fromJson(Map<String, dynamic> json) => CityResult(
    id: json["id"],
    cityName: json["city_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_name": cityName,
  };
}

