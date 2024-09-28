import 'dart:convert';
import 'dart:developer';

import 'package:axolon/app/modules/add_contact/model/person_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  List<PersonModel> contactList = [];

  @override
  void onInit() {
    loadConctactList();
    super.onInit();
  }

// fun to add the contact
  void addContact(PersonModel contact) {
    // log('inside home $contact');
    contactList.add(contact);
    update();
  }

  Future saveConctactList() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('contacts', jsonEncode(contactList));
  }

  Future loadConctactList() async {
    final pref = await SharedPreferences.getInstance();
    final contactJson = pref.getString('contacts');

    if (contactJson != null) {
      List data = jsonDecode(contactJson);
      log('inside load $data');
      contactList = data.map((e) => PersonModel.fromJson(e)).toList();
      update();
    }
    return [];
  }
}
