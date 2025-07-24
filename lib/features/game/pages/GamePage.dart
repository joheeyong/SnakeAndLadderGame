import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snakeandladder/features/game/pages/widgets/board_widget.dart';
import 'package:snakeandladder/features/game/pages/widgets/dice_widget.dart';

import '../bloc/game_bloc.dart';
import '../bloc/game_event.dart';
import '../bloc/game_state.dart';


class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snake & Ladder'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              List<int> positions = [1, 1];
              int currentPlayer = 0;
              int? value;
              bool isRolling = false;

              if (state is GameInProgress) {
                positions = state.playerPositions;
                currentPlayer = state.currentPlayerIndex;
                value = state.lastRolledValue;
                isRolling = state.isRolling;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: BoardWidget(playerPositions: positions),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DiceWidget(value: value, isRolling: isRolling),
                  const SizedBox(height: 8),
                  Text(
                    'Player ${currentPlayer + 1}\'s Turn',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: isRolling
                        ? null
                        : () {
                      context.read<GameBloc>().add(DiceRolled());
                    },
                    child: const Text('Roll Dice'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
