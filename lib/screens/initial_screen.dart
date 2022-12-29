import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/components/appbar.dart';
import 'package:primeiro_projeto_alura/components/task.dart';
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
        child: ListView(
          children: const [
            Task(
              name: 'Aprender Flutter',
              photo: 'assets/images/dash.png',
              difficulty: 3,
            ),
            Task(
                name: 'Andar de Bike',
                photo: 'assets/images/bike.webp',
                difficulty: 2),
            Task(
              name: 'Meditar',
              photo: 'assets/images/meditar.jpeg',
              difficulty: 5,
            ),
            Task(
              name: 'Ler',
              photo: 'assets/images/livro.jpg',
              difficulty: 4,
            ),
            Task(
              name: 'Jogar',
              photo: 'assets/images/jogar.jpg',
              difficulty: 1,
            ),
            SizedBox(height: 72),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
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
