import 'package:flutter/material.dart';
import 'package:sandangs/api/api_top_konveksi.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/models/konveksi_model.dart';
import 'package:sandangs/pages/pilih_konveksi.dart';
import 'package:sandangs/widget/appbar_custom/appbar_tittle.dart';
import 'package:sandangs/widget/kategori/kategori_produk.dart';
import 'package:sandangs/widget/listview/vertical_list_konveksi.dart';

class KonveksiExplore extends StatefulWidget {
  const KonveksiExplore({Key? key}) : super(key: key);

  @override
  State<KonveksiExplore> createState() => _KonveksiExploreState();
}

class _KonveksiExploreState extends State<KonveksiExplore> {
  var keranjang;
  var state;
  var konveksi;
  var list;

  @override
  late Future<Konveksi> allKonveksiApi;

  @override
  void initState(){
    super.initState();
    allKonveksiApi = ApiServiceTopKonveksi().topHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTittle(),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              Text(
                "Explore Konveksi",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: secondaryColor,
                  fontSize: 25,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
              ),
              KategoriProduk(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Recommended',
                            style: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )
                        ),
                        Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PilihKonveksi())
                            );
                          },
                          child: Text(
                              'View All',
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FutureBuilder(
                            future: allKonveksiApi,
                            builder: (context, AsyncSnapshot<Konveksi> snapshot) {
                              state = snapshot.connectionState;
                              if (state != ConnectionState.done) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.konveksi.length,
                                    itemBuilder: (context, index) {
                                      konveksi = snapshot.data?.konveksi[index];
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return Scaffold();
                                                }));
                                          },
                                          child: VerticalListKonveksi(konveksi: konveksi!,)
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(child: Text(snapshot.error.toString()));
                                } else {
                                  return Text('');
                                }
                              }
                            },
                          )
                        ]
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}