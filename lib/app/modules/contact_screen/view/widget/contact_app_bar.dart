import 'package:axolon/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../add_contact/controller/add_contact_controller.dart';
import '../../controller/contact_screen_controller.dart';
import 'delete_popup.dart';

class ContactScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ContactScreenAppBar({
    super.key,
    required this.controller,
  });

  final ContactScreenController controller;
  @override
  final Size preferredSize = const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.darkBlue,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            deletePopUp(
              context: context,
              name: controller.person.name,
              onPressed: () {
                final deleteController = Get.put(AddContactController());
                deleteController.deleteContact(controller.person.id);
                Get.back();
              },
            );
          },
          icon: const Icon(Icons.delete_outline),
        ),
        IconButton(
          onPressed: () {
            final addController = Get.put(AddContactController());
            Get.toNamed(
              Routes.ADDCONTACTSCREEN,
              arguments: {
                'person': controller.person,
                'isEdit': true,
                'id': controller.person.id,
              },
            );
            addController.assignData();
          },
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }
}
