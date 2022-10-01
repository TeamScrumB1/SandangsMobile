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
    required this.click,
  }) : super(key: key);
  final String busanaAtasan;
  final String busanaBawahan;
  final int click;

  @override
  State<ContainerProduk> createState() => _ContainerProdukState();
}

class _ContainerProdukState extends State<ContainerProduk> {
  Offset offsetAtasan = Offset(20, 20);
  Offset offsetBawahan = Offset(20, 80);
  double initalScale = 1.0;
  double scaleFactorAtas = 150;
  double scaleFactorBawah = 150;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var fittingRoom = Provider.of<FittingRoomProv>(context, listen: true);
    int swap = 0;

    setState(() {
      swap = fittingRoom.getSwap();
    });

    return Container(
        height: size.height * 0.5,
        width: size.width,
        margin: EdgeInsets.only(left: size.width * 0.25, right: 10),
        decoration: BoxDecoration(
          border: Border.all(color: secondaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: swap == 0 ? Stack(
          children: [
            Container(
              width: size.width,
              height: size.height*0.4,
              margin: EdgeInsets.only(top: size.height*0.15),
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                minScale: 0.1,
                maxScale: 1.5,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    widget.busanaBawahan,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height*0.3,
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                minScale: 0.01,
                maxScale: 1.5,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    widget.busanaAtasan,
                  ),
                ),
              ),
            ),
          ],
        ) : Stack(
          children: [
            Container(
              width: size.width,
              height: size.height*0.3,
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                minScale: 0.01,
                maxScale: 1.5,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    widget.busanaAtasan,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height*0.4,
              margin: EdgeInsets.only(top: size.height*0.15),
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                minScale: 0.1,
                maxScale: 1.5,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    widget.busanaBawahan,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
// Positioned(
//   top: offsetAtasan.dy,
//   left: offsetAtasan.dx,
//   child: fiturku == 1 ?
//   GestureDetector(
//     child: Container(
//       width: scaleFactorAtas,
//       height: scaleFactorAtas,
//       child: Image.asset(
//         widget.busanaAtasan,
//       ),
//     ),
//     onScaleStart: (details) {
//       initalScale = scaleFactorAtas;
//     },
//     onScaleUpdate: (details) {
//       setState(() {
//         scaleFactorAtas = initalScale * details.scale;
//       });
//     },
//     // onDoubleTap: (){
//     //   setState(() {
//     //
//     //   });
//     // },
//   ) : GestureDetector(
//     child: Container(
//       width: scaleFactorAtas,
//       height: scaleFactorAtas,
//       child: Image.asset(
//         widget.busanaAtasan,
//       ),
//     ),
//     onPanUpdate: (details) {
//       setState(() {
//         offsetAtasan = Offset(
//           offsetAtasan.dx + details.delta.dx,
//           offsetAtasan.dy + details.delta.dy,
//         );
//       });
//     },
//     // onDoubleTap: (){
//     //   setState(() {
//     //     arrBusana.removeAt(0);
//     //     arrBusana.add(element);
//     //   });
//     // },
//   ),
// ),
// Positioned(
//   top: offsetBawahan.dy,
//   left: offsetBawahan.dx,
//   child: fiturku == 1 ?
//   GestureDetector(
//     child: Container(
//       width: scaleFactorBawah,
//       height: scaleFactorBawah,
//       child: Image.asset(
//         widget.busanaBawahan,
//       ),
//     ),
//     onScaleStart: (details) {
//       initalScale = scaleFactorBawah;
//     },
//     onScaleUpdate: (details) {
//       setState(() {
//         scaleFactorBawah = initalScale * details.scale;
//       });
//     },
//     // onDoubleTap: (){
//     //   setState(() {
//     //     arrBusana.removeAt(0);
//     //     arrBusana.add(element);
//     //   });
//     // },
//   ) : GestureDetector(
//     child: Container(
//       width: scaleFactorBawah,
//       height: scaleFactorBawah,
//       child: Image.asset(
//           widget.busanaBawahan
//       ),
//     ),
//     onPanUpdate: (details) {
//       setState(() {
//         offsetBawahan = Offset(
//           offsetBawahan.dx + details.delta.dx,
//           offsetBawahan.dy + details.delta.dy,
//         );
//       });
//     },
//     // onDoubleTap: (){
//     //   setState(() {
//     //     arrBusana.removeAt(0);
//     //     arrBusana.add(element);
//     //   });
//     // },
//   ),
// ),