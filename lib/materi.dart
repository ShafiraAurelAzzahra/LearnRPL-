import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  final List<Materi> materiList = [
    Materi('Materi 1', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 1'),
    Materi('Materi 2', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 2'),
    Materi('Materi 3', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 3'),
    Materi('Materi 4', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 4'),
    Materi('Materi 5', 'assets/images/img_premium_vector.png', 'Deskripsi Materi 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Material',
          style: TextStyle(
            color: Colors.white, // White text color
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 20, // Optional: Change the size if required
          ),
        ),
        backgroundColor: Color(0XFF083791), // Keep the AppBar background color
         iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: materiList.map((materi) {
            return _buildMateriCard(context, materi);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: Color(0XFF083791),
  selectedItemColor: Colors.white, // Color for the selected item
  unselectedItemColor: Colors.white, // Color for unselected items
  items: const <BottomNavigationBarItem>[
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
)

    );
  }

  Widget _buildMateriCard(BuildContext context, Materi materi) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMateriPage(materi: materi),
          ),
        );
      },
      child: Container(
  decoration: BoxDecoration(
    color: Color(0XFF083791), // Set card background
    borderRadius: BorderRadius.circular(8), // Rounded corners
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2), // Shadow for depth
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start, // Align content to the top
    children: [
      ClipRRect( // Make the image follow the borderRadius
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), // Match the BoxDecoration border radius
          topRight: Radius.circular(8),
        ),
        child: Image.asset(
          materi.imagePath,
          width: double.infinity, // Make image fill the container width
          height: 100, // Adjust the height to make bottom shorter
          fit: BoxFit.cover, // Ensure the image covers the whole area
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0), // Reduce vertical padding
        child: Text(
          materi.judul,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255), // Text color
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
  constraints: BoxConstraints(
    minHeight: 100, // Minimum height for the container, adjust as needed
    maxHeight: 100, // Max height to ensure it's not too tall
  ),
)
    );
  }
}

class Materi {
  final String judul;
  final String imagePath;
  final String deskripsi;

  Materi(this.judul, this.imagePath, this.deskripsi);
}

class DetailMateriPage extends StatelessWidget {
  final Materi materi;

  DetailMateriPage({required this.materi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(materi.judul),
        backgroundColor: Color(0XFF083791),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(materi.imagePath),
            SizedBox(height: 10),
            Text(
              materi.deskripsi,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,  // Make the text bold
                color: Colors.white,          // Set the text color to white
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0XFF083791), // Adjust the background color to contrast with white text
    );
  }
}