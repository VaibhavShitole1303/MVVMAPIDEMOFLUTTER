import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;

import '../home/model/home_response.dart';

class ApiService extends GetConnect {
  final String BASE_URL = "https://buyandsell.neosao.online/api";

  Future<HomeResponse> getHomeDate() async {
    final Uri uri = Uri.parse("$BASE_URL/customer/get_city").replace();

    final response = await http.get(
        uri,
      headers: {
        'Authorization': 'Bearer ${"6060|sjc19NnnO72LpthBacPOVwffmB2OAb8OQgDEK5i2"}',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final HomeResponse cityResponse = HomeResponse.fromJson(data);
      return cityResponse;
    } else {
      throw Exception('Failed to load city: ${response.body}');
    }
  }

}