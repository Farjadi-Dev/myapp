import 'package:flutter/material.dart';
import 'question_list_screen.dart';

class ChapterListScreen extends StatefulWidget {
  @override
  _ChapterListScreenState createState() => _ChapterListScreenState();
}

class _ChapterListScreenState extends State<ChapterListScreen> {
  final List<String> chapters = List.generate(5, (index) => 'Chapter ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF000080), // Dark blue
                Color(0xFF6495ED), // Light blue
              ],
            ),
          ),
        ),
        title: const Text(
          'Select Chapter',
          style: TextStyle(
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(              
                elevation: 2.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(title: Text(chapters[index]), onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        QuestionListScreen(chapterTitle: chapters[index]),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ));
                })
            ),
          );
        },
      ),
    );
  }
}