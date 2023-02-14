import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:localization/string.dart';


class LanguageController extends GetxController {
  String? selectedValue;
  String? selectedLanguage;
  var localDB =  GetStorage();

  var language = <String>['English',"Spanish"];

  void onSelected(String value) {
    selectedValue = value;

    update();

    print(selectedValue);
    changeLanguage(selectedValue!);
  }

  changeLanguage(String selectedLanguage) async {
    switch (selectedLanguage) {
      case 'Spanish':
        Get.updateLocale(const Locale('es_ES'));
        print('Changed to Spanish');
        await localDB.write(Strings.language, selectedLanguage);
        break;

      default:
        await localDB.write(Strings.language, selectedLanguage);
        Get.updateLocale(const Locale('en_US'));
        print('Fallback to English');
        break;
    }
  }
}
