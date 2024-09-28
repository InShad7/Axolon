import 'dart:developer';

import 'package:axolon/app/modules/add_contact/model/person_model.dart';
import 'package:axolon/app/modules/contact_screen/controller/contact_screen_controller.dart';
import 'package:axolon/app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddContactController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController groupController = TextEditingController();

  String pickedImg = '';

  late PersonModel person;

// assign the data for edit screen
  assignData() {
    // retrieve the arguments passed from the ContactScreen
    final Map<String, dynamic> args = Get.arguments ?? {};
    final bool isEdit = args['isEdit'] ?? false;

    //isEdit is true then assign
    if (isEdit) {
      person = args['person'];
      // log('data: $person');
      nameController.text = person.name;
      emailController.text = person.email;
      numberController.text = person.phone;
      groupController.text = person.group;
      pickedImg = person.image;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    groupController.dispose();
    pickedImg = '';
    super.onClose();
  }

// fun to pick an image from gallery
  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      pickedImg = image.path.toString();
    }

    update();
    log('image picked: $pickedImg');
  }

//choose edit or add contact
  editOrSave() {
    final Map<String, dynamic> args = Get.arguments ?? {};

    final isEdit = args['isEdit'] ?? false;
    final id = args['id'] ?? '';

    if (isEdit) {
      editContact(id);
    } else {
      saveContact();
    }
    homeController.saveConctactList();
  }

//fun to save the contact
  void saveContact() {
    try {
      if (formKey.currentState!.validate()) {
        final data = PersonModel(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          phone: numberController.text.trim(),
          group: groupController.text.trim(),
          image: pickedImg.toString().trim(),
        );

        homeController.addContact(data);
        // log('contact added: ${homeController.contactList}');
        Fluttertoast.showToast(msg: 'Contact added successfully');

        // log('Contact saved');

        Get.back();
      } else {
        Fluttertoast.showToast(msg: 'Please enter valid credentials');
        // log('Please enter valid credentials');
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Something went wrong! Please try again later');
      // log('error adding contact $e');
    }
    update();
  }

//fun to delete contact by id
  deleteContact(String id) {
    try {
      homeController.contactList.removeWhere((contact) => contact.id == id);
      homeController.update();
      Get.back();
      homeController.saveConctactList();
      Fluttertoast.showToast(msg: 'Deleted');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Try again later');
      log('Contact not deleted: $e');
    }
  }

//fun to edit the contact by id
  void editContact(String id) {
    try {
      final contact =
          homeController.contactList.firstWhere((contact) => contact.id == id);
      // update contact details
      contact.name = nameController.text.toString().trim();
      contact.email = emailController.text.toString().trim();
      contact.phone = numberController.text.toString().trim();
      contact.group = groupController.text.toString().trim();
      contact.image = pickedImg;

      homeController.update();
      ContactScreenController contactScreenController =
          Get.find<ContactScreenController>();
      contactScreenController.update();
      contactScreenController contactScreenController =
          Get.find<ContactScreenController>();
      contactScreenController.update();
      Get.back();
      Fluttertoast.showToast(msg: 'Updated');
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Something went wrong! Please try again later');
      log('Contact not found: $e');
    }
  }
}
