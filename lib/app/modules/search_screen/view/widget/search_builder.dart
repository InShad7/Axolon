import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../add_contact/model/person_model.dart';
import '../../../home/view/widget/contacts_card.dart';
import '../../controller/search_controller.dart';

class SearchBuilderWidget extends StatelessWidget {
  const SearchBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactSearchController>(
      builder: (controller) {
        return Expanded(
          child: controller.searchResults.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.searchResults.length,
                  itemBuilder: (context, index) {
                    PersonModel person = controller.searchResults[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.CONTACTSCREEN,
                          arguments: person,
                        );
                      },
                      child: ContactCard(
                        name: person.name,
                        email: person.email,
                        image: person.image,
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text('No match found'),
                ),
        );
      },
    );
  }
}
