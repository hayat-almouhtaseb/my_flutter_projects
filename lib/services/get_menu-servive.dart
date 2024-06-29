import 'package:cook_project/models/get_meal_model.dart';
import 'package:cook_project/pages/login_in_pages.dart';
import 'package:dio/dio.dart';

Future<List<MenueModel>> getMenu() async {
  Dio request = Dio();

  try {
    Response response = await request.get(
      "https://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals",
      options: Options(
        headers: {
          'token': 'FOODAPI $token',
        },
      ),
    );
    if (response.statusCode == 200) {
      List<MenueModel> Meal = [];
      for (var i = 0; i < response.data['meals'].length; i++) {
        MenueModel menueModel = MenueModel.fromMap(response.data['meals'][i]);

        Meal.add(menueModel);
      }
      return Meal;
    } else {
      print("error");
      return [];
    }
  } catch (e) {
    print("Exception");
    print(e);
    return [];
  }
}

Future<List<MenueModel>> searchMenuData({String lexem = ""}) async {
  Dio request = Dio();
  Response response = await request.get(
    "https://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals=${lexem}",
    options: Options(
      headers: {
        'token': 'FOODAPI $token',
      },
    ),
  );
  if (response.statusCode == 200) {
    List<MenueModel> Meal = [];
    for (var i = 0; i < response.data['meals'].length; i++) {
      MenueModel menueModel = MenueModel.fromMap(response.data['meals'][i]);

      Meal.add(menueModel);
    }
    return Meal;
  } else {
    print("error");
    return [];
  }
}
