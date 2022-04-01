import 'package:flutter/material.dart';
import 'package:fruits/app/modules/home/fruits_model.dart';
import 'package:fruits/app/modules/home/views/widgets/bottom_sheet_icon.dart';
import 'package:fruits/app/modules/home/views/widgets/horizontal_scroll_view.dart';
import 'package:fruits/app/modules/home/views/widgets/product_data.dart';
import 'package:fruits/constants.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:search_page/search_page.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Buy',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: primaryColor,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: barColor,
                      child: TextField(
                        onTap: () async {
                          showSearch(
                            context: context,
                            delegate: SearchPage<Fruits>(
                              barTheme: ThemeData(
                                inputDecorationTheme: InputDecorationTheme(
                                    focusedBorder: InputBorder.none),
                                appBarTheme: AppBarTheme(
                                  iconTheme: IconThemeData(color: Colors.black),
                                  backgroundColor: primaryColor,
                                ),
                              ),
                              items: await HomeController().readFruitsData(),
                              searchLabel: 'Search fruit',
                              suggestion: Center(
                                child: Text('Search fruits here'),
                              ),
                              failure: Center(
                                child: Text('No fruits found :('),
                              ),
                              filter: (fruit) => [
                                fruit.product,
                                fruit.price.toString(),
                              ],
                              builder: (fruit) => ListTile(
                                title: Text(fruit.product!),
                                subtitle: Text(fruit.variety!),
                                trailing: Text('${fruit.price}'),
                              ),
                            ),
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'Search here',
                          labelText: 'Search Fruits',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: lightGrey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          height: 200,
                          padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                          child: Wrap(
                            children: [
                              IconWidget(text: 'Name'),
                              Divider(color: lightGrey),
                              IconWidget(text: 'Price')
                            ],
                          ),
                        ),
                        backgroundColor: barColor,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(                  
        children: [
          Container(child: HoriZontalScrollView(), height: 120),
          Expanded(child: ProductData()),
        ],
      ),
    );
  }
}


