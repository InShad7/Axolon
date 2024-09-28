import 'package:axolon/app/modules/add_contact/controller/add_contact_controller.dart';
import 'package:axolon/app/utils/colors.dart';
import 'package:axolon/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/custom_btn.dart';
import 'widget/custom_text_field.dart';
import 'widget/user_img_widget.dart';

class AddContactScreen extends GetView<AddContactController> {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      appBar: AppBar(
        backgroundColor: CustomColors.darkBlue,
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KConstant.kHeight20,
              const UserImageWidget(),
              CustomTextField(
                title: 'Name',
                icon: Icons.person,
                controller: controller.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              CustomTextField(
                title: 'Email',
                icon: Icons.email_outlined,
                keyBoardType: TextInputType.emailAddress,
                controller: controller.emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  String pattern =
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                  RegExp regex = RegExp(pattern);

                  if (!regex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              CustomTextField(
                title: 'Number',
                icon: Icons.pin_outlined,
                keyBoardType: TextInputType.number,
                maxLength: 10,
                controller: controller.numberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  } else if (value.length < 10) {
                    return 'Please provide a valid number';
                  }
                  return null;
                },
              ),
              CustomTextField(
                title: 'Group',
                icon: Icons.group,
                controller: controller.groupController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a group';
                  }
                  return null;
                },
              ),
              KConstant.kHeight70,
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: CustomColors.bgColor,
        child: CustomBtn(
          title: 'Save',
          onPressed: () {
            controller.editOrSave();
          },
          color: CustomColors.darkBlue,
        ),
      ),
    );
  }
}
