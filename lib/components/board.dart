import 'package:flutter/material.dart';
import 'board_container.dart';
import '../Classes/gamebrain.dart';

// tic tac toe board

class Board extends StatefulWidget {
  const Board({
    Key? key,
    required this.size,
    required this.gamebrain,
  }) : super(key: key);

  final Gamebrain gamebrain;
  final Size size;

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  bool cardPressed = false;
  @override
  Widget build(BuildContext context) {

    // A row of containers

    Row containersRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoardContainer(
          size: widget.size,
          gamebrain: widget.gamebrain,
        ),
        const SizedBox(width: 8),
        BoardContainer(
          size: widget.size,
          gamebrain: widget.gamebrain,
        ),
        const SizedBox(width: 8),
        BoardContainer(
          size: widget.size,
          gamebrain: widget.gamebrain,
        ),
      ],
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        containersRow,
        const SizedBox(height: 6),
        containersRow,
        const SizedBox(height: 6),
        containersRow,
      ],
    );
  }
}
