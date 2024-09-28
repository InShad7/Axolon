import 'package:axolon/app/modules/home/controller/home_controller.dart';
import 'package:axolon/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../add_contact/model/person_model.dart';
import 'contacts_card.dart';

class ContactsBuilder extends StatelessWidget {
  const ContactsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return controller.contactList.isNotEmpty
            ? ListView.builder(
                itemCount: controller.contactList.length,
                itemBuilder: (context, index) {
                  PersonModel person = controller.contactList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        Routes.CONTACTSCREEN,
                        arguments: person,
                      );
                    },
                    child: ContactCard(
                      name: person.name,
                      email: person.email,
                      image: person.image,
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                  'No contacts available, please add a contact',
                ),
              );
      },
    );
  }
}
