import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; //default theme is light

  void taggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      home: MyHomePage(
        isDarkMode: isDarkMode,
        taggleTheme: taggleTheme,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, this.taggleTheme, required this.isDarkMode});

  final Function()? taggleTheme;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Theme',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: taggleTheme,
          icon: Icon(
            isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
        ),
      ),
    );
  }
}
