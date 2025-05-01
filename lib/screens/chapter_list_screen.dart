import 'package:flutter/material.dart';
import 'question_list_screen.dart';

class ChapterListScreen extends StatelessWidget {
  final List<String> chapters = List.generate(5, (index) => 'Chapter ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Chapter'),
      ),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chapters[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionListScreen(chapterTitle: chapters[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}