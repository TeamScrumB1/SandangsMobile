import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/widget/fitting/list_kategori.dart';
import 'package:sandangs/widget/provider/fitting_room_provider.dart';

class BottomNavbarFittingRoom extends StatefulWidget {
  BottomNavbarFittingRoom({Key? key}) : super(key: key);

  @override
  State<BottomNavbarFittingRoom> createState() => _BottomNavbarFittingRoomState();
}

class _BottomNavbarFittingRoomState extends State<BottomNavbarFittingRoom> {
  int status = 0;
  int checkAtasan = 0;
  int checkBawahan = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = 0;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fittingRoom = Provider.of<FittingRoomProv>(context,listen: true);
    setState(() {
      status = fittingRoom.getStatus();
    });
    return Container(
      margin: EdgeInsets.only(top:5,left: 10,right: 10,bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0.1,
          blurRadius: 0.1,
          offset: Offset(0,0.5),
        )],
      ),
      child: status == 0 ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            onPressed: ((){
              setState(() {
                checkAtasan = 0;
              });
            }),
            child: Container(
              width: size.width* 0.2,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: checkAtasan == 0? secondaryColor : Colors.white,
              ),
              child: Text(
                  kategoriList[0].name,
                  style : TextStyle(
                    color: checkAtasan == 0 ? Colors.white : secondaryColor,
                  )
              ),
            ),
          ),
          MaterialButton(
            onPressed: ((){
              setState(() {
                checkAtasan = 1;
              });
            }),
            child: Container(
              width: size.width* 0.2,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: checkAtasan == 1? secondaryColor : Colors.white,
              ),
              child: Text(
                  kategoriList[1].name,
                  style : TextStyle(
                    color: checkAtasan == 1 ? Colors.white : secondaryColor,
                  )
              ),
            ),
          ),
          MaterialButton(
            onPressed: ((){
              setState(() {
                checkAtasan = 2;
              });
            }),
            child: Container(
              width: size.width* 0.2,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: checkAtasan == 2? secondaryColor : Colors.white,
              ),
              child: Text(
                  kategoriList[2].name,
                  style : TextStyle(
                    color: checkAtasan == 2 ? Colors.white : secondaryColor,
                  )
              ),
            ),
          ),
        ],
      ) : Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            onPressed: ((){
              setState(() {
                checkBawahan = 0;
              });
            }),
            child: Container(
              width: size.width* 0.2,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: checkBawahan == 0? secondaryColor : Colors.white,
              ),
              child: Text(
                  kategoriList[3].name,
                  style : TextStyle(
                    color: checkBawahan == 0 ? Colors.white : secondaryColor,
                  )
              ),
            ),
          ),
          MaterialButton(
            onPressed: ((){
              setState(() {
                checkBawahan = 1;
              });
            }),
            child: Container(
              width: size.width* 0.2,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: checkBawahan == 1? secondaryColor : Colors.white,
              ),
              child: Text(
                  kategoriList[4].name,
                  style : TextStyle(
                    color: checkBawahan == 1 ? Colors.white : secondaryColor,
                  )
              ),
            ),
          ),
          MaterialButton(
            onPressed: ((){
              setState(() {
                checkBawahan = 2;
              });
            }),
            child: Container(
              width: size.width* 0.2,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: checkBawahan == 2? secondaryColor : Colors.white,
              ),
              child: Text(
                  kategoriList[5].name,
                  style : TextStyle(
                    color: checkBawahan == 2 ? Colors.white : secondaryColor,
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}