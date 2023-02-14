import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  LanguageController languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Localization'),),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.language_rounded,
              size: 40,
            ),
            title: const Text('Language'),
            subtitle: const Text('Select Language'),
            trailing: DropdownButton<String>(
                value: languageController.selectedLanguage,
                onChanged: (newValue) {
                  languageController.onSelected(newValue!);
                },
                elevation: 10,
                items: const [
                  DropdownMenuItem(
                    value: 'English',
                    child: Text(
                      "English",
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Spanish',
                    child: Text(
                      "Spanish",
                    ),
                  ),
                ]),


          ),
          Text('hello'.tr)
        ],
      ),
    );
  }
}
