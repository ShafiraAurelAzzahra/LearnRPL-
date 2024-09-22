import 'package:get/get.dart';

/// This class defines the variables used in the [tampilan_depan_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TampilanDepanModel {}

/// A controller class for the TampilanDepanScreen.
///
/// This class manages the state of the TampilanDepanScreen, including the
/// current tampilanDepanModelObj
class TampilanDepanController extends GetxController {
  Rx<TampilanDepanModel> tampilanDepanModelObj = TampilanDepanModel().obs;
}

/// A binding class for the TampilanDepanScreen.
///
/// This class ensures that the TampilanDepanController is created when the
/// TampilanDepanScreen is first loaded.
class TampilanDepanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TampilanDepanController());
  }
}
