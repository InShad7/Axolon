import 'package:axolon/app/modules/add_contact/controller/add_contact_controller.dart';
import 'package:get/get.dart';

class AddContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddContactController>(
      () => AddContactController(),
    );
  }
}
