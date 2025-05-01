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
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemCount: questions.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final question = questions[index];
            return _buildQuestionCard(context, question, index + 1);
          },
        ),
      ),
    );
  }

  Widget _buildQuestionCard(BuildContext context, Question question, int index) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => QuestionDetailScreen(question: question),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Question $index',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
