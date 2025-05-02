import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/chapter_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    final lightColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    );
    
    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    );
    
    final lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: lightColorScheme.onBackground,
        displayColor: lightColorScheme.onBackground,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
    
    final darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: darkColorScheme.onBackground,
        displayColor: darkColorScheme.onBackground,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: darkColorScheme.surfaceVariant,
        foregroundColor: darkColorScheme.onSurfaceVariant,
        titleTextStyle: GoogleFonts.poppins(
          color: darkColorScheme.onSurfaceVariant,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );

    return MaterialApp(      
      title: 'Question App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: ChapterListScreen(),
      locale: const Locale('en', 'US'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fa', 'IR'),
      ],
      builder: (context, child) {
        return child!;
      },
    );
  }
}
