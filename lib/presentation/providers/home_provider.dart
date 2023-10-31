import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final BuildContext context;

  HomeProvider({
    required this.context,
  });

  final fragmentController = PageController();
  final languages = [
    'Dart (5/5)',
    'Javascript (4/5)',
    'Php (4/5)',
    'Java (3/5)',
    'Kotlin (3/5)',
  ];
  final frameworks = [
    'Flutter (5/5)',
    'React (4/5)',
    'Vue (4/5)',
    'Laravel (5/5)',
    'Lumens (4/5)',
  ];

  final frameworkPan = ValueNotifier(
    const Offset(0.0, 0.0),
  );

  void changeFrameworkPanning(Offset offset) {
    frameworkPan.value = offset;
  }
}
