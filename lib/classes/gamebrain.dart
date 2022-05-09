import 'package:flutter/material.dart';
import '../constants.dart';

class Gamebrain {
  int freeContainers = 9;

  var selectedSymbol = ValueNotifier<Symbol>(Symbol.cross);
  var text = ValueNotifier<String>("Player 1's turn");

  List<int> orderedContainersID = [];
  Map<int, Symbol> containers = {};

  Gamebrain();

  void nextTurn() {
    selectedSymbol.value =
        selectedSymbol.value == Symbol.cross ? Symbol.circle : Symbol.cross;
    text.value = "Player ${selectedSymbol.value.index + 1}'s turn";
  }

  void lockContainer() {
    freeContainers -= 1;
  }

  bool threeInLine() {
    bool retVal = false;

    // Horizontal check

    for (int i = 0; i < 7; i += 3) {
      if (containers[orderedContainersID[i]] == selectedSymbol.value &&
          containers[orderedContainersID[i + 1]] == selectedSymbol.value &&
          containers[orderedContainersID[i + 2]] == selectedSymbol.value) {
        retVal = true;
        freeContainers = 0;
      }
    }

    // Vertical check

    for (int i = 0; i < 3; i++) {
      if (containers[orderedContainersID[i]] == selectedSymbol.value &&
          containers[orderedContainersID[i + 3]] == selectedSymbol.value &&
          containers[orderedContainersID[i + 6]] == selectedSymbol.value) {
        retVal = true;
        freeContainers = 0;
      }
    }

    // Main Diagonal check

    if (containers[orderedContainersID[0]] == selectedSymbol.value &&
        containers[orderedContainersID[4]] == selectedSymbol.value &&
        containers[orderedContainersID[8]] == selectedSymbol.value) {
      retVal = true;
      freeContainers = 0;
    }

    // Secondary Diagonal check

    if (containers[orderedContainersID[2]] == selectedSymbol.value &&
        containers[orderedContainersID[4]] == selectedSymbol.value &&
        containers[orderedContainersID[6]] == selectedSymbol.value) {
      retVal = true;
      freeContainers = 0;
    }

    if (retVal) {
      text.value =
          "Player ${selectedSymbol.value == Symbol.cross ? 1 : 2} wins";
    }

    if (!retVal && freeContainers == 0) {
      selectedSymbol.value = Symbol.none;
      text.value = "It's a tie! Tap 'Reset' to play again.";
    }

    return retVal;
  }
}
