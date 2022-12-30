import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/components/appbar.dart';
import 'package:primeiro_projeto_alura/components/total_level.dart';
import 'package:primeiro_projeto_alura/data/task_inherited.dart';
import 'package:primeiro_projeto_alura/data/total_level_inherited.dart';
import 'package:primeiro_projeto_alura/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacityTask = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBarCustom(
          onTapIcon: () => {
            setState(() {
              opacityTask = !opacityTask;
            }),
          },
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacityTask ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: Column(
          children: [
            const TotalLevel(maxLevel: 100),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 70),
                children: TaskInherited.of(context)!.taskList,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
