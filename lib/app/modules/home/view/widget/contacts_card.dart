import 'dart:io';

import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.name,
    required this.email,
    required this.image,
  });

  final String name;
  final String email;
  final String image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: width * 0.01,
      ),
      child: ListTile(
        leading: (image.isNotEmpty || image != '')
            ? CircleAvatar(
                radius: width * 0.065,
                backgroundImage: FileImage(
                  File(
                    image,
                  ),
                ),
              )
            : CircleAvatar(
                radius: width * 0.06,
                child: Text(
                  name.isNotEmpty ? name[0] : 'N',
                ),
              ),
        title: Text(name),
        subtitle: Text(email),
      ),
    );
  }
}
