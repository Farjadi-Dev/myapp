import 'package:flutter/material.dart';
import '../models/question.dart';


class QuestionDetailScreen extends StatelessWidget {
  final Question question;

  const QuestionDetailScreen({Key? key, required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(question.questionText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(question.answerText, style: TextStyle(fontSize: 16,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}