import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/screens/question_detail_screen.dart';
import '../models/question.dart';

class QuestionListScreen extends StatelessWidget {
  final String chapterTitle;

  QuestionListScreen({required this.chapterTitle});

  // Example data for one chapter
 List<Question> getQuestionsForChapter() {
    int chapterNumber = int.tryParse(chapterTitle.split(' ').last) ?? 1; // Extract chapter number, default to 1 if parsing fails
    List<Question> questions = [];
    for (int i = 1; i <= 100; i++) {
      questions.add(Question.createPersianDemo(i)); // Using Persian demo questions
    }
    return questions;
  }

  @override
  Widget build(BuildContext context) {    
    final questions = getQuestionsForChapter();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chapterTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade50, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.5, // Make the boxes more compact horizontally
            ),
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final question = questions[index];
              return _buildQuestionCard(context, question, index + 1);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(BuildContext context, Question question, int index) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => QuestionDetailScreen(question: question),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.deepPurple.shade50],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.question_answer_rounded,
                color: Colors.deepPurple.shade300,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'سوال $index',  // Persian text
                style: const TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
