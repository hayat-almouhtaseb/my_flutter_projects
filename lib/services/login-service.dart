import 'package:cook_project/models/login_model.dart';
import 'package:dio/dio.dart';

Future login(LoginModel loginModel) async {
  Dio dio = Dio();
  try {
    Response response = await dio.post(
      'https://food-api-omega.vercel.app/api/v1/chef/signin',
      data: loginModel.toMap(),
    );
    if (response.statusCode == 202) {
      return response.data['token'];
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
