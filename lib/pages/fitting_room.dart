import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/widget/appbar_custom/appbar.dart';
import 'package:sandangs/widget/fitting/container_product.dart';
import 'package:sandangs/widget/fitting/kategori_produk_fitting.dart';
import 'package:sandangs/widget/provider/fitting_room_provider.dart';

class FittingRoom extends StatefulWidget {
  const FittingRoom({Key? key}) : super(key: key);

  @override
  State<FittingRoom> createState() => _FittingRoomState();
}

class _FittingRoomState extends State<FittingRoom> {
  int click = 0;
  int swap = 0;
  String busanaAtasan = "";
  String busanaBawahan = "";

  @override
  void initState() {
    super.initState();
    busanaAtasan = "lib/assets/images/jaket.png";
    busanaBawahan = "lib/assets/images/celana.png";
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fittingRoom = Provider.of<FittingRoomProv>(context, listen: true);

    return Scaffold(
      appBar: const AppBarApps(),
      body: ListView(
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  ContainerProduk(
                    busanaAtasan: busanaAtasan,
                    busanaBawahan: busanaBawahan,
                    click: click,
                  ),
                  Container(
                    height: size.height*0.5,
                    width: size.width*0.25,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text('Busana'),
                        ),
                        CircleAvatar(
                            radius: 35,
                            backgroundColor: click == 0? secondaryColor : Color(0xD5C4C4C4),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  click = 0;
                                  fittingRoom.setStatus(click);
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(busanaAtasan),
                                radius: 32,
                              ),
                            )
                        ),
                        SizedBox(height: 5),
                        CircleAvatar(
                            radius: 35,
                            backgroundColor: click == 1 ? secondaryColor : Color(0xD5C4C4C4),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  click = 1;
                                  fittingRoom.setStatus(click);
                                });
                                print("Click event on Container");
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(busanaBawahan),
                                radius: 32,
                              ),
                            )
                        ),
                        SizedBox(height: 5),
                        Container(
                          margin: EdgeInsets.only(top: 10,bottom: 5),
                          child: Text('Swap'),
                        ),//ikon pilihan bawahan
                        CircleAvatar(
                            radius: 35,
                            backgroundColor: secondaryColor,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if(swap == 0){
                                    swap = 1;
                                  } else {
                                    swap = 0;
                                  }
                                  fittingRoom.setSwap(swap);
                                });
                              },
                              child: CircleAvatar(
                                child: Icon(Icons.zoom_out_map),
                                backgroundColor: Colors.white,
                                radius: 32,
                              ),
                            )
                        ),
                        // SizedBox(height: 5),
                        // CircleAvatar(
                        //     radius: 35,
                        //     backgroundColor: fitur == 1 ? secondaryColor : Color(0xD5C4C4C4),
                        //     child: InkWell(
                        //       onTap: () {
                        //         setState(() {
                        //           fitur = 1;
                        //           fittingRoom.setFitur(fitur);
                        //         });
                        //       },
                        //       child: CircleAvatar(
                        //         backgroundColor: Colors.white,
                        //         radius: 32,
                        //         child: Icon(Icons.zoom_in),
                        //       ),
                        //     )
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              BottomNavbarFittingRoom(),
              Container(
                height: 150.0,
                margin: EdgeInsets.only(left: 12),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 2,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: size.height*0.001),
                                height: size.height * 0.15,
                                width: size.width * 1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('lib/assets/images/kaos.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          busanaAtasan = 'lib/assets/images/kaos.png';
                        });
                      },
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 2,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: size.height*0.001),
                                height: size.height * 0.15,
                                width: size.width * 1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('lib/assets/images/jaket.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          busanaAtasan = 'lib/assets/images/jaket.png';
                        });
                      },
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 2,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: size.height*0.001),
                                height: size.height * 0.15,
                                width: size.width * 1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('lib/assets/images/rok.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          busanaBawahan = 'lib/assets/images/rok.png';
                        });
                      },
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 2,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: size.height*0.001),
                                height: size.height * 0.15,
                                width: size.width * 1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('lib/assets/images/batik.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          busanaAtasan = 'lib/assets/images/batik.png';
                        });
                      },
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 2,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: size.height*0.001),
                                height: size.height * 0.15,
                                width: size.width * 1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('lib/assets/images/celanapendek.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          busanaBawahan = 'lib/assets/images/celanapendek.png';
                        });
                      },
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 2,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: size.height*0.001),
                                height: size.height * 0.15,
                                width: size.width * 1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('lib/assets/images/jeans.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          busanaBawahan = 'lib/assets/images/jeans.png';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],

      )
    );
  }
}
