import 'dart:io';

import 'package:flutter/material.dart';

Future<dynamic> viewImageWidget({context, image}) {
  double width = MediaQuery.of(context).size.width;
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.all(width / 10),
        width: width,
        height: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: FileImage(
              File(
                image,
              ),
            ),
            fit: BoxFit.contain,
          ),
        ),
      );
    },
  );
}
