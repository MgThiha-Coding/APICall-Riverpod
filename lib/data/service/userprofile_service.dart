import 'package:api_call/const/api_const.dart';
import 'package:api_call/data/model/userprofile_model.dart';
import 'package:dio/dio.dart';

class UserprofileService {
  final Dio _dio = Dio();
  Future<List<UserProfileModel>> getData() async {
    final Uri uri = Uri.parse('${ApiConst.baseUrl}${ApiConst.all}');
    final Response response = await _dio.getUri(uri);
    final List<dynamic> results = response.data['results'] as List<dynamic>;
    return results.map((data) {
      return UserProfileModel.fromJson(data as Map<String, dynamic>);
    }).toList();
  }
}
