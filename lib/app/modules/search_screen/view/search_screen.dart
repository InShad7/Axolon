import 'package:axolon/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/search_controller.dart';
import 'widget/search_builder.dart';
import 'widget/search_widget.dart';

class SearchScreen extends GetView<ContactSearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            SearchTexField(controller: controller),
            const SearchBuilderWidget(),
          ],
        ),
      ),
    );
  }
}
