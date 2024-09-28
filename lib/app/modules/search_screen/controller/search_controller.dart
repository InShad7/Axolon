import 'package:axolon/app/modules/add_contact/model/person_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';

class ContactSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  HomeController homeController = Get.find<HomeController>();

  List<PersonModel> searchResults = [];

  @override
  void onInit() {
    searchResults = homeController.contactList;
    super.onInit();
  }


//if the search controller have value it search else clear
  Future<void> searchOnChanged(String value) async {
    if (value.isNotEmpty) {
      searchContent(value: value);
    } else {
      searchController.clear();
      searchResults = homeController.contactList;
    }
    update();
  }

//search by name, number, email, group.
  searchContent({required String value}) async {
    searchResults = homeController.contactList.where((item) {
      String searchText = item.name.toLowerCase() +
          item.email.toLowerCase() +
          item.phone.toLowerCase() +
          item.group.toLowerCase();

      // log(searchText.contains(value.toLowerCase()).toString());

      // Check if the search text contains the search value
      return searchText.contains(value.toLowerCase());
    }).toList();

    update();
  }

// search controller is not empty then clear the controller tap again to go back
  void clearField() {
    searchController.text.isNotEmpty ? searchController.clear() : Get.back();

    searchResults = homeController.contactList;
    update();
  }
}
