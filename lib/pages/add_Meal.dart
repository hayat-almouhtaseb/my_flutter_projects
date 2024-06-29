import 'package:cook_project/models/get_meal_model.dart';
import 'package:cook_project/services/get_menu-servive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddMeal extends StatelessWidget {
  List<MenueModel> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getMenu(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            searchResult = snapshot.data!;
            return StatefulBuilder(builder: (context, setstate) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "search",
                          hintStyle: TextStyle(color: Color(0xFFFA9A0C)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFFFA9A1C),
                            size: 20,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onChanged: (value) {
                        searchResult = [];
                        setstate(() {
                          snapshot.data!.forEach((element) {
                            if (element.name.contains(value)) {
                              searchResult.add(element);
                            }
                          });
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: searchResult!.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(searchResult![index].name),
                        leading: Image.network(
                            searchResult[index].images[0].toString()),
                        subtitle: Text(searchResult![index].description),
                        trailing: Text(searchResult![index].price.toString()),
                      ),
                    ),
                  ),
                ],
              );
            });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
