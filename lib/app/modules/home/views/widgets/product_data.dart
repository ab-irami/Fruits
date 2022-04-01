import 'package:flutter/material.dart';
import 'package:fruits/app/modules/chat/views/chat_view.dart';
import 'package:fruits/app/modules/home/controllers/home_controller.dart';
import 'package:fruits/app/modules/home/fruits_model.dart';
import 'package:fruits/app/modules/home/views/widgets/text_widget.dart';
import 'package:fruits/constants.dart';
import 'package:get/get.dart';

class ProductData extends StatelessWidget {
  const ProductData({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomeController().readFruitsData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text('Something went wrong'));
        } else if (data.hasData) {
          var items = data.data as List<Fruits>;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(
                          ChatView(
                            index: index,
                            sellerName: items[index].seller,
                            product: items[index].product,
                            price: items[index].price,
                            variety: items[index].variety,
                          ),
                        );
                      },
                      child: Container(
                        child: Text('${items[index].seller}'),
                        height: 40,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: barColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              color: lightGrey,
                              blurRadius: 3.0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        color: productDetailBgColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            color: lightGrey,
                            blurRadius: 3.0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextWidget(
                                  name: '${items[index].product}',
                                  title: 'Product',
                                ),
                                TextWidget(
                                  name: '${items[index].variety}',
                                  title: 'Variety',
                                ),
                                Text(
                                  '₹45.5k',
                                  style: TextStyle(
                                    color: green,
                                    backgroundColor:
                                        Color(0xFF212121).withOpacity(.08),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                TextWidget(
                                  name: '${items[index].avgWeight}',
                                  title: 'Avg Weight',
                                ),
                                TextWidget(
                                  name: '${items[index].perBox}',
                                  title: 'Per Box',
                                ),
                                TextWidget(
                                  name: '${items[index].boxes}',
                                  title: 'Boxes',
                                ),
                                TextWidget(
                                  name: '${items[index].delivery}',
                                  title: 'Delivery',
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: green),
          );
        }
      },
    );
  }
}
