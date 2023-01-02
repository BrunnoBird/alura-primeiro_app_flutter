// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  final VoidCallback onTapIcon;
  final VoidCallback onRefreshScreen;

  const AppBarCustom({
    Key? key,
    required this.onTapIcon,
    required this.onRefreshScreen,
  }) : super(key: key);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        InkWell(
          onTap: widget.onTapIcon,
          child: const Icon(Icons.remove_red_eye),
        ),
        IconButton(
          onPressed: widget.onRefreshScreen,
          icon: const Icon(Icons.refresh_rounded),
        ),
      ],
      title: const Text('Tarefas'),
    );
  }
}
