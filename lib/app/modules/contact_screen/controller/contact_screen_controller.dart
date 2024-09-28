import 'package:get/get.dart';

import '../../add_contact/model/person_model.dart';

class ContactScreenController extends GetxController {


  late PersonModel person;

  @override
  void onInit() {
    super.onInit();
    person = Get.arguments;
  }
 
}