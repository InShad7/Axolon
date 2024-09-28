import 'dart:io';

import 'package:axolon/app/modules/add_contact/controller/add_contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<AddContactController>(
      builder: (controller) => GestureDetector(
        onTap: controller.pickImage,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: CustomColors.bgColor,
                radius: width * 0.2,
                backgroundImage: controller.pickedImg != ''
                    ? FileImage(File(controller.pickedImg))
                    : const AssetImage('assets/dp.jpg') as ImageProvider,
              ),
            ),
            const Positioned(
              bottom: 10,
              top: 20,
              right: 50,
              left: 50,
              child: Icon(
                Icons.photo_camera_outlined,
                color: CustomColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
