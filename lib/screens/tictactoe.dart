import 'package:flutter/material.dart';
import '../components/board.dart';
import '../constants.dart';
import '../components/symbol_card.dart';
import '../Classes/gamebrain.dart';

// Main Screen

Gamebrain gamebrain = Gamebrain();

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.12),

          // Symbol Selection

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: gamebrain.selectedSymbol,
                builder: (context, value, widget) {
                  return SymbolCard(
                    icon: cross,
                    // The color of the card changes whenever a player finishes their turn
                    color: gamebrain.selectedSymbol.value == Symbol.cross
                        ? const Color.fromARGB(255, 75, 73, 73)
                        : const Color.fromARGB(255, 53, 51, 51),
                  );
                },
              ),
              SizedBox(width: size.width * 0.05),
              ValueListenableBuilder(
                valueListenable: gamebrain.selectedSymbol,
                builder: (context, value, widget) {
                  return SymbolCard(
                    icon: circle,
                    // The color of the card changes whenever a player finishes their turn
                    color: gamebrain.selectedSymbol.value == Symbol.circle
                        ? const Color.fromARGB(255, 75, 73, 73)
                        : const Color.fromARGB(255, 53, 51, 51),
                  );
                },
              ),
            ],
          ),

          SizedBox(height: size.height * 0.025),

          ValueListenableBuilder(
              valueListenable: gamebrain.text,
              builder: (context, value, widget) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    gamebrain.selectedSymbol.value == Symbol.cross
                        ? cross
                        : circle,
                    SizedBox(width: size.width * 0.009),
                    Text(
                      gamebrain.text.value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                );
              }),

          // Game Board

          SizedBox(height: size.height * 0.09),
          Board( size: size, gamebrain: gamebrain ),
          SizedBox(height: size.height * 0.1),

          // Reset Button

          ElevatedButton(
            onPressed: () async {
              await Future.delayed(const Duration(milliseconds: 150));
              Navigator.of(context).pop();
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder:
                      (BuildContext context, animation, secondaryAnimation) {
                    return const TicTacToe();
                  },
                ),
              );
              gamebrain = Gamebrain();
            },
            child: const Text("Reset"),
          )
        ],
      ),
      
    );
  }
}
