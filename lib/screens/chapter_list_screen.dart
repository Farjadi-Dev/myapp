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
        ),
      ),
      body: ListView.builder(
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            print('Building item at index: $index');
            return Padding( // Padding Widget start
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding
              child: Card( // Card Widget start
                elevation: 2.0, // Card elevation
                shape: RoundedRectangleBorder( // Card Shape
                  borderRadius: BorderRadius.circular(10.0), // Card border radius
                ),
                child: ListTile( // ListTile start
                  title: Text(chapters[index]), // ListTile title
                  onTap: () { // ListTile onTap
                    Navigator.push( // Navigator push
                      context, // context
                      PageRouteBuilder( // PageRouteBuilder
                        pageBuilder: (context, animation, secondaryAnimation) => QuestionListScreen(chapterTitle: chapters[index]),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
                      ), // PageRouteBuilder
                    ); // Navigator push
                  },
                ), // ListTile end
              ), // Card Widget end
            ); // Padding Widget end
          },
        ),
      );

  }
}

