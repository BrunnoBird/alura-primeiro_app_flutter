// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  final VoidCallback onTapIcon;

  const AppBarCustom({
    Key? key,
    required this.onTapIcon,
  }) : super(key: key);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: widget.onTapIcon,
            child: const Icon(Icons.remove_red_eye),
          ),
        ),
      ],
      title: const Text('Tarefas'),
    );
  }
}
