import 'package:cook_project/models/login_model.dart';
import 'package:cook_project/pages/add_Meal.dart';
import 'package:cook_project/resources/String_app.dart';
import 'package:cook_project/services/login-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

String? token;

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 812,
          width: 375,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Container(
                height: 230,
                width: 375,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/3.jpg'), fit: BoxFit.fill),
                ),
                child: Center(
                  child: Text(
                    AppString().Welcome_Back,
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 32),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: AppString().E_mail,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF9D9FA0),
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    hintStyle:
                        TextStyle(color: Color(0xFF9D9FA0), fontSize: 16)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //.....
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      size: 23,
                      color: Color(0xFF9D9FA0),
                    ),
                    hintText: AppString().Password,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF9D9FA0),
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    hintStyle:
                        TextStyle(color: Color(0xFF9D9FA0), fontSize: 16)),
                obscuringCharacter: '*',
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  AppString().forget_password,
                  style: TextStyle(color: Color(0xFF7D8FAB), fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFA9A0C),
                  minimumSize: Size(327, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () async {
                var temp = await login(
                  LoginModel(
                    email: email.text,
                    password: password.text,
                  ),
                );
                if (temp is String) {
                  token = temp;
                  print('login success');
                  print("temp is $temp");

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddMeal(),
                    ),
                  );
                } else {
                  print('login faild');
                  print("temp is $temp");
                }
                ;
              },
              child: Text(
                AppString().Sign_in,
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 24),
              ),
            ),
            SizedBox(
              height: 43,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: AppString().Donot_have_an_account,
                    style: TextStyle(
                      color: Color(0xFF7D8FAB),
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: AppString().Sign_up,
                    style: TextStyle(
                        color: Color(0xFFFA9A0C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ]))
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
