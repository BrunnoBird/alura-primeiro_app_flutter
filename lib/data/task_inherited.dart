import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/components/task.dart';
//Gerenciador de Estados.

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final List<Task> taskList = [
    Task(
      name: 'Aprender Flutter',
      photo: 'assets/images/dash.png',
      difficulty: 3,
    ),
    Task(
        name: 'Andar de Bike', photo: 'assets/images/bike.webp', difficulty: 2),
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
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(
      Task(
        name: name,
        photo: photo,
        difficulty: difficulty,
      ),
    );
  }

  final Widget child;

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  //Quem fica de olho no estado e notifica mudanças de estado.
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    //Acesso no estado anterior e estado novo.
    return oldWidget.taskList.length != taskList.length;
  }
}
