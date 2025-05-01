import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/chapter_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    );
    final darkTheme = ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.montserratTextTheme().apply(
          bodyColor: darkColorScheme.onBackground,
          displayColor: darkColorScheme.onBackground,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: darkColorScheme.surfaceVariant,
            foregroundColor: darkColorScheme.onSurfaceVariant,
            titleTextStyle: TextStyle(
                color: darkColorScheme.onSurfaceVariant,
                fontSize: 20,
                fontWeight: FontWeight.bold)));

    return MaterialApp(      
        title: 'Question App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        home: ChapterListScreen());
  }
}
