import 'package:get/get.dart';
import 'package:flutter/services.dart' as service;
import 'dart:convert';
import 'package:fruits/app/modules/home/fruits_model.dart';

class HomeController extends GetxController {
  Future<List<Fruits>> readFruitsData() async {
    final jsonData =
        await service.rootBundle.loadString('assets/models/Fruits.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => Fruits.fromJson(e)).toList();
  }
}
