import 'dart:developer';
import 'package:cook_project/pages/login_in_pages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool SwitchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 812,
          width: 375,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/1.png"), fit: BoxFit.fill)),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset("images/2.png"),
              SizedBox(
                height: 54,
              ),
              Text(
                "Please choose your language",
                style: TextStyle(color: Color(0xFF1E1E1E), fontSize: 24),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (context.locale.languageCode == 'ar') {
                          context.setLocale(Locale('en'));
                        }
                        // else {
                        //   context.setLocale(Locale('en'));
                        // }
                        log(context.locale.languageCode);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Container(
                        height: 48,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Color(0xFF111111),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          'English',
                          style:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 24),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 47,
                    ),
                    InkWell(
                      onTap: () {
                        if (context.locale.languageCode == 'en') {
                          context.setLocale(Locale('ar'));
                        }
                        // else {
                        //   context.setLocale(Locale('en'));
                        // }
                        log(context.locale.languageCode);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Container(
                        height: 48,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Color(0xFF111111),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          'العربية',
                          style:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 24),
                        )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
