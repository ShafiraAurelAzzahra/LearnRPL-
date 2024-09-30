import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  final List<Quiz> quizList = [
    Quiz('Quiz 1', 'assets/images/img_premium_vector_114x152.png', 'Deskripsi Quiz 1'),
    Quiz('Quiz 2', 'assets/images/img_premium_vector_114x152.png', 'Deskripsi Quiz 2'),
    Quiz('Quiz 3', 'assets/images/img_premium_vector_114x152.png', 'Deskripsi Quiz 3'),
    Quiz('Quiz 4', 'assets/images/img_premium_vector_114x152.png', 'Deskripsi Quiz 4'),
    Quiz('Quiz 5', 'assets/images/img_premium_vector_114x152.png', 'Deskripsi Quiz 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0XFF083791),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: quizList.map((quiz) {
            return _buildQuizCard(context, quiz);
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

  Widget _buildQuizCard(BuildContext context, Quiz quiz) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailQuizPage(quiz: quiz),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFF083791),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                quiz.imagePath,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Text(
                quiz.judul,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 100,
        ),
      ),
    );
  }
}

class Quiz {
  final String judul;
  final String imagePath;
  final String deskripsi;

  Quiz(this.judul, this.imagePath, this.deskripsi);
}

class DetailQuizPage extends StatelessWidget {
  final Quiz quiz;

  DetailQuizPage({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.judul),
        backgroundColor: Color(0XFF083791),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(quiz.imagePath),
            SizedBox(height: 10),
            Text(
              quiz.deskripsi,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0XFF083791),
    );
  }
}
