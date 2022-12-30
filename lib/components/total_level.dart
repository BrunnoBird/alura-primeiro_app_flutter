import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/data/total_level_inherited.dart';

class TotalLevel extends StatefulWidget {
  final int maxLevel;
  const TotalLevel({super.key, required this.maxLevel});

  @override
  State<TotalLevel> createState() => _TotalLevelState();
}

class _TotalLevelState extends State<TotalLevel> {
  @override
  Widget build(BuildContext context) {
    int actualLevel = TotalLevelInherited.of(context)!.totalLevel;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      child: SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text(
                'Nivel Total:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    value: (widget.maxLevel > 0) ? actualLevel / 100 : 1,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Level: ${actualLevel.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: InkWell(
                onTap: () {
                  setState(() {});
                },
                child: const Icon(
                  Icons.refresh,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
