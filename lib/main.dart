import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/data/task_inherited.dart';
import 'package:primeiro_projeto_alura/data/total_level_inherited.dart';
import 'package:primeiro_projeto_alura/screens/form_screen.dart';
import 'package:primeiro_projeto_alura/screens/initial_screen.dart';
import 'package:primeiro_projeto_alura/themes/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: TotalLevelInherited(
        child: const InitialScreen(),
      ),
    );
  }
}
