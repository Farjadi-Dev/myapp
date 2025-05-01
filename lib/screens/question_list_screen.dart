import 'package:flutter/material.dart';
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
      questions.add(Question(questionText: 'This is the content of Question $i', answerText: 'This is the answer to Question $i'));
    }
    return questions;
  }

  @override
  Widget build(BuildContext context) {
    final questions = getQuestionsForChapter();
    return Scaffold(
      appBar: AppBar(
        title: Text(chapterTitle),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionDetailScreen(question: question),
                  ),
                );
              },
              child: Text('Question ${index + 1}'),            
            ),
          );
        },
      )
    );
  }
}
