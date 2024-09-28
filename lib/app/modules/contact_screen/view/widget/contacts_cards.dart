import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class ContactDetailsCard extends StatelessWidget {
  const ContactDetailsCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.leadingIcon,
    this.trailingIcon = Icons.message,
    this.isTrailIcon = false,
  });

  final String title;
  final String subTitle;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final bool isTrailIcon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: width * 0.015,
      ),
      decoration: BoxDecoration(
        color: CustomColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(leadingIcon),
        ),
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: isTrailIcon ? Icon(trailingIcon) : const SizedBox.shrink(),
      ),
    );
  }
}
