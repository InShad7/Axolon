import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../controller/search_controller.dart';

class SearchTexField extends StatelessWidget {
  const SearchTexField({
    super.key,
    required this.controller,
  });

  final ContactSearchController controller;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: width / 8,
      margin: EdgeInsets.only(
        left: width * 0.04,
        right: width * 0.04,
        top: width * 0.04,
        bottom: width * 0.02,
      ),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 2,
          color: CustomColors.fadedblack,
        ),
      ),
      child: TextFormField(
        autofocus: true,
        controller: controller.searchController,
        cursorColor: CustomColors.darkBlue,
        style: const TextStyle(color: CustomColors.darkBlue),
        decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(minWidth: width * 0.1),
          prefixIcon: Icon(
            Icons.search,
            color: CustomColors.fadedblack,
            size: width * 0.055,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: CustomColors.fadedblack,
              size: width * 0.055,
            ),
            onPressed: controller.clearField,
          ),
          filled: true,
          fillColor: CustomColors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: 'Search by name, email, number, group...',
          contentPadding: EdgeInsets.symmetric(
            horizontal: width * 0.01,
          ),
        ),
        onChanged: (value) async {
          await controller.searchOnChanged(value);
        },
      ),
    );
  }
}
