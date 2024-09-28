import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import 'view_image.dart';

class ImageAndNameWidget extends StatelessWidget {
  const ImageAndNameWidget({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: width / 1.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: CustomColors.darkBlue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          (image.isNotEmpty || image != '')
              ? GestureDetector(
                  onTap: () {
                    viewImageWidget(
                      context: context,
                      image: image,
                    );
                  },
                  child: CircleAvatar(
                    radius: width * 0.2,
                    backgroundImage: FileImage(
                      File(
                        image,
                      ),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: width * 0.2,
                  child: Text(
                    name.isNotEmpty ? name[0] : 'N',
                    style: TextStyle(
                      fontSize: width * 0.15,
                    ),
                  ),
                ),
          Text(
            name,
            style: TextStyle(
              fontSize: width * 0.070,
              color: CustomColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
