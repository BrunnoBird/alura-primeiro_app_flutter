import 'package:flutter/material.dart';

class TotalLevelInherited extends InheritedWidget {
  TotalLevelInherited({super.key, required this.child}) : super(child: child);

  int totalLevel = 0;

  final Widget child;

  static TotalLevelInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TotalLevelInherited>();
  }

  void refreshTotalLevel(int level) {
    totalLevel += level;
  }

  void addTotalLevel() {
    totalLevel++;
  }

  @override
  bool updateShouldNotify(TotalLevelInherited oldWidget) {
    return oldWidget.totalLevel != oldWidget.totalLevel;
  }
}
