import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, size: 32, color: Color(0XFF083791)),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hi Good People !',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0XFF083791)), // Text changed to blue
                          ),
                          Text('Welcome App LearnRPL', style: TextStyle(fontSize: 16, color: Color(0XFF083791))), // Text changed to blue
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: const Color(0XFF083791),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Hello',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Aplikasi ini adalah platform pembelajaran yang menyediakan materi lengkap untuk mempelajari Rekayasa Perangkat Lunak',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/images/img_rpl1_2.png', // Replace with your actual logo asset
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Search bar with blue color
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Color(0XFF083791)), // Hint text in blue
                      prefixIcon: const Icon(Icons.search, color: Color(0XFF083791)), // Icon in blue
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0XFF083791)), // Border in blue
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0XFF083791)), // Border when focused in blue
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: buildSingleItem('Materi', 'Pengenalan', 'assets/images/img_premium_vector.png', const Color(0XFF083791)), // Title color blue
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: buildSingleItem('Quiz', 'Pengenalan', 'assets/images/img_premium_vector_114x152.png', const Color(0XFF083791)), // Title color blue
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // Manage index with state for active tab
          onTap: (index) {
            // Handle navigation between pages
          },
          selectedItemColor: const Color(0XFF083791), // Blue color for selected items
          unselectedItemColor: const Color(0XFF083791), // Blue color for unselected items as well
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Materi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz),
              label: 'Quiz',
            ),
          ],
        ),
      ),
    );
  }

  // Added color parameter to change title color dynamically
  Widget buildSingleItem(String title, String item, String imagePath, Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: titleColor), // Title color from parameter
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 3,
          child: SizedBox(
            height: 150, // Adjusted the height to make it smaller
            child: GestureDetector(
              onTap: () {
                // Handle button press
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          imagePath,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Color(0XFF083791),
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14, // Adjusted font size to fit smaller box
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
