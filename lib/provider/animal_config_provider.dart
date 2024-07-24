import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import '../models/animal_config_model.dart';

class AnimalConfig {
  // Singlton
  AnimalConfig._internal();
  static final AnimalConfig _instance = AnimalConfig._internal();
  factory AnimalConfig() => _instance;

  static late MarineAnimalConfigModelList marineAnimalList;

  static Future<void> loadConfigFromFile(String filePath) async {
    // final file = File(filePath);
    // final jsonString = await file.readAsString();
    final jsonString = await rootBundle.loadString(filePath);
    final jsonData = json.decode(jsonString);
    marineAnimalList = MarineAnimalConfigModelList.fromJson(jsonData);
  }

  List<MarineAnimalConfigModel> get animals => marineAnimalList.marineAnimals;

  static MarineAnimalConfigModel? getAnimal(String name) {
    try {
      return marineAnimalList.marineAnimals
          .firstWhere((animal) => animal.name == name);
    } catch (e) {
      return null;
    }
  }
}
