import 'package:mvvm_demo/model/list_resource_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../resources/app_urls.dart';

class HomeRepository{
  BaseApiServices apiServices = NetworkApiService();
  Future<ListResourceModel> homeScreenApi() async {
    dynamic response = await apiServices.getApiResponse(AppUrl.homeUrl);
    try {
      return response= ListResourceModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}