import 'package:get/get.dart';
import '../tampilan_depan_controller.dart';
import '../tampilan_depan_screen.dart';
import '../home_controller.dart';
import '../home_screen.dart';


// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String tampilanDepanScreen = '/tampilan_depan_screen';

  static const String homeScreen = '/home_screen';

  static const String homeinitialPage = '/home_initial_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: tampilanDepanScreen,
      page: () => TampilanDepanScreen(),
      bindings: [TampilanDepanBinding()],
    ),GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => TampilanDepanScreen(),
      bindings: [TampilanDepanBinding()],
    )
  ];
}
