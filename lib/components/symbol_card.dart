import 'package:flutter/material.dart';

class SymbolCard extends StatelessWidget {
  const SymbolCard({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final Icon icon;
  final Color color;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: icon,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
