import 'package:flutter/material.dart';

import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late final UnityWidgetController controller;

  @override
  Widget build(BuildContext context) {
    return UnityWidget(
      onUnityCreated: (controller) async {
        this.controller = controller;

        // try out some stuff here
        if (!(await controller.isLoaded())!) {
          controller.create();
        }
      },
      onUnityMessage: (msg) {
        print(msg);
      },
    );
  }
}
