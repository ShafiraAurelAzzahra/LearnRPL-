import 'package:flutter/material.dart'; // Mengimpor Material Design untuk membangun UI di Flutter.
import 'package:get/get.dart'; // Mengimpor GetX untuk manajemen state, routing, dan dependency injection.

class HomeModel {} // Membuat kelas model kosong sebagai template data yang akan digunakan oleh controller.

class HomeController extends GetxController { // Controller untuk mengatur logika dan data yang terhubung dengan UI.
  TextEditingController searchController = TextEditingController(); 
  // Controller untuk mengatur input teks pada TextField.

  Rx<HomeModel> homeModelObj = HomeModel().obs; 
  // Membuat objek HomeModel sebagai observasi (Rx) untuk memungkinkan reaktifitas data.

  @override
  void onClose() {
    super.onClose();
    searchController.dispose(); 
    // Menghapus controller untuk input teks ketika controller ini dihancurkan (menghindari memory leaks).
  }
}

class HomeBinding extends Bindings { 
  // Kelas untuk mendeklarasikan dependensi. Bindings mengelola lifecycle dependency injection di GetX.
  
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController()); 
    // Menggunakan Get.lazyPut untuk inisialisasi HomeController hanya ketika diperlukan.
  }
}
