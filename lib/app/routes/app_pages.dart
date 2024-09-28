import 'package:axolon/app/modules/add_contact/bindings/add_contact_bindings.dart';
import 'package:axolon/app/modules/add_contact/view/add_contact_screen.dart';
import 'package:axolon/app/modules/contact_screen/bindings/contacts_screen_bindings.dart';
import 'package:axolon/app/modules/contact_screen/view/contact_screen.dart';
import 'package:axolon/app/modules/home/view/home_screen.dart';
import 'package:axolon/app/modules/search_screen/bindings/search_binding.dart';
import 'package:axolon/app/modules/search_screen/view/search_screen.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_bindings.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADDCONTACTSCREEN,
      page: () => const AddContactScreen(),
      binding: AddContactBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTSCREEN,
      page: () => const ContactScreen(),
      binding: ContactsScreenBindings(),
    ),
    GetPage(
      name: _Paths.SEARCHSCREEN,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),
    
  ];
}
