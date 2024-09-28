import 'package:axolon/app/routes/app_pages.dart';
import 'package:axolon/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/contacts_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      appBar: AppBar(
        backgroundColor: CustomColors.darkBlue,
        title: const Text('Contacts'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.SEARCHSCREEN);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: const ContactsBuilder(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.darkBlue,
        onPressed: () {
          Get.toNamed(Routes.ADDCONTACTSCREEN);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
