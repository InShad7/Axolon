import 'package:axolon/app/modules/contact_screen/controller/contact_screen_controller.dart';
import 'package:axolon/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/contact_app_bar.dart';
import 'widget/contacts_cards.dart';
import 'widget/img_name_card.dart';

class ContactScreen extends GetView<ContactScreenController> {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      appBar: ContactScreenAppBar(controller: controller),
      body: GetBuilder<ContactScreenController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ImageAndNameWidget(
                  name: controller.person.name,
                  image: controller.person.image,
                ),
                ContactDetailsCard(
                  title: controller.person.phone,
                  subTitle: 'Telephone',
                  leadingIcon: Icons.phone,
                  isTrailIcon: true,
                  trailingIcon: Icons.message,
                ),
                ContactDetailsCard(
                  title: controller.person.email,
                  subTitle: 'Email',
                  leadingIcon: Icons.mail_outline,
                  trailingIcon: Icons.message,
                ),
                ContactDetailsCard(
                  title: controller.person.group,
                  subTitle: 'Group',
                  leadingIcon: Icons.group,
                  trailingIcon: Icons.message,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
