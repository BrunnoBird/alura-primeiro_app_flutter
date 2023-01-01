import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/components/appbar.dart';
import 'package:primeiro_projeto_alura/components/task.dart';
import 'package:primeiro_projeto_alura/components/total_level.dart';
import 'package:primeiro_projeto_alura/data/task_dao.dart';
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: FutureBuilder<List<Task>>(
                    future: TaskDao().findAll(),
                    //Itens que vão ser renderizdos.
                    builder: (context, snapshot) {
                      List<Task>? items = snapshot.data;
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(
                            child: Column(
                              children: const [
                                CircularProgressIndicator(),
                                Text('Carregando...'),
                              ],
                            ),
                          );
                        case ConnectionState.waiting:
                          return Center(
                            child: Column(
                              children: const [
                                CircularProgressIndicator(),
                                Text('Carregando...'),
                              ],
                            ),
                          );
                        case ConnectionState.active:
                          return Center(
                            child: Column(
                              children: const [
                                CircularProgressIndicator(),
                                Text('Carregando...'),
                              ],
                            ),
                          );
                        case ConnectionState.done:
                          if (snapshot.hasData && items != null) {
                            if (items.isNotEmpty) {
                              return ListView.builder(
                                  itemCount: items.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final Task tarefa = items[index];
                                    return tarefa;
                                  });
                            }
                            return Center(
                              child: Column(
                                children: const [
                                  Icon(Icons.error_outline, size: 128),
                                  Text(
                                    'Não há nenhuma tarefa',
                                    style: TextStyle(
                                      fontSize: 32,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return const Text('Erro ao carregar tarefas');
                      }
                    }),
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
