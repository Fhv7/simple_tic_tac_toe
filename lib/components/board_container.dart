import 'package:flutter/material.dart';
import '../constants.dart';
import '../Classes/gamebrain.dart';

// Board's containers

class BoardContainer extends StatefulWidget {
  const BoardContainer({
    Key? key,
    required this.size,
    required this.gamebrain,
  }) : super(key: key);

  final Gamebrain gamebrain;
  final Size size;

  @override
  State<BoardContainer> createState() => _BoardContainerState();
}

class _BoardContainerState extends State<BoardContainer> {
  Widget content = const SizedBox.shrink();
  int id = 0;
  @override
  Widget build(BuildContext context) {
    id = identityHashCode(this);
    widget.gamebrain.orderedContainersID.add(id);
    return GestureDetector(
      onTap: () {
        setState(
          () {
            // As long as there are free spaces on the board, the player can click on a space
            // Depending on the active player, the spaces will be filled with a X or a O when the player taps on them
            if (widget.gamebrain.selectedSymbol.value == Symbol.cross &&
                widget.gamebrain.freeContainers > 0 &&
                (content != cross && content != circle)) {
              content = cross;
              widget.gamebrain.containers[id] = Symbol.cross;
              widget.gamebrain.lockContainer();

              if (widget.gamebrain.threeInLine()) {
                widget.gamebrain.text.value =
                    "Player 1 wins! Tap 'Reset' to play again.";
              } else if (widget.gamebrain.freeContainers != 0) {
                widget.gamebrain.nextTurn();
              }
            } else if (widget.gamebrain.selectedSymbol.value == Symbol.circle &&
                widget.gamebrain.freeContainers > 0 &&
                (content != cross && content != circle)) {
              content = circle;
              widget.gamebrain.containers[id] = Symbol.circle;
              widget.gamebrain.lockContainer();

              if (widget.gamebrain.threeInLine()) {
                widget.gamebrain.text.value =
                    "Player 2 wins! Tap 'Reset' to play again.";
              } else {
                widget.gamebrain.nextTurn();
              }
            }
          },
        );
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(10),
          ),
          height: widget.size.height * 0.1,
          width: widget.size.height * 0.1,
          child: content),
    );
  }
}
