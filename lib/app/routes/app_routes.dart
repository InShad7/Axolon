part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ADDCONTACTSCREEN = _Paths.ADDCONTACTSCREEN;
  static const CONTACTSCREEN = _Paths.CONTACTSCREEN;
  static const SEARCHSCREEN = _Paths.SEARCHSCREEN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = "/home";
  static const ADDCONTACTSCREEN = "/addContactScreen";
  static const CONTACTSCREEN = "/contactScreen";
  static const SEARCHSCREEN = "/searchScreen";
}
