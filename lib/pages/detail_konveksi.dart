import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/models/konveksi_model.dart';
import 'package:sandangs/widget/gridview/feed_gridview.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailKonveksi extends StatelessWidget {
  const DetailKonveksi({Key? key,required this.konveksi}) : super(key: key);
  final KonveksiElement konveksi;

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white
          ),
        ),
        title: const Text(
            'Profil Desainer',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            )
        ),
        backgroundColor: secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: size.height * 0.20,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/banner.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.white),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.09,
                    left: MediaQuery.of(context).size.width * 0.25,
                    right: MediaQuery.of(context).size.width * 0.25,
                    child: CircleAvatar(
                      radius: 88,
                      backgroundColor: const Color(0xFFFFFFFF),
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(konveksi.imgProfil),
                        radius: 80,
                      ),
                    )
                ),
              ],
            ),
            Container(height: size.height * 0.12),
            Column(
              children: <Widget>[
                Text(
                  konveksi.nama,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  konveksi.bio,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget> [
                    const Icon(
                        Icons.star_border,
                        color: Colors.black
                    ),
                    Text(
                        konveksi.rating + '/5 ',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                        )
                    ),
                    Container(width: size.width*0.08),
                    Row(
                      children: <Widget> [
                        const Icon(
                            Icons.task_outlined,
                            color: Colors.black
                        ),
                        Text(
                          konveksi.jmlhProject + ' ',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ], // <Widget>[]
                    ),
                    Container(width: size.width*0.08),
                    Row(
                      children: <Widget> [
                        ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                  Icons.chat_outlined,
                                  size: 20.0
                              ), // <-- Icon
                              Text(
                                ' Chat ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(secondaryColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: secondaryColor)
                              ),
                            ),
                          ),
                          onPressed: () => _launchURL(konveksi.linkWa),
                        ),
                      ], // <Widget>[]
                    ),
                  ], // <Widget>[]
                ),
                Container(height: size.height * 0.10),
              ],
            ),
            const GridViewFeeds(),
          ],
        ),
      ),
    );
  }
}