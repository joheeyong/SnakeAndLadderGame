abstract class GameState {
  const GameState();
}

// Initial state
class GameInitial extends GameState {}

class DiceRollInProgress extends GameState {}

class DiceRollResult extends GameState {
  final int value;

  const DiceRollResult(this.value);
}

class GameInProgress extends GameState {
  final List<int> playerPositions;
  final int currentPlayerIndex;
  final int? lastRolledValue;
  final bool isRolling;

  const GameInProgress({
    required this.playerPositions,
    required this.currentPlayerIndex,
    this.lastRolledValue,
    required this.isRolling,
  });
}
