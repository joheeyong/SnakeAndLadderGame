import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snakeandladder/features/game/bloc/game_event.dart';
import 'package:snakeandladder/features/game/bloc/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final _random = Random();
  List<int> _positions = [0, 0];
  int _currentPlayer = 0;

  GameBloc()
      : super(
    GameInProgress(
      playerPositions: [0, 0],
      currentPlayerIndex: 0,
      lastRolledValue: null,
      isRolling: false,
    ),
  ) {
    on<DiceRolled>(_onDiceRolled); // Placeholder logic for dice roll
  }

  Future<void> _onDiceRolled(DiceRolled event, Emitter<GameState> emit) async {
    emit(
      GameInProgress(
        playerPositions: List.from(_positions),
        currentPlayerIndex: _currentPlayer,
        lastRolledValue: null,
        isRolling: true,
      ),
    );

    await Future.delayed(const Duration(milliseconds: 800));
    final rolledValue = _random.nextInt(6) + 1;

    int newPosition = _positions[_currentPlayer] + rolledValue;
    if (newPosition <= 99) {
      _positions[_currentPlayer] = newPosition;
    }

    int nextPlayer = (_currentPlayer + 1) % _positions.length;
    _currentPlayer = nextPlayer;

    emit(
      GameInProgress(
        playerPositions: List.from(_positions),
        currentPlayerIndex: _currentPlayer,
        lastRolledValue: rolledValue,
        isRolling: false,
      ),
    );
  }
}
