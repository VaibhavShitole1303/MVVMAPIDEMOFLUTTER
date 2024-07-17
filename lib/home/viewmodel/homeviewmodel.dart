import 'package:flutter/cupertino.dart';

import '../../network/api_service.dart';
import '../../utils/api_response.dart';
import '../../utils/print_util.dart';
import '../model/home_response.dart';

class HomeViewModel extends ChangeNotifier {


  final ApiService apiService = ApiService();


  late ApiResponse<HomeResponse> homeResponse;

  Future<ApiResponse> getHomeDate() async {
    try {
      final data = await apiService.getHomeDate();
      printResponse("homeResponse", data.toJson().toString(), false);
      homeResponse = ApiResponse.completed(data);
      notifyListeners();
    } catch (e) {
      printResponse("homeResponse", e.toString(), true);
      homeResponse = ApiResponse.error(e.toString());
    }
    if (homeResponse.status == Status.COMPLETED ||
        homeResponse.status == Status.ERROR) {
      return homeResponse;
    } else {
      return ApiResponse(Status.LOADING, "", "loading...");
    }
  }

}