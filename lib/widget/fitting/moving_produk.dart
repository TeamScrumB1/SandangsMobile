import 'package:flutter/material.dart';

class MovingProduk extends StatefulWidget {
  MovingProduk({
    Key? key,
    required this.busana,
    required this.offset,
  }) : super(key: key);
  final String busana;
  Offset offset;

  @override
  State<MovingProduk> createState() => _MovingProdukState();
}

class _MovingProdukState extends State<MovingProduk> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        widget.busana,
      ),
      onPanUpdate: (details){
        setState(() {
          widget.offset = Offset(
            widget.offset.dx+details.delta.dx,
            widget.offset.dy+details.delta.dy,
          );
        });
      },
    );
  }
}
