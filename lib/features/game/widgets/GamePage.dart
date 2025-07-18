import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnakeAndLadder'), centerTitle: true),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
