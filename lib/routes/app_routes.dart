import 'package:get/get.dart'; 
// Mengimpor GetX untuk manajemen state, routing, dan dependency injection.

import '../tampilan_depan_controller.dart'; 
// Mengimpor controller untuk halaman tampilan depan.
import '../tampilan_depan_screen.dart'; 
// Mengimpor tampilan untuk halaman tampilan depan.

import '../home_controller.dart'; 
// Mengimpor controller untuk halaman home.
import '../home_screen.dart'; 
// Mengimpor tampilan untuk halaman home.

class AppRoutes {
  // Kelas yang berisi daftar route dan navigasi aplikasi.

  static const String tampilanDepanScreen = '/tampilan_depan_screen'; 
  // Mendefinisikan route untuk halaman Tampilan Depan.

  static const String homeScreen = '/home_screen'; 
  // Mendefinisikan route untuk halaman Home.

  static const String homeinitialPage = '/home_initial_page'; 
  // Mendefinisikan route untuk halaman awal Home (belum digunakan dalam daftar `pages`).

  static const String appNavigationScreen = '/app_navigation_screen'; 
  // Mendefinisikan route untuk navigasi aplikasi (belum digunakan dalam daftar `pages`).

  static const String initialRoute = '/initialRoute'; 
  // Mendefinisikan route awal aplikasi, yaitu tampilan depan (TampilanDepanScreen).

  static List<GetPage> pages = [
    // Daftar `GetPage` yang berisi route-route yang akan digunakan untuk navigasi dalam aplikasi.

    GetPage(
      name: tampilanDepanScreen, 
      // Route name untuk halaman Tampilan Depan.

      page: () => TampilanDepanScreen(), 
      // Fungsi yang mengembalikan instance dari TampilanDepanScreen.

      bindings: [TampilanDepanBinding()], 
      // Mendefinisikan binding yang digunakan untuk halaman ini, mengatur dependency injection untuk `TampilanDepanScreen`.
    ),

    GetPage(
      name: homeScreen, 
      // Route name untuk halaman Home.

      page: () => HomeScreen(), 
      // Fungsi yang mengembalikan instance dari HomeScreen.

      bindings: [HomeBinding()], 
      // Mendefinisikan binding yang digunakan untuk halaman ini, mengatur dependency injection untuk `HomeScreen`.
    ),

    GetPage(
      name: initialRoute, 
      // Route name untuk route awal aplikasi.

      page: () => TampilanDepanScreen(), 
      // Mengembalikan instance dari TampilanDepanScreen sebagai halaman awal aplikasi.

      bindings: [TampilanDepanBinding()], 
      // Binding yang digunakan untuk halaman awal aplikasi.
    ),
  ];
}
