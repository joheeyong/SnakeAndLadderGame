import 'package:flutter/material.dart';

class BoardWidget extends StatelessWidget {
  final List<int> playerPositions;

  const BoardWidget({super.key, required this.playerPositions});

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = [];

    for (int row = 9; row >= 0; row--) {
      for (int col = 0; col < 10; col++) {
        int number = row.isEven
            ? (row * 10 + col + 1)
            : (row * 10 + (9 - col) + 1);

        List<Widget> tokens = [];
        for (int i = 0; i < playerPositions.length; i++) {
          if (playerPositions[i] + 1 == number) {
            tokens.add(_buildToken(i));
          }
        }

        tiles.add(
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              color: number % 2 == 0 ? Colors.blue[50] : Colors.white,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      number.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                ...tokens,
              ],
            ),
          ),
        );
      }
    }

    return AspectRatio(
      aspectRatio: 1,
      child: GridView.count(
        crossAxisCount: 10,
        children: tiles,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }

  Widget _buildToken(int playerIndex) {
    final colors = [Colors.red, Colors.green];
    return Align(
      alignment: playerIndex == 0
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      child: Container(
        width: 18,
        height: 18,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors[playerIndex % colors.length],
          border: Border.all(color: Colors.black, width: 1),
        ),
      ),
    );
  }
}
