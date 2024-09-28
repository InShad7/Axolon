import 'package:axolon/app/modules/search_screen/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactSearchController>(
      () => ContactSearchController(),
    );
  }
}
