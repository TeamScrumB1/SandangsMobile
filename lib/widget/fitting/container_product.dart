import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/widget/fitting/moving_produk.dart';
import 'package:sandangs/widget/fitting/zoom_produk.dart';
import 'package:sandangs/widget/provider/fitting_room_provider.dart';
class ContainerProduk extends StatefulWidget {
  const ContainerProduk({
    Key? key,
    required this.busanaBawahan,
    required this.busanaAtasan,
    required this.fitur,
    required this.click,
  }) : super(key: key);
  final String busanaAtasan;
  final String busanaBawahan;
  final int fitur;
  final int click;

  @override
  State<ContainerProduk> createState() => _ContainerProdukState();
}

class _ContainerProdukState extends State<ContainerProduk> {
  Offset offsetAtasan = Offset(20, 20);
  Offset offsetBawahan = Offset(20, 80);
  double initalScale = 1.0;
  double scaleFactorAtas = 100;
  double scaleFactorBawah = 100;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fittingRoom = Provider.of<FittingRoomProv>(context,listen: true);
    int fiturku = 0;

    setState(() {
      fiturku = fittingRoom.getFitur();
    });

    return Container(
      height: size.height*0.5,
      width: size.width,
      margin: EdgeInsets.only(left: size.width*0.25,right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: secondaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            child: Positioned(
              top: offsetAtasan.dy,
              left: offsetAtasan.dx,
              child: fiturku == 1 ?
              GestureDetector(
                child: Image.asset(
                  widget.busanaAtasan,
                  fit: BoxFit.cover,
                  width: scaleFactorAtas,
                ),
                onScaleStart: (details){
                  initalScale = scaleFactorAtas;
                },
                onScaleUpdate: (details){
                  setState(() {
                    scaleFactorAtas = initalScale * details.scale;
                  });
                },
              ) : GestureDetector(
                child: Image.asset(
                  widget.busanaAtasan,
                  width: scaleFactorAtas,
                ),
                onPanUpdate: (details){
                  setState(() {
                    offsetAtasan = Offset(
                      offsetAtasan.dx+details.delta.dx,
                      offsetAtasan.dy+details.delta.dy,
                    );
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: offsetBawahan.dy,
            left: offsetBawahan.dx,
            child: fiturku == 1 ?
            GestureDetector(
              child: Image.asset(
                widget.busanaBawahan,
                fit: BoxFit.cover,
                width: scaleFactorBawah,
              ),
              onScaleStart: (details){
                initalScale = scaleFactorBawah;
              },
              onScaleUpdate: (details){
                setState(() {
                  scaleFactorBawah = initalScale * details.scale;
                });
              },
            ) : GestureDetector(
              child: Image.asset(
                widget.busanaBawahan,
                width: scaleFactorBawah,
              ),
              onPanUpdate: (details){
                setState(() {
                  offsetBawahan = Offset(
                    offsetBawahan.dx+details.delta.dx,
                    offsetBawahan.dy+details.delta.dy,
                  );
                });
              },
            ),
          ),////bawahan tampil
        ],
      ),
    );
  }
}