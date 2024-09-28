import 'package:axolon/app/modules/contact_screen/controller/contact_screen_controller.dart';
import 'package:get/get.dart';

class ContactsScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactScreenController>(
      () => ContactScreenController(),
    );
  }
}
